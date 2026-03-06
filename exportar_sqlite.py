import sqlite3

conn = sqlite3.connect("agencia.db")

with open("backup.sql", "w", encoding="utf-8") as f:
    for line in conn.iterdump():
        f.write(f"{line}\n")

conn.close()

print("Backup creado: backup.sql")