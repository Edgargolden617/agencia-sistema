import psycopg2

DATABASE_URL = "postgresql://agencia_db_eqri_user:WAdK9a3xBhgdS8bSbgOd4HmvbJ62auw4@dpg-d6l6j6ma2pns73br875g-a.oregon-postgres.render.com/agencia_db_eqri"

conn = psycopg2.connect(DATABASE_URL)
cur = conn.cursor()

print("Limpiando base PostgreSQL...")

cur.execute("""
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
""")

conn.commit()
conn.close()

print("Base limpia.")