import psycopg2

DATABASE_URL = "postgresql://agencia_user:nJOYhEezHqc10qUKCagvCi0GLTwSs8i8@dpg-d6jvemfkijhs73dfb82g-a.oregon-postgres.render.com/agencia_r0dv"

conn = psycopg2.connect(DATABASE_URL)
cur = conn.cursor()

cur.execute("""
CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    apellidos TEXT,
    celular TEXT,
    referencia TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS reservaciones (
    id SERIAL PRIMARY KEY,
    fecha_creacion TEXT,
    cliente_id INTEGER,
    tipo_reservacion TEXT,
    descripcion TEXT,
    proveedor TEXT,
    costo_cliente REAL,
    costo_proveedor REAL,
    utilidad REAL,
    estatus TEXT,
    producto_reservado TEXT,
    devolucion_cliente REAL DEFAULT 0,
    saldo_a_favor REAL DEFAULT 0,
    penalidad_proveedor REAL DEFAULT 0,
    penalidad_agencia REAL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS reservacion_hotel (
    id SERIAL PRIMARY KEY,
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
    observacion_pagos TEXT,
    hotel TEXT
);
""")

conn.commit()
cur.close()
conn.close()

print("TABLAS CREADAS EN POSTGRESQL")