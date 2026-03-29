from fastapi import FastAPI, WebSocket
from fastapi.responses import JSONResponse

from backend.db import check_connection

app = FastAPI(title="NOVA Local")


@app.get("/")
def root() -> JSONResponse:
    return JSONResponse({"status": "NOVA backend running"})


@app.get("/health")
def health() -> JSONResponse:
    db_ok = False
    try:
        db_ok = check_connection()
    except Exception:
        db_ok = False
    return JSONResponse({"ok": True, "db": db_ok})


@app.websocket("/ws")
async def ws(websocket: WebSocket) -> None:
    await websocket.accept()
    await websocket.send_text("connected")
    while True:
        msg = await websocket.receive_text()
        await websocket.send_text(f"echo:{msg}")
