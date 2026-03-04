import os
import sqlite3
import psycopg2


def get_db():

    DATABASE_URL = os.environ.get("DATABASE_URL")

    # Si existe conexión a PostgreSQL (Render)
    if DATABASE_URL:

        if DATABASE_URL.startswith("postgres://"):
            DATABASE_URL = DATABASE_URL.replace("postgres://", "postgresql://", 1)

        conn = psycopg2.connect(DATABASE_URL)
        return conn

    # Si no existe (modo local)
    else:
        conn = sqlite3.connect("agencia.db")
        conn.row_factory = sqlite3.Row
        return conn