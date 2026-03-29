#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
CODEX_DIR="$ROOT_DIR/codex"
RUNBOOK="$CODEX_DIR/RUNBOOK.md"
LOG_DIR="$ROOT_DIR/logs"
VENV_DIR="$ROOT_DIR/.venv"
ENV_FILE="$ROOT_DIR/.env"

mkdir -p "$LOG_DIR"

log() { printf '[build] %s\n' "$*"; }
fail() { printf '[build][error] %s\n' "$*" >&2; exit 1; }

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "missing required command: $1"
}

wait_for_port() {
  local host="$1" port="$2" retries="${3:-30}"
  for _ in $(seq 1 "$retries"); do
    if (echo >"/dev/tcp/$host/$port") >/dev/null 2>&1; then
      return 0
    fi
    sleep 1
  done
  return 1
}

load_env() {
  if [[ ! -f "$ENV_FILE" ]]; then
    cp "$ROOT_DIR/.env.example" "$ENV_FILE"
  fi
  # shellcheck disable=SC1090
  set -a; source "$ENV_FILE"; set +a
  : "${BACKEND_PORT:=8000}" "${FRONTEND_PORT:=3000}"
}

start_postgres() {
  if command -v docker >/dev/null 2>&1; then
    if docker compose version >/dev/null 2>&1; then
      docker compose -f "$ROOT_DIR/docker-compose.yml" up -d postgres
    elif command -v docker-compose >/dev/null 2>&1; then
      docker-compose -f "$ROOT_DIR/docker-compose.yml" up -d postgres
    else
      fail "docker found but compose is unavailable"
    fi
    log "waiting for postgres on :5432"
    wait_for_port 127.0.0.1 5432 60 || fail "postgres did not start"
    return
  fi

  log "docker not found; checking for local postgres on :5432"
  wait_for_port 127.0.0.1 5432 2 || fail "postgres unavailable (install docker or start local postgres on 5432)"
}

setup_backend() {
  require_cmd python3
  python3 -m venv "$VENV_DIR"
  "$VENV_DIR/bin/pip" install --upgrade pip
  "$VENV_DIR/bin/pip" install -r "$ROOT_DIR/backend/requirements.txt"
}

start_backend() {
  if ! wait_for_port 127.0.0.1 "${BACKEND_PORT}" 1; then
    nohup "$VENV_DIR/bin/uvicorn" backend.main:app --host 0.0.0.0 --port "${BACKEND_PORT}" >"$LOG_DIR/backend.log" 2>&1 &
  fi
  wait_for_port 127.0.0.1 "${BACKEND_PORT}" 30 || fail "backend failed to start"
}

setup_frontend() {
  require_cmd node
  require_cmd npm
  (cd "$ROOT_DIR/frontend" && npm install --silent)
}

start_frontend() {
  if ! wait_for_port 127.0.0.1 "${FRONTEND_PORT}" 1; then
    nohup npm --prefix "$ROOT_DIR/frontend" run start >"$LOG_DIR/frontend.log" 2>&1 &
  fi
  wait_for_port 127.0.0.1 "${FRONTEND_PORT}" 30 || fail "frontend failed to start"
}

validate_runtime() {
  require_cmd curl
  curl -fsS "http://127.0.0.1:${BACKEND_PORT}/health" >/dev/null
  curl -fsS "http://127.0.0.1:${FRONTEND_PORT}" >/dev/null
}

create_placeholder_structure() {
  mkdir -p "$ROOT_DIR/backend" "$ROOT_DIR/frontend" "$ROOT_DIR/infra" "$ROOT_DIR/docker"
}

run_step() {
  local step="$1"
  case "$step" in
    00)
      load_env
      create_placeholder_structure
      start_postgres
      setup_backend
      setup_frontend
      ;;
    01)
      load_env
      create_placeholder_structure
      ;;
    02)
      load_env
      "$VENV_DIR/bin/python" - <<'PY'
from sqlalchemy import create_engine, text
import os
url = os.getenv("DATABASE_URL", "postgresql+psycopg2://postgres:postgres@localhost:5432/nova")
engine = create_engine(url)
with engine.begin() as conn:
    conn.execute(text("CREATE TABLE IF NOT EXISTS healthcheck (id SERIAL PRIMARY KEY, created_at TIMESTAMPTZ DEFAULT now())"))
PY
      ;;
    03|04|05|06|07|08|09|10|11|12|13|14|15|16)
      load_env
      ;;
    *) fail "unknown step: $step" ;;
  esac

  if [[ "$step" =~ ^(01|03|04|05|06|07|08|09|10|11|12|13|14|15|16)$ ]]; then
    start_backend
    start_frontend
    validate_runtime
  fi

  if [[ "$step" == "02" ]]; then
    validate_runtime
  fi
}

parse_steps() {
  awk '
    /^### STEP [0-9][0-9] —/ {step=$3}
    /^File: `\/codex\// {gsub("`","",$2); print step":"$2}
  ' "$RUNBOOK"
}

main() {
  [[ -f "$RUNBOOK" ]] || fail "missing runbook: $RUNBOOK"
  log "starting deterministic build from $RUNBOOK"

  while IFS=: read -r step file; do
    [[ -n "$step" ]] || continue
    [[ -f "$ROOT_DIR$file" ]] || fail "missing step file: $file"
    log "STEP $step -> $file"
    run_step "$step"
  done < <(parse_steps)

  log "build complete. backend=http://127.0.0.1:${BACKEND_PORT:-8000} frontend=http://127.0.0.1:${FRONTEND_PORT:-3000}"
}

main "$@"
