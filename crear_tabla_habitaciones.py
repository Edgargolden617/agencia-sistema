import sqlite3

conn = sqlite3.connect("agencia.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS habitaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservacion_id INTEGER NOT NULL,
    habitacion_num INTEGER NOT NULL,
    adultos INTEGER,
    menores INTEGER,
    edades TEXT,
    FOREIGN KEY (reservacion_id) REFERENCES reservaciones(id)
)
""")

conn.commit()
conn.close()

print("Tabla habitaciones creada correctamente")