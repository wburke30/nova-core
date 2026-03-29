import os
from sqlalchemy import create_engine, text
from sqlalchemy.engine import Engine


def database_url() -> str:
    return os.getenv("DATABASE_URL", "postgresql+psycopg2://postgres:postgres@localhost:5432/nova")


def engine() -> Engine:
    return create_engine(database_url(), pool_pre_ping=True)


def check_connection() -> bool:
    with engine().connect() as conn:
        conn.execute(text("SELECT 1"))
    return True
