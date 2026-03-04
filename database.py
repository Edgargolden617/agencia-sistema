import sqlite3

conn = sqlite3.connect("agencia.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    apellidos TEXT,
    celular TEXT,
    referencia TEXT
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS reservaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha_creacion TEXT,
    cliente_id INTEGER,
    tipo_reservacion TEXT,
    descripcion TEXT,
    proveedor TEXT,
    costo_cliente REAL,
    costo_proveedor REAL,
    utilidad REAL,
    estatus TEXT
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS reservacion_hotel (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservacion_id INTEGER,
    ciudad TEXT,
    fecha_entrada TEXT,
    fecha_salida TEXT,
    habitaciones INTEGER,
    tipo_habitacion TEXT,
    menores INTEGER,
    plan TEXT,
    tiempo_limite TEXT,
    observaciones TEXT,
    clave_proveedor TEXT,
    clave_hotel TEXT,
    observacion_pagos TEXT
)
""")

conn.commit()
conn.close()

print("Base de datos creada correctamente")