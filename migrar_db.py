import sqlite3
import psycopg2

print("Iniciando migración...")

# SQLite
sqlite_conn = sqlite3.connect("agencia.db")
sqlite_cursor = sqlite_conn.cursor()

# PostgreSQL
pg_conn = psycopg2.connect("postgresql://agencia_db_eqri_user:WAdK9a3xBhgdS8bSbgOd4HmvbJ62auw4@dpg-d6l6j6ma2pns73br875g-a.oregon-postgres.render.com/agencia_db_eqri")
pg_cursor = pg_conn.cursor()

# obtener tablas
sqlite_cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = sqlite_cursor.fetchall()

for table in tables:

    table_name = table[0]

    if table_name == "sqlite_sequence":
        continue

    print("Migrando tabla:", table_name)

    # obtener columnas
    sqlite_cursor.execute(f"PRAGMA table_info({table_name})")
    columns = sqlite_cursor.fetchall()

    column_names = [col[1] for col in columns]

    cols = ",".join(column_names)
    placeholders = ",".join(["%s"] * len(column_names))

    # obtener datos
    sqlite_cursor.execute(f"SELECT * FROM {table_name}")
    rows = sqlite_cursor.fetchall()

    for row in rows:
        try:
            pg_cursor.execute(
                f"INSERT INTO {table_name} ({cols}) VALUES ({placeholders})",
                row
            )
        except Exception as e:
            print("Error en tabla", table_name, e)
            pg_conn.rollback()
pg_conn.commit()

print("Migración terminada")

sqlite_conn.close()
pg_conn.close()