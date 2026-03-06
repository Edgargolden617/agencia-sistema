import psycopg2

DATABASE_URL = "postgresql://agencia_db_eqri_user:WAdK9a3xBhgdS8bSbgOd4HmvbJ62auw4@dpg-d6l6j6ma2pns73br875g-a.oregon-postgres.render.com/agencia_db_eqri"

conn = psycopg2.connect(DATABASE_URL)
cursor = conn.cursor()

sql = """

CREATE TABLE IF NOT EXISTS clientes (
id INTEGER PRIMARY KEY,
nombre TEXT,
apellidos TEXT,
telefono TEXT,
email TEXT
);

CREATE TABLE IF NOT EXISTS proveedores (
id INTEGER PRIMARY KEY,
nombre TEXT,
telefono TEXT,
email TEXT
);

CREATE TABLE IF NOT EXISTS reservaciones (
id INTEGER PRIMARY KEY,
cliente_id INTEGER,
tipo_reservacion TEXT,
proveedor TEXT,
fecha_creacion TIMESTAMP,
costo_cliente REAL,
costo_proveedor REAL,
utilidad REAL
);

CREATE TABLE IF NOT EXISTS reservacion_hotel (
id INTEGER PRIMARY KEY,
reservacion_id INTEGER,
hotel TEXT,
fecha_entrada DATE,
fecha_salida DATE,
adultos INTEGER,
menores INTEGER,
plan TEXT,
tiempo_limite TIMESTAMP,
observaciones TEXT,
clave_proveedor TEXT
);

CREATE TABLE IF NOT EXISTS reservacion_avion (
id INTEGER PRIMARY KEY,
reservacion_id INTEGER,
aerolinea TEXT,
vuelo TEXT,
origen TEXT,
destino TEXT,
fecha_salida DATE,
hora_salida TEXT,
hora_llegada TEXT,
tiempo_limite TIMESTAMP,
clave_proveedor TEXT
);

CREATE TABLE IF NOT EXISTS pasajeros_avion (
id INTEGER PRIMARY KEY,
reservacion_id INTEGER,
nombre TEXT,
apellidos TEXT,
fecha_nacimiento DATE
);

CREATE TABLE IF NOT EXISTS habitaciones (
id INTEGER PRIMARY KEY,
reservacion_id INTEGER,
habitacion_num INTEGER,
adultos INTEGER,
menores INTEGER,
edades TEXT
);

CREATE TABLE IF NOT EXISTS pagos (
id INTEGER PRIMARY KEY,
reservacion_id INTEGER,
tipo_pago TEXT,
forma_pago TEXT,
monto REAL,
fecha TIMESTAMP,
concepto TEXT,
observacion TEXT,
recibo_id TEXT
);

CREATE TABLE IF NOT EXISTS tarjetas (
id INTEGER PRIMARY KEY,
cliente_id INTEGER,
numero TEXT,
titular TEXT,
expira TEXT
);

CREATE TABLE IF NOT EXISTS tarjetas_credito (
id INTEGER PRIMARY KEY,
cliente_id INTEGER,
numero TEXT,
titular TEXT,
expira TEXT
);

"""

cursor.execute(sql)

conn.commit()
conn.close()

print("TABLAS CREADAS EN POSTGRES")