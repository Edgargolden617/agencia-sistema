import psycopg2

DATABASE_URL = "postgresql://agencia_user:nJOYhEezHqc10qUKCagvCi0GLTwSs8i8@dpg-d6jvemfkijhs73dfb82g-a.oregon-postgres.render.com/agencia_r0dv"

conn = psycopg2.connect(DATABASE_URL)
cursor = conn.cursor()

cursor.execute("""
ALTER TABLE pagos
ADD COLUMN tarjeta_id INTEGER;
""")

conn.commit()
conn.close()

print("Columna tarjeta_id agregada")