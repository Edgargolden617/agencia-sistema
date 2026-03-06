import re

sql = open("backup.sql", "r", encoding="utf-8").read()

# quitar autoincrement
sql = sql.replace("AUTOINCREMENT", "")

# convertir INTEGER PRIMARY KEY a SERIAL
sql = re.sub(
    r"id INTEGER PRIMARY KEY",
    "id SERIAL PRIMARY KEY",
    sql,
    flags=re.IGNORECASE
)

# quitar cosas que postgres no usa
sql = sql.replace("PRAGMA foreign_keys=OFF;", "")
sql = sql.replace("BEGIN TRANSACTION;", "")
sql = sql.replace("COMMIT;", "")

open("backup_pg.sql", "w", encoding="utf-8").write(sql)

print("Archivo convertido: backup_pg.sql")