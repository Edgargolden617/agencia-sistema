import psycopg2

DATABASE_URL = "postgresql://agencia_db_eqri_user:WAdK9a3xBhgdS8bSbgOd4HmvbJ62auw4@dpg-d6l6j6ma2pns73br875g-a.oregon-postgres.render.com/agencia_db_eqri"

conn = psycopg2.connect(
    DATABASE_URL,
    sslmode="require"
)

cursor = conn.cursor()

sql = """
CREATE OR REPLACE VIEW vista_estado_financiero_reserva AS
SELECT
    r.id AS reservacion_id,
    r.costo_cliente,
    r.costo_proveedor,

    COALESCE(SUM(
        CASE WHEN p.tipo_pago = 'cliente_agencia'
        THEN p.monto END
    ),0) AS pagado_cliente,

    COALESCE(SUM(
        CASE WHEN p.tipo_pago = 'agencia_proveedor'
        THEN p.monto END
    ),0) AS pagado_proveedor,

    r.costo_cliente -
    COALESCE(SUM(
        CASE WHEN p.tipo_pago = 'cliente_agencia'
        THEN p.monto END
    ),0) AS saldo_cliente,

    r.costo_proveedor -
    COALESCE(SUM(
        CASE WHEN p.tipo_pago = 'agencia_proveedor'
        THEN p.monto END
    ),0) AS saldo_proveedor

FROM reservaciones r
LEFT JOIN pagos p
ON r.id = p.reservacion_id

GROUP BY
    r.id,
    r.costo_cliente,
    r.costo_proveedor;
"""

cursor.execute(sql)
conn.commit()

print("✅ Vista creada correctamente")

cursor.close()
conn.close()