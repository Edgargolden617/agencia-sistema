import sqlite3

conn = sqlite3.connect("agencia.db")
cursor = conn.cursor()

try:
    cursor.execute("ALTER TABLE reservacion_hotel ADD COLUMN hotel TEXT")
    print("✅ Columna 'hotel' agregada correctamente")
except sqlite3.OperationalError as e:
    print("⚠️ Aviso:", e)

conn.commit()
conn.close()