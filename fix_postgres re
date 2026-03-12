import re

archivo = "app.py"

with open(archivo, "r", encoding="utf-8") as f:
    codigo = f.read()

# eliminar sqlite
codigo = codigo.replace("import sqlite3", "")

# conn.execute -> cursor.execute
codigo = codigo.replace("conn.execute(", "cursor.execute(")

# execute().fetchall()
codigo = re.sub(
    r'cursor\.execute\((.*?)\)\.fetchall\(\)',
    r'cursor.execute(\1)\npagos = cursor.fetchall()',
    codigo,
    flags=re.DOTALL
)

# execute().fetchone()
codigo = re.sub(
    r'cursor\.execute\((.*?)\)\.fetchone\(\)',
    r'cursor.execute(\1)\nresultado = cursor.fetchone()',
    codigo,
    flags=re.DOTALL
)

# corregir error SELECT SELECT
codigo = codigo.replace(
    "SELECT c.nombre || ' ' || c.apellidos as cliente",
    "c.nombre || ' ' || c.apellidos AS cliente"
)

with open(archivo, "w", encoding="utf-8") as f:
    f.write(codigo)

print("✔ app.py corregido para PostgreSQL")