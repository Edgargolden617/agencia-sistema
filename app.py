
#============= imports =========
from flask import Flask, render_template, request, redirect, url_for, session
from flask import Flask, render_template, request, redirect, url_for, session, flash

from datetime import datetime, date
import locale
try:
    locale.setlocale(locale.LC_TIME, 'es_MX.utf8')  # o 'es_ES.utf8' según tu sistema
except:
    locale.setlocale(locale.LC_TIME, '')  # fallback
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
import os
from num2words import num2words   # 👈 AQUÍ
from reportlab.graphics.shapes import Drawing
from reportlab.graphics.barcode import qr
from reportlab.graphics import renderPDF
from flask import send_file
from datetime import datetime

def formato_fecha(value):
    if value:
        return datetime.strptime(value, '%Y-%m-%d').strftime('%d %b %Y')
    return ''





def monto_a_letra(monto):
    entero = int(monto)
    centavos = int(round((monto - entero) * 100))
    letras = num2words(entero, lang="es").upper()
    return f"{letras} {centavos:02d}/100 M.N."

#============= app ===========
app = Flask(__name__)
app.secret_key = "agencia_secreta"
app.jinja_env.filters['formato_fecha'] = formato_fecha

#==============FUNCIONES AUXILIARES =========
def monto_a_letra(monto):
    entero = int(monto)
    centavos = int(round((monto - entero) * 100))
    texto = num2words(entero, lang="es").upper()
    return f"{texto} PESOS {centavos:02d}/100 M.N."

#======== funcion fecha corta===
from datetime import datetime

from datetime import datetime


@app.template_filter("formato_fecha")
def formato_fecha(valor):
    if not valor:
        return "—"
    formatos = [
    "%Y-%m-%d %H:%M:%S",
    "%Y-%m-%d %H:%M",
    "%Y-%m-%dT%H:%M",
    "%Y-%m-%dT%H:%M:%S",
    "%Y-%m-%d",
    "%d-%m-%Y %H:%M",
    "%d/%m/%Y %H:%M",
    "%Y/%m/%d %H:%M",
    "%d/%m/%Y",
    "%Y/%m/%d"
]
    for formato in formatos:
        try:
            fecha = datetime.strptime(valor.strip(), formato)
            return fecha.strftime("%d %b %Y")
        except:
            pass
    return valor

# Filtro personalizado para fecha y hora
@app.template_filter("formato_fecha_hora")
def formato_fecha_hora(valor):
    if not valor:
        return "—"
    formatos = [
    "%Y-%m-%d %H:%M:%S",
    "%Y-%m-%d %H:%M",
    "%Y-%m-%dT%H:%M",
    "%Y-%m-%dT%H:%M:%S",
    "%Y-%m-%d",
    "%d-%m-%Y %H:%M",
    "%d/%m/%Y %H:%M",
    "%Y/%m/%d %H:%M",
    "%d/%m/%Y",
    "%Y/%m/%d"
]
    for formato in formatos:
        try:
            fecha = datetime.strptime(valor.strip(), formato)
            return fecha.strftime("%d %b %Y – %H:%M")
        except:
            pass
    return valor



@app.template_filter("moneda")
def moneda(valor):
    try:
        return "${:,.2f}".format(float(valor))
    except:
        return "$0.00"

@app.template_filter("fecha_corta")
def fecha_corta(valor):
    if not valor:
        return "—"
    
    # Si ya es datetime o date, solo formateamos
    if isinstance(valor, (datetime, date)):
        return valor.strftime("%d %b %Y %H:%M") if isinstance(valor, datetime) else valor.strftime("%d %b %Y")

    formatos = [
        "%Y-%m-%d %H:%M:%S",
        "%Y-%m-%d %H:%M",
        "%Y-%m-%dT%H:%M",
        "%Y-%m-%d"
    ]

    for f in formatos:
        try:
            fecha = datetime.strptime(valor, f)
            return fecha.strftime("%d %b %Y %H:%M")
        except:
            pass

    return valor


# CONEXIÓN BD (POSTGRES + SQLITE)
# =========================

import os
import psycopg2
import psycopg2.extras


def get_db():

    DATABASE_URL = os.environ.get("DATABASE_URL")

    conn = psycopg2.connect(
        DATABASE_URL,
        sslmode="require",
        cursor_factory=psycopg2.extras.RealDictCursor
    )

    return conn
# =========================
# LOGIN
# =========================
@app.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        usuario = request.form.get("usuario")
        password = request.form.get("password")

        if usuario == "edgar" and password == "1234":
            session["usuario"] = usuario
            return redirect(url_for("menu"))

    return render_template("login.html")

@app.route("/dashboard")
def dashboard():
    if "usuario" not in session:
        return redirect(url_for("login"))
    return render_template("dashboard.html")


@app.route("/menu")
def menu():
    if "usuario" not in session:
        return redirect(url_for("login"))
    return render_template("menu.html")


@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("login"))

# =========================
# NUEVA RESERVACIÓN
# =========================
@app.route("/nueva_reservacion", methods=["GET", "POST"])
def nueva_reservacion():
    if "usuario" not in session:
        return redirect(url_for("login"))

    if request.method == "POST":
        try:
            

            conn = get_db()
            cursor = conn.cursor()

            # ================= DATOS CLIENTE =================
            nombre = request.form.get("nombre")
            apellidos = request.form.get("apellidos")
            celular = request.form.get("celular")
            email = request.form.get("email")
            referencia = request.form.get("referencia")

            cursor.execute("""
                SELECT id FROM clientes WHERE nombre = %s AND apellidos = %s
            """, (nombre, apellidos))
            cliente = cursor.fetchone()

            if cliente:
                cliente_id = cliente["id"]
            else:
                cursor.execute("""
            INSERT INTO clientes (nombre, apellidos, celular, email, referencia)
            VALUES (%s, %s, %s, %s, %s)
            RETURNING id
            """, (nombre, apellidos, celular, email, referencia))

            cliente_id = cursor.fetchone()["id"]

            # ================= DATOS RESERVACIÓN =================
            tipo_reservacion = request.form.get("tipo_reservacion")
            proveedor = request.form.get("proveedor")
            costo_cliente = float(request.form.get("costo_cliente").replace("$", "").replace(",", ""))
            costo_proveedor = float(request.form.get("costo_proveedor").replace("$", "").replace(",", ""))
            utilidad = costo_cliente - costo_proveedor
            fecha_creacion = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            estatus = "Pendiente"

            if tipo_reservacion == "hotel":
                 producto_reservado = request.form.get("hotel")
            elif tipo_reservacion == "avion":
                    producto_reservado = request.form.get("aerolinea")
            else:
                producto_reservado = "-"

            cursor.execute("""
                INSERT INTO reservaciones (
                    cliente_id, tipo_reservacion, proveedor,
                    costo_cliente, costo_proveedor, utilidad,
                    estatus, fecha_creacion, producto_reservado
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                RETURNING id
            """, (
                cliente_id, tipo_reservacion, proveedor,
                costo_cliente, costo_proveedor, utilidad,
                estatus, fecha_creacion, producto_reservado
            ))

            reservacion_id = cursor.fetchone()["id"]

            # ================= DATOS HOTEL =================
            if tipo_reservacion == "hotel":
                hotel = request.form.get("hotel")
                producto_reservado = hotel  # si es hotel
                ciudad = request.form.get("ciudad")
                fecha_entrada = request.form.get("fecha_entrada")
                fecha_salida = request.form.get("fecha_salida")
                plan = request.form.get("plan")
                tiempo_limite = request.form.get("tiempo_limite")
                observaciones = request.form.get("observaciones")
                clave_proveedor = request.form.get("clave_proveedor")
                clave_hotel = request.form.get("clave_hotel")

                cursor.execute("""
                    INSERT INTO reservacion_hotel (
                        reservacion_id, hotel, ciudad,
                        fecha_entrada, fecha_salida, plan,
                        tiempo_limite, observaciones,
                        clave_proveedor, clave_hotel
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """, (
                    reservacion_id, hotel, ciudad,
                    fecha_entrada, fecha_salida, plan,
                    tiempo_limite, observaciones,
                    clave_proveedor, clave_hotel
                ))

                # ================= HABITACIONES =================
                habitaciones_str = request.form.get("habitaciones", "").strip()
                total_habitaciones = int(habitaciones_str) if habitaciones_str.isdigit() else 0

                for i in range(1, total_habitaciones + 1):
                    adultos = request.form.get(f"adultos_{i}")
                    menores = request.form.get(f"menores_{i}")
                    edades = request.form.get(f"edades_{i}")

                    cursor.execute("""
                        INSERT INTO habitaciones (
                            reservacion_id,
                            habitacion_num,
                            adultos,
                            menores,
                            edades
                        ) VALUES (%s, %s, %s, %s, %s)
                    """, (
                        reservacion_id,
                        i,
                        adultos,
                        menores,
                        edades
                    ))

            # ================= AVIÓN (si lo usarás después) =================
 # === BLOQUE AVIÓN ===
            elif tipo_reservacion == "avion":
                aerolinea = request.form.get("aerolinea")
                producto_reservado = aerolinea  # si es avión
                vuelo = request.form.get("vuelo")
                tipo_vuelo = request.form.get("tipo_vuelo")
                fecha_regreso = request.form.get("fecha_regreso") if tipo_vuelo == "redondo" else None
                hora_regreso = request.form.get("hora_regreso") if tipo_vuelo == "redondo" else None
                hora_llegada_regreso = request.form.get("hora_llegada_regreso") if tipo_vuelo == "redondo" else None
                origen = request.form.get("origen")
                destino = request.form.get("destino")
                fecha_salida = request.form.get("fecha_salida_avion")
                hora_salida = request.form.get("hora_salida")
                hora_llegada = request.form.get("hora_llegada")
                tiene_escala = request.form.get("agregar_escala") == "on"
                ciudad_escala = request.form.get("ciudad_escala") if tiene_escala else None
                hora_salida_escala = request.form.get("hora_salida_escala") if tiene_escala else None
                destino_escala = request.form.get("destino_escala") if tiene_escala else None
                hora_llegada_escala = request.form.get("hora_llegada_escala") if tiene_escala else None
                tiempo_limite = request.form.get("tiempo_limite_avion")
                clave_proveedor = request.form.get("clave_proveedor_avion")
                clave_aerolinea = request.form.get("clave_aerolinea")
                observaciones = request.form.get("observaciones_avion")

                cursor.execute("""
                    INSERT INTO reservacion_avion (
                        reservacion_id, aerolinea, vuelo, tipo_vuelo, fecha_regreso,
                        hora_regreso, hora_llegada_regreso, origen, destino, fecha_salida, hora_salida, hora_llegada,
                        tiene_escala, ciudad_escala, hora_salida_escala, destino_escala,
                        hora_llegada_escala, tiempo_limite, clave_proveedor,
                        clave_aerolinea, observaciones
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s)
                """, (
                    reservacion_id, aerolinea, vuelo, tipo_vuelo, fecha_regreso,
                    hora_regreso, hora_llegada_regreso, origen, destino, fecha_salida, hora_salida, hora_llegada,
                    tiene_escala, ciudad_escala, hora_salida_escala, destino_escala,
                    hora_llegada_escala, tiempo_limite, clave_proveedor,
                    clave_aerolinea, observaciones
                ))

                # Pasajeros
                pasajeros_str = request.form.get("no_pasajeros", "").strip()
                total = int(pasajeros_str) if pasajeros_str.isdigit() else 0
                for i in range(1, total + 1):
                    nombre = request.form.get(f"nombre_pasajero_{i}")
                    apellidos = request.form.get(f"apellidos_pasajero_{i}")
                    fecha_nacimiento = request.form.get(f"fecha_nacimiento_{i}")

                    cursor.execute("""
                        INSERT INTO pasajeros_avion (
                            reservacion_id, nombre, apellidos, fecha_nacimiento
                        ) VALUES (%s, %s, %s, %s)
                    """, (
                        reservacion_id, nombre, apellidos, fecha_nacimiento
                    ))

            conn.commit()

# Mostrar modal de éxito (AQUÍ DEBE IR)
            datos_modal = {
                "id": reservacion_id,
                "nombre": nombre,
                "apellidos": apellidos,
                "cliente_id": cliente_id
            }

            return render_template("nueva_reservacion.html", datos_modal=datos_modal)

        except Exception as e:
            return f"<h2>⚠️ Error:</h2><pre>{str(e)}</pre>"

        finally:
            conn.close()

    # Método GET
    return render_template("nueva_reservacion.html")

# =========================
# GESTIONAR RESERVAS
# =========================



@app.route("/gestionar_reservas")
def gestionar_reservas():
    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()

    # ================= FILTROS =================
    id_reserva = request.args.get("id_reserva")
    id_cliente = request.args.get("id_cliente", "").strip()
    nombre = request.args.get("nombre")
    fecha = request.args.get("fecha")
    estatus_filtro = request.args.get("estatus")
    orden = request.args.get("orden", "desc")

    where = []
    params = []

    if id_reserva:
        where.append("r.id = %s")
        params.append(id_reserva)

    if id_cliente.isdigit():
        where.append("c.id = %s")
        params.append(int(id_cliente))

    if nombre:
        where.append("(c.nombre LIKE %s OR c.apellidos LIKE %s)")
        params.extend([f"%{nombre}%", f"%{nombre}%"])

    if fecha:
        where.append("DATE(r.fecha_creacion) = %s")
        params.append(fecha)

    where_sql = ""
    if where:
        where_sql = " WHERE " + " AND ".join(where)

    orden_sql = "ASC" if orden == "asc" else "DESC"

    # ================= CONSULTA =================
    cursor.execute(f"""
        SELECT
            r.id AS id_reserva,
            c.id AS id_cliente,
            c.nombre || ' ' || c.apellidos as cliente,
            r.tipo_reservacion,
            r.producto_reservado,
            r.proveedor,
            r.fecha_creacion,
            h.tiempo_limite AS tiempo_limite_hotel,
            r.costo_cliente,
            r.costo_proveedor AS costo_agencia,
            r.estatus,
            r.saldo_a_favor AS saldo_a_favor,
            r.devolucion_cliente,
            COALESCE(f.pagado_cliente, 0) AS pagado_cliente,
            COALESCE(f.pagado_proveedor, 0) AS pagado_proveedor,
            COALESCE(f.saldo_cliente, 0) AS saldo_cliente,
            COALESCE(f.saldo_proveedor, 0) AS saldo_proveedor,       

            -- CAMPOS DE AVION
            a.aerolinea,
            a.vuelo,
            a.tipo_vuelo,
            a.fecha_salida,
            a.hora_salida,
            a.hora_llegada,
            a.fecha_regreso,
            a.hora_regreso,
            a.hora_llegada_regreso,
            a.origen,
            a.destino,
            a.tiene_escala,
            a.ciudad_escala,
            a.hora_salida_escala,
            a.destino_escala,
            a.hora_llegada_escala,
            a.tiempo_limite AS tiempo_limite_avion,       
            a.clave_proveedor AS clave_proveedor_avion,
            a.clave_aerolinea,
            a.observaciones AS observaciones_avion
                   
                  
                          
        FROM reservaciones r
        JOIN clientes c ON r.cliente_id = c.id
        LEFT JOIN reservacion_hotel h ON r.id = h.reservacion_id
        LEFT JOIN reservacion_avion a ON r.id = a.reservacion_id                     
        LEFT JOIN vista_estado_financiero_reserva f
           ON f.reservacion_id = r.id
        {where_sql}
        ORDER BY r.fecha_creacion {orden_sql}
    """, params)

    filas = cursor.fetchall()
    conn.close()

    # ================= PROCESAR RESULTADOS =================
    reservas_final = []
    hoy = datetime.now().date()

    for r in filas:

        producto = r["producto_reservado"] if r["producto_reservado"] else "-"

        costo_cliente = float(r["costo_cliente"] or 0)
        costo_agencia = float(r["costo_agencia"] or 0)
        pagado_cliente = float(r["pagado_cliente"] or 0)
        pagado_proveedor = float(r["pagado_proveedor"] or 0)

        saldo_cliente = float(r["saldo_cliente"] or 0)
        saldo_proveedor = float(r["saldo_proveedor"] or 0)

        # Obtener el tiempo límite según el tipo
        tiempo_limite = None
        if r["tipo_reservacion"] == "hotel":
            tiempo_limite = r["tiempo_limite_hotel"]
        elif r["tipo_reservacion"] == "avion":
            tiempo_limite = r["tiempo_limite_avion"]  # Avión usa fecha_salida como referencia

        # Convertir a datetime.date si es posible
        if tiempo_limite:
            try:
                tiempo_limite = datetime.strptime(tiempo_limite, "%Y-%m-%dT%H:%M").date()
            except:
                try:
                    tiempo_limite = datetime.strptime(tiempo_limite, "%Y-%m-%d").date()
                except:
                    tiempo_limite = None

        # ====== ESTATUS ======
    

        if r["estatus"] == "cancelada":
            estatus = "CANCELADA"
        elif tiempo_limite and hoy > tiempo_limite:
            estatus = "CANCELADA"
        elif saldo_cliente <= 0:
            estatus = "PAGADA"
        elif pagado_cliente > 0:
            estatus = "CONFIRMADA"
        else:
            estatus = "PENDIENTE DE PAGO"

        # ====== ALERTA VENCIMIENTO ======
        alerta_vencimiento = None
        if tiempo_limite and estatus not in ("PAGADA", "CANCELADA"):
            dias_restantes = (tiempo_limite - hoy).days
            if dias_restantes == 0:
                alerta_vencimiento = "HOY"
            elif 0 < dias_restantes <= 3:
                alerta_vencimiento = "PROXIMO"

        reservas_final.append({
            "id_reserva": r["id_reserva"],
            "id_cliente": r["id_cliente"],
            "cliente": r["cliente"],
            "tipo_reservacion": r["tipo_reservacion"],
            "producto": producto,
            "producto_reservado": r["producto_reservado"],
            "proveedor": r["proveedor"],
            "fecha_creacion": r["fecha_creacion"],
            "tiempo_limite": tiempo_limite,
            "costo_cliente": costo_cliente,
            "costo_agencia": float(r["costo_agencia"] or 0),
            "saldo_cliente": saldo_cliente,
            "saldo_proveedor": saldo_proveedor,
            "saldo_a_favor": float(r["saldo_a_favor"] or 0),
            "devolucion_cliente": float(r["devolucion_cliente"] or 0),
            "estatus_calculado": estatus,
            "alerta_vencimiento": alerta_vencimiento
        })

    # ================= FILTRO POR ESTATUS =================
    if estatus_filtro and estatus_filtro.upper() != "TODAS":
        estatus_filtro = estatus_filtro.upper()
        reservas_final = [
            r for r in reservas_final
            if r["estatus_calculado"] == estatus_filtro
        ]

    # ================= DASHBOARD =================
    vencen_hoy = 0
    vencen_pronto = 0
    pendientes_pago = 0
    total_reservas = len(reservas_final)

    for r in reservas_final:
        if r["alerta_vencimiento"] == "HOY":
            vencen_hoy += 1
        elif r["alerta_vencimiento"] == "PROXIMO":
            vencen_pronto += 1

        if r["estatus_calculado"] == "PENDIENTE DE PAGO":
            pendientes_pago += 1

    # ================= RETURN FINAL =================
    return render_template(
        "gestionar_reservas.html",
        reservas=reservas_final,
        vencen_hoy=vencen_hoy,
        vencen_pronto=vencen_pronto,
        pendientes_pago=pendientes_pago,
        total_reservas=total_reservas
    )
# ================= FIN FOR =================
# =========================
# DETALLE RESERVACIÓN
# =========================
@app.route("/reservacion/<int:reservacion_id>")
def detalle_reservacion(reservacion_id):
    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()

    # -------- DATOS GENERALES --------
    cursor.execute("""
        SELECT
    r.*,
    r.tipo_reservacion AS tipo,

    -- CLIENTE
    c.id AS id_cliente,
    c.nombre,
    c.apellidos,
    c.celular,
    c.email,
    c.referencia,

    -- HOTEL
    h.hotel,
    h.ciudad,
    h.fecha_entrada,
    h.fecha_salida,
    h.plan,
    h.tiempo_limite AS tiempo_limite_hotel,
    h.observaciones        AS observaciones_hotel,
    h.clave_proveedor     AS clave_proveedor_hotel,
    h.clave_hotel,

    -- AVIÓN
    a.aerolinea,
    a.vuelo,
    a.tipo_vuelo,
    a.fecha_salida        AS fecha_salida_avion,
    a.hora_salida,
    a.hora_llegada,
    a.fecha_regreso,
    a.hora_regreso,
    a.hora_llegada_regreso,
    a.origen,
    a.destino,
    a.tiene_escala,
    a.ciudad_escala,
    a.hora_salida_escala,
    a.destino_escala,
    a.hora_llegada_escala,
    a.tiempo_limite AS tiempo_limite_avion,
    a.clave_proveedor     AS clave_proveedor_avion,
    a.clave_aerolinea,
    a.observaciones       AS observaciones_avion,
                   
   -- PAGOS
            (SELECT COALESCE(SUM(monto), 0) FROM pagos WHERE pagos.reservacion_id = r.id AND tipo_pago = 'cliente_agencia') AS pagado_cliente,
            (SELECT COALESCE(SUM(monto), 0) FROM pagos WHERE pagos.reservacion_id = r.id AND tipo_pago = 'agencia_proveedor') AS pagado_proveedor            

        FROM reservaciones r
        JOIN clientes c ON r.cliente_id = c.id
        LEFT JOIN reservacion_hotel h ON r.id = h.reservacion_id
        LEFT JOIN reservacion_avion a ON r.id = a.reservacion_id
        WHERE r.id = %s
    """, (reservacion_id,))

    r = cursor.fetchone()

    if not r:
        conn.close()
        return "Reservación no encontrada", 404

    r = dict(r)

# Detectar tipo de reservación
    r = dict(r)

# Detectar tipo si no está definido
    if not r.get("tipo_reservacion"):
        if r.get("hotel"):
            r["tipo_reservacion"] = "hotel"
        elif r.get("aerolinea"):
            r["tipo_reservacion"] = "avion"
        else:
            r["tipo_reservacion"] = "otro"

    # ================= ESTADO FINANCIERO =================
    cursor.execute("""
        SELECT *
        FROM vista_estado_financiero_reserva
        WHERE reservacion_id = %s
    """, (reservacion_id,))
    estado = cursor.fetchone()

    if not estado:
        class EstadoDummy:
            total_cliente = 0
            pagado_cliente = 0
            total_proveedor = 0
            pagado_proveedor = 0
            devolucion_cliente = 0
            saldo_a_favor_cliente = 0
            penalidad_proveedor = 0
            penalidad_agencia = 0
        estado = EstadoDummy()
        

    # -------- HABITACIONES --------
    cursor.execute("""
        SELECT habitacion_num, adultos, menores, edades
        FROM habitaciones
        WHERE reservacion_id = %s
        ORDER BY habitacion_num
    """, (reservacion_id,))
    habitaciones = cursor.fetchall()

    # -------- PASAJEROS AVIÓN --------
    cursor.execute("""
    SELECT nombre, apellidos, fecha_nacimiento
    FROM pasajeros_avion
    WHERE reservacion_id = %s
    ORDER BY id
    """, (reservacion_id,))
    pasajeros = cursor.fetchall()

    # -------- PAGOS --------
    cursor.execute("""
        SELECT id, tipo_pago, forma_pago, monto, observacion,concepto, fecha, recibo_id
        FROM pagos
        WHERE reservacion_id = %s
        ORDER BY fecha 
    """, (reservacion_id,))
    pagos = cursor.fetchall()

    # -------- CÁLCULOS --------

    pagado_cliente = sum(float(p["monto"]) for p in pagos if p["tipo_pago"] == "cliente_agencia")
    pagado_proveedor = sum(float(p["monto"]) for p in pagos if p["tipo_pago"] == "agencia_proveedor")

    try:
        costo_cliente = float(r["costo_cliente"])
    except (ValueError, TypeError):
        costo_cliente = 0

    try:
        costo_proveedor = float(r["costo_proveedor"])
    except (ValueError, TypeError):
        costo_proveedor = 0


    pagado_cliente = float(r["pagado_cliente"] or 0)
    pagado_proveedor = float(r["pagado_proveedor"] or 0)
    saldo_cliente = max(0, costo_cliente - pagado_cliente)
    saldo_proveedor = max(0, costo_proveedor - pagado_proveedor)

    conn.close()
    return render_template(
        "detalle_reservacion.html",
        r=r,
        habitaciones=habitaciones,
        pagos=pagos,
        reservacion=r,
        pagado_cliente=pagado_cliente,
        pagado_proveedor=pagado_proveedor,
        saldo_cliente=saldo_cliente,
        saldo_proveedor=saldo_proveedor,
        estado=estado,
        pasajeros=pasajeros
    )

@app.route("/detalle_reservacion_modal/<int:reservacion_id>")
def detalle_reservacion_modal(reservacion_id):
    if "usuario" not in session:
        return "Sesión expirada", 401

    conn = get_db()
    cursor = conn.cursor()

    # ===== DATOS DE LA RESERVACIÓN =====
    cursor.execute("""
        SELECT 
            r.id,
            r.fecha_creacion,
            r.tipo_reservacion,
            r.producto_reservado,
            r.proveedor,
            r.costo_cliente,
            r.costo_proveedor,

            c.nombre || ' ' || c.apellidos AS cliente,
            c.celular,
            c.email
        FROM reservaciones r
        JOIN clientes c ON r.cliente_id = c.id
        WHERE r.id = %s
    """, (reservacion_id,))

    r = cursor.fetchone()

    # ===== PAGOS =====
    cursor.execute("""
        SELECT 
            fecha,
            tipo_pago,
            forma_pago,
            monto,
            concepto,
            observacion,
            recibo_id
        FROM pagos
        WHERE reservacion_id = %s
        ORDER BY fecha
    """, (reservacion_id,))

    pagos = cursor.fetchall()

    conn.close()

    return render_template(
        "detalle_reservacion_modal.html",
        r=r,
        pagos=pagos
    )


@app.route("/estado_financiero/<int:reservacion_id>")
def estado_financiero_reservacion(reservacion_id):
    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()

    # Datos actuales de la reservación
    cursor.execute("SELECT * FROM reservaciones WHERE id = %s", (reservacion_id,))
    r = cursor.fetchone()

    if not r:
        return "❌ Reservación no encontrada", 404

    # Suma de pagos reales
    cursor.execute("""
        SELECT
            COALESCE(SUM(CASE WHEN tipo_pago = 'cliente_agencia' THEN monto END), 0) AS pagado_cliente,
            COALESCE(SUM(CASE WHEN tipo_pago = 'agencia_proveedor' THEN monto END), 0) AS pagado_proveedor,
            COALESCE(SUM(CASE WHEN tipo_pago = 'proveedor_agencia' THEN monto END), 0) AS devuelto_proveedor,
            COALESCE(SUM(CASE WHEN tipo_pago = 'agencia_cliente' THEN monto END), 0) AS devuelto_cliente
        FROM pagos WHERE reservacion_id = %s
    """, (reservacion_id,))
    pagos = cursor.fetchone()

    estado = {
        # Originales (guardados antes de cancelar)
        "total_cliente": r["costo_cliente"],
        "total_proveedor": r["costo_proveedor"],

        # Pagos reales
        "pagado_cliente": pagos["pagado_cliente"],
        "pagado_proveedor": pagos["pagado_proveedor"],

        # Cancelación
        "devolucion_cliente": r["devolucion_cliente"],
        "saldo_a_favor": r["saldo_a_favor"],
        "penalidad_proveedor": r["penalidad_proveedor"],
        "penalidad_agencia": r["penalidad_agencia"],

        # Utilidad real
        "utilidad": r["utilidad"],
        "estatus": r["estatus"]
    }

    conn.close()
    return render_template("estado_financiero_reservacion.html", estado=estado, reservacion_id=reservacion_id)

@app.route("/contabilidad_reservacion/<int:reservacion_id>")
def contabilidad_reservacion(reservacion_id):

    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()

    # ===== ESTADO FINANCIERO =====
    cursor.execute("""
        SELECT *
        FROM vista_estado_financiero_reserva
        WHERE reservacion_id = %s
    """, (reservacion_id,))
    estado = cursor.fetchone()

    if estado:
        estado = dict(estado) 
    else:
        estado ={
            "total_cliente": 0,
            "pagado_cliente": 0,
            "total_proveedor": 0,
            "pagado_proveedor": 0
        }

    # ===== PAGOS =====
    cursor.execute("""
        SELECT
            p.id,
            p.tipo_pago,
            p.concepto,
            p.monto,
            p.forma_pago,
            p.fecha,
            p.fecha_limite,
            p.observacion,
            p.recibo_id
        FROM pagos p
        WHERE p.reservacion_id = %s
        ORDER BY p.fecha
    """, (reservacion_id,))

    pagos = cursor.fetchall()
    conn.close()

    return render_template(
        "estado_financiero_reservacion.html",
        estado=estado,
        pagos=pagos,
        reservacion_id=reservacion_id
    )

# =========================
# REGISTRAR PAGO
# =========================
from datetime import datetime

@app.route("/reservacion/<int:reservacion_id>/pago", methods=["POST"])
def registrar_pago(reservacion_id):
    if "usuario" not in session:
        return redirect(url_for("login"))

    tipo_pago = request.form.get("tipo_pago")
    forma_pago = request.form.get("forma_pago")
    observacion = request.form.get("observacion")

    monto = float(request.form.get("monto", 0))
    concepto = request.form.get("concepto")
    fecha = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    conn = get_db()
    cursor = conn.cursor()
#============== RECIBO CONSECUTIVO =======
    recibo_id = None

    # 🔑 CONDICIÓN CORREGIDA
    if tipo_pago and tipo_pago.lower().startswith("cliente"):
        cursor.execute("""
            SELECT COALESCE(MAX(recibo_id), 0) + 1
            FROM pagos
        """)
        recibo_id = cursor.fetchone()[0]
#================= inseertar pago============
    cursor.execute("""
        INSERT INTO pagos (
            reservacion_id,
            tipo_pago,
            forma_pago,
            monto,
            concepto,
            observacion,
            fecha,
            recibo_id
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """, (
        reservacion_id,
        tipo_pago,
        forma_pago,
        monto,
        concepto,
        observacion,
        fecha,
        recibo_id
    ))

    conn.commit()
    conn.close()
    return redirect(url_for("detalle_reservacion", reservacion_id=reservacion_id))

#================ recibo de pago =========
@app.route("/recibo_pago/<int:pago_id>")
def recibo_pago(pago_id):
    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT p.*, 
               r.tipo_reservacion,
               c.nombre, c.apellidos
        FROM pagos p
        JOIN reservaciones r ON p.reservacion_id = r.id
        JOIN clientes c ON r.cliente_id = c.id
        WHERE p.id = %s
    """, (pago_id,))
    pago = cursor.fetchone()
    conn.close()

    if not pago:
        return "Pago no encontrado", 404

    nombre_archivo = f"recibo_pago_{pago_id}.pdf"
    ruta = os.path.join("static", nombre_archivo)

    c = canvas.Canvas(ruta, pagesize=letter)
    width, height = letter
    y = height - 50

    # ================= QR DEL RECIBO =================
    url_recibo = url_for(
        "recibo_pago",
        pago_id=pago_id,
        _external=True
    )

    qr_widget = qr.QrCodeWidget(url_recibo)
    bounds = qr_widget.getBounds()

    width_qr = bounds[2] - bounds[0]
    height_qr = bounds[3] - bounds[1]

    size = 80  # tamaño del QR

    drawing = Drawing(
        size,
        size,
        transform=[
            size / width_qr, 0, 0,
            size / height_qr, 0, 0
        ]
    )

    drawing.add(qr_widget)

    renderPDF.draw(
        drawing,
        c,
        width - 120,  # derecha
        60            # abajo
    )

    c.setFont("Helvetica", 8)
    c.drawCentredString(width - 80, 50, "Escanea para verificar")

    # ================= CONTENIDO DEL RECIBO =================
    c.setFont("Helvetica-Bold", 16)
    c.drawCentredString(width / 2, y, "GOLDEN TOURS")
    y -= 30

    c.setFont("Helvetica-Bold", 11)
    c.drawString(50, y, f"Recibo No: REC-{pago['recibo_id']:04d}")
    y -= 20

    c.setFont("Helvetica", 11)
    c.drawString(50, y, f"Fecha: {pago['fecha']}")
    y -= 20

    c.drawString(50, y, f"Cliente: {pago['nombre']} {pago['apellidos']}")
    y -= 20

    c.drawString(50, y, f"Tipo de reservación: {pago['tipo_reservacion']}")
    y -= 30

    c.drawString(50, y, f"Forma de Pago: {pago['forma_pago']}")
    y -= 30

    c.setFont("Helvetica-Bold", 12)
    c.drawString(50, y, f"Monto recibido: ${pago['monto']:.2f}")
    y -= 20


    c.setFont("Helvetica", 11)
    c.drawString(50, y, monto_a_letra(pago["monto"]))

    

    c.showPage()
    c.save()

    return redirect(url_for("static", filename=nombre_archivo))

@app.route("/pagos_reservacion/<int:reservacion_id>")
def pagos_reservacion(reservacion_id):

    conn = get_db()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT
            p.id,
            p.tipo_pago,
            p.concepto,
            p.monto,
            p.forma_pago,
            p.fecha,
            p.concepto,
            p.observacion
        FROM pagos p
        WHERE p.reservacion_id = %s
        ORDER BY p.fecha
    """, (reservacion_id,))

    pagos = cursor.fetchall()
    conn.close()

    return render_template(
        "pagos_reservacion.html",
        pagos=pagos,
        reservacion_id=reservacion_id
    )

# ==================== voucher =========
from flask import Flask, render_template, send_file, current_app

import os
from xhtml2pdf import pisa
from io import BytesIO

@app.route("/voucher/<int:reservacion_id>")
def generar_voucher(reservacion_id):
    conn = get_db()
    cursor = conn.cursor()
    # Obtener datos de la reservación principal
    cursor.execute("""
    SELECT 
        r.id, r.tipo_reservacion, r.proveedor, r.cliente_id,
        r.costo_cliente, r.costo_proveedor, r.utilidad,
        r.fecha_creacion,
        c.nombre, c.apellidos,
        rh.hotel, rh.ciudad, rh.fecha_entrada, rh.fecha_salida,
        rh.plan, rh.clave_proveedor, rh.clave_hotel, rh.observaciones,
        

        ra.aerolinea, ra.vuelo, ra.tipo_vuelo, ra.origen, ra.destino,
        ra.fecha_salida, ra.hora_salida, ra.hora_llegada,
        ra.fecha_regreso, ra.hora_regreso, ra.hora_llegada_regreso,
        ra.tiene_escala, ra.ciudad_escala, ra.hora_salida_escala,
        ra.hora_llegada_escala, ra.clave_aerolinea,
        
        ra.observaciones AS observaciones_avion
    FROM reservaciones r
    LEFT JOIN clientes c ON r.cliente_id = c.id
    LEFT JOIN reservacion_hotel rh ON rh.reservacion_id = r.id
    LEFT JOIN reservacion_avion ra ON ra.reservacion_id = r.id
    WHERE r.id = %s
""", (reservacion_id,))
    r = cursor.fetchone()


    # Obtener habitaciones si es tipo hotel
    habitaciones = []
    if r['tipo_reservacion'] == 'hotel':
        cursor.execute("SELECT * FROM habitaciones WHERE reservacion_id = %s", (reservacion_id,))
        habitaciones = cursor.fetchall()
    pasajeros = []
    if r['tipo_reservacion'] == 'avion':
        cursor.execute("SELECT * FROM pasajeros_avion WHERE reservacion_id = %s", (reservacion_id,))
        pasajeros = cursor.fetchall()
    conn.close()

    # Renderizar el HTML
    html = render_template("voucher.html", datos=r, habitaciones=habitaciones)

    # Reemplazar rutas para que xhtml2pdf pueda cargar las imágenes
    static_path = os.path.join(current_app.root_path, 'static')
    html = html.replace(
        "{{ url_for('static', filename='img/logo.jpg') }}",
        f"file:///{static_path}/img/logo.jpg"
    )
    html = html.replace(
        "{{ url_for('static', filename='img/mosaico.png') }}",
        f"file:///{static_path}/img/mosaico.png"
    )

    # Generar PDF
    result = BytesIO()
    pisa.CreatePDF(src=html, dest=result)

    result.seek(0)
    return send_file(result, mimetype='application/pdf', download_name=f"voucher_GT{reservacion_id}.pdf")

@app.route("/reporte_contabilidad_general")
def reporte_contabilidad_general():
    if "usuario" not in session:
        return redirect(url_for("login"))

    fecha_inicio = request.args.get("fecha_inicio", "").strip()
    fecha_fin = request.args.get("fecha_fin", "").strip()
    cliente_buscar = request.args.get("cliente", "").strip()
    proveedor_buscar = request.args.get("proveedor", "").strip()
    reservacion_buscar = request.args.get("reservacion", "").strip()

    conn = get_db()
    cursor = conn.cursor()

    # ================= FILTROS =================
    where = []
    params = []

    # ---- FILTRO FECHAS ----
    if fecha_inicio and fecha_fin:
        where.append("date(r.fecha_creacion) BETWEEN %s AND %s")
        params.extend([fecha_inicio, fecha_fin])

    # ---- FILTRO CLIENTE ----
    if cliente_buscar:

        palabras = cliente_buscar.split()

        for palabra in palabras:

            where.append("(c.nombre LIKE %s OR c.apellidos LIKE %s)")
            params.extend([f"%{palabra}%", f"%{palabra}%"])

    # ---- FILTRO PROVEEDOR ----
    if proveedor_buscar:
        where.append("r.proveedor LIKE %s")
        params.append(f"%{proveedor_buscar}%")

    # ---- FILTRO RESERVACIÓN (GT123 o 123) ✅ ----
    if reservacion_buscar:
        reservacion_buscar = reservacion_buscar.upper().replace("GT", "").strip()

        if reservacion_buscar.isdigit():
            where.append("r.id = %s")
            params.append(int(reservacion_buscar))

    where_sql = ""
    if where:
        where_sql = " WHERE " + " AND ".join(where)

    # ================= CONSULTA PRINCIPAL =================
    cursor.execute(f"""
        SELECT
            r.id AS reservacion_id,
            r.fecha_creacion,
            c.nombre || ' ' || c.apellidos AS cliente,
            r.proveedor,

            r.costo_cliente AS total_cliente,
            v.pagado_cliente,

            r.costo_proveedor AS total_proveedor,
            v.pagado_proveedor,

            r.utilidad
        FROM reservaciones r
        JOIN clientes c ON c.id = r.cliente_id
        LEFT JOIN vista_estado_financiero_reserva v
               ON v.reservacion_id = r.id
        {where_sql}
        ORDER BY r.fecha_creacion DESC
    """, params)

    filas = cursor.fetchall()

    reservas = []
    resumen = {
        "total_reservas": 0,
        "total_cliente": 0,
        "pagado_cliente": 0,
        "saldo_cliente": 0,
        "total_proveedor": 0,
        "pagado_proveedor": 0,
        "saldo_proveedor": 0,
        "utilidad": 0
    }

    # ================= PROCESAR =================
    for f in filas:
        total_cliente = float(f["total_cliente"] or 0)
        pagado_cliente = float(f["pagado_cliente"] or 0)
        saldo_cliente = total_cliente - pagado_cliente

        total_proveedor = float(f["total_proveedor"] or 0)
        pagado_proveedor = float(f["pagado_proveedor"] or 0)
        saldo_proveedor = total_proveedor - pagado_proveedor

        utilidad = float(f["utilidad"] or 0)

        # ---- HISTORIAL DE PAGOS ----
        cursor.execute("""
            SELECT
                p.tipo_pago,
                p.concepto,
                p.monto,
                p.forma_pago,
                p.fecha,
                p.fecha_limite,
                p.observacion
            FROM pagos p
            WHERE p.reservacion_id = %s
            ORDER BY p.fecha ASC
        """, (f["reservacion_id"],))

        pagos = cursor.fetchall()

        from datetime import datetime

        fecha_formateada = ""

        if f["fecha_creacion"]:
            
            fecha_str = f["fecha_creacion"]

            try:
                fecha_obj = datetime.strptime(fecha_str, "%Y-%m-%d %H:%M:%S")
            except ValueError:
                fecha_obj = datetime.strptime(fecha_str, "%Y-%m-%d %H:%M")

            fecha_formateada = fecha_obj.strftime("%d %b %Y")

        reservas.append({
            "reservacion_id": f["reservacion_id"],
            "fecha_creacion": fecha_formateada,
            "cliente": f["cliente"],
            "proveedor": f["proveedor"],

            "total_cliente": total_cliente,
            "pagado_cliente": pagado_cliente,
            "saldo_cliente": saldo_cliente,

            "total_proveedor": total_proveedor,
            "pagado_proveedor": pagado_proveedor,
            "saldo_proveedor": saldo_proveedor,

            "utilidad": utilidad,
            "pagos": pagos
        })

        resumen["total_reservas"] += 1
        resumen["total_cliente"] += total_cliente
        resumen["pagado_cliente"] += pagado_cliente
        resumen["saldo_cliente"] += saldo_cliente

        resumen["total_proveedor"] += total_proveedor
        resumen["pagado_proveedor"] += pagado_proveedor
        resumen["saldo_proveedor"] += saldo_proveedor

        resumen["utilidad"] += utilidad

    conn.close()

    return render_template(
        "reporte_contabilidad_general.html",
        reservas=reservas,
        resumen=resumen,
        fecha_inicio=fecha_inicio,
        fecha_fin=fecha_fin
    )


from flask import request, render_template


from flask import request, render_template

@app.route('/reporte_corte_fechas', methods=['GET', 'POST'])
def reporte_corte_fechas():
    fecha_inicio = request.form.get('fecha_inicio')
    fecha_fin = request.form.get('fecha_fin')
    orden = request.form.get('orden', 'fecha')  # por defecto orden por fecha

    conn = get_db()
    cursor = conn.cursor()

    query_base = """
        SELECT 
            p.*, 
            r.cliente_id AS cliente_id, 
            r.tipo_reservacion AS tipo_reservacion, 
            c.nombre || ' ' || COALESCE(c.apellidos, '') AS nombre_cliente
        FROM pagos p
        LEFT JOIN reservaciones r ON r.id = p.reservacion_id
        LEFT JOIN clientes c ON c.id = r.cliente_id
    """

    if fecha_inicio and fecha_fin:
        query = query_base + " WHERE date(p.fecha) BETWEEN %s AND %s ORDER BY p.fecha ASC"
        pagos = cursor.execute(query, (fecha_inicio, fecha_fin))
        pagos = cursor.fetchall()
    else:
        query = query_base + " ORDER BY p.fecha DESC"
        pagos = cursor.execute(query)
        pagos = cursor.fetchall()

    # Orden alternativo tipo cuenta T si se selecciona
    if orden == 'tipo_pago':
        pagos = sorted(pagos, key=lambda p: 0 if p['tipo_pago'] in ('cliente_agencia', 'proveedor_agencia') else 1)

    # Calcular ingresos, egresos y saldo
    ingresos = sum(p['monto'] for p in pagos if p['tipo_pago'] in ('cliente_agencia', 'proveedor_agencia'))
    egresos = sum(p['monto'] for p in pagos if p['tipo_pago'] in ('agencia_proveedor', 'agencia_cliente'))
    saldo = ingresos - egresos

    return render_template('reporte_corte_fechas.html',
                           pagos=pagos,
                           fecha_inicio=fecha_inicio,
                           fecha_fin=fecha_fin,
                           total_ingresos=ingresos,
                           total_egresos=egresos,
                           saldo=saldo,
                           orden=orden)


#================ verificar voucher QR inteligente ======

@app.route("/verificar_voucher/<int:reservacion_id>")
def verificar_voucher(reservacion_id):

    conn = get_db()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT r.id,
               r.tipo_reservacion,
               r.estado,
               c.nombre,
               c.apellidos,
               r.costo_cliente
        FROM reservaciones r
        JOIN clientes c ON r.cliente_id = c.id
        WHERE r.id = %s
    """, (reservacion_id,))

    r = cursor.fetchone()
    conn.close()

    if not r:
        return "Voucher no encontrado", 404

    return render_template(
        "verificar_voucher.html",
        r=r
    )



# ------------------- TARJETAS -------------------





@app.route("/reporte_movimiento")
def reporte_movimiento():
    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()

    query = """
    SELECT 
        pagos.*, 
        c.nombre || ' ' || c.apellidos AS cliente,
        reservaciones.cliente, 
        reservaciones.tipo_reservacion
    FROM pagos
    LEFT JOIN reservaciones
        ON pagos.reservacion_id = reservaciones.id
    LEFT JOIN clientes c
        ON reservaciones.cliente_id = c.id
"""
    filtros = []
    params = []

    fecha_inicio = request.args.get("fecha_inicio")
    fecha_fin = request.args.get("fecha_fin")
    recibo = request.args.get("recibo")
    tipo_pago = request.args.get("tipo_pago")
    forma_pago = request.args.get("forma_pago")

    if fecha_inicio:
        filtros.append("fecha >= %s")
        params.append(fecha_inicio)
    if fecha_fin:
        filtros.append("fecha <= %s")
        params.append(fecha_fin)
    if recibo:
        filtros.append("recibo LIKE %s")
        params.append(f"%{recibo}%")
    if tipo_pago:
        filtros.append("tipo_pago = %s")
        params.append(tipo_pago)
    if forma_pago:
        filtros.append("forma_pago LIKE %s")
        params.append(f"%{forma_pago}%")

    if filtros:
        query += " WHERE " + " AND ".join(filtros)

    query += " ORDER BY fecha DESC"

    cursor.execute(query, params)
    pagos = cursor.fetchall()
    conn.close()

    return render_template("reporte_movimiento.html", pagos=pagos)

from flask import request, redirect, url_for, flash
from datetime import datetime

from flask import request, redirect, url_for, flash
from datetime import datetime


@app.route("/cancelar_reservacion/<int:reservacion_id>", methods=["POST"])
def cancelar_reservacion(reservacion_id):
    from datetime import datetime
    conn = get_db()
    cursor = conn.cursor()

    # === DATOS DEL FORMULARIO ===
    penalidad_proveedor_check = request.form.get("penalidad_proveedor") == "si"
    penalizacion_cliente_check = request.form.get("penalizacion_cliente") == "si"
    tipo_devolucion = request.form.get("tipo_devolucion", "devolucion")
    comentarios = request.form.get("comentarios", "")
    monto_penalidad = float(request.form.get("monto_penalidad") or 0)
    monto_penalizacion = float(request.form.get("monto_penalizacion") or 0)
    ahora = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # === OBTENER NUEVO RECIBO ===
    cursor.execute("SELECT MAX(recibo_id) FROM pagos")
    ultimo_recibo = cursor.fetchone()[0]
    recibo_id = (ultimo_recibo or 0) + 1

    # === SUMATORIAS DE PAGOS ACTUALES ===
    cursor.execute("""
        SELECT
            COALESCE(SUM(CASE WHEN tipo_pago = 'cliente_agencia' THEN monto END), 0),
            COALESCE(SUM(CASE WHEN tipo_pago = 'agencia_proveedor' THEN monto END), 0),
            COALESCE(SUM(CASE WHEN tipo_pago = 'proveedor_agencia' THEN monto END), 0),
            COALESCE(SUM(CASE WHEN tipo_pago = 'agencia_cliente' THEN monto END), 0)
        FROM pagos WHERE reservacion_id = %s
    """, (reservacion_id,))
    pagado_cliente, pagado_proveedor, devuelto_proveedor, devuelto_cliente = cursor.fetchone()

    # === VARIABLES BASE ===
    penalidad_proveedor = 0
    penalidad_agencia_real = 0
    devolucion = 0

    # === DEVOLUCIÓN DEL PROVEEDOR (SI APLICA) ===
    if penalidad_proveedor_check and monto_penalidad > 0:
        saldo_prov = pagado_proveedor - devuelto_proveedor
        if saldo_prov >= monto_penalidad:
            monto_devuelto = saldo_prov - monto_penalidad
            if monto_devuelto > 0:
                cursor.execute("""
                    INSERT INTO pagos (reservacion_id, tipo_pago, monto, forma_pago, fecha, observacion, concepto, recibo_id)
                    VALUES (%s, 'proveedor_agencia', %s, 'Transferencia', %s, %s, 'Devolución Proveedor', %s)
                """, (reservacion_id, monto_devuelto, ahora, comentarios, recibo_id))
                recibo_id += 1
        else:
            flash("⚠️ No hay fondos suficientes para aplicar penalidad al proveedor.", "warning")

    # === PENALIDAD AL CLIENTE (SI APLICA) ===
    if penalizacion_cliente_check and monto_penalizacion > 0:
        penalidad_agencia_real = monto_penalizacion
        total_requerido = monto_penalizacion + pagado_proveedor
    if pagado_cliente < total_requerido:
        diferencia = total_requerido - pagado_cliente
        if diferencia > 0:
            cursor.execute("""
                INSERT INTO pagos (reservacion_id, tipo_pago, monto, forma_pago, fecha, observacion, concepto, recibo_id)
                VALUES (%s, 'cliente_agencia', %s, 'Efectivo', %s, %s, 'Penalidad Cliente', %s)
            """, (reservacion_id, diferencia, ahora, comentarios, recibo_id))
            recibo_id += 1

    # === CÁLCULO DE COSTOS Y DEVOLUCIÓN ===
    penalidad_proveedor = monto_penalidad if penalidad_proveedor_check else 0
    penalidad_agencia = penalidad_agencia_real
    nuevo_costo_cliente = penalidad_proveedor + penalidad_agencia
    devolucion = max(0, pagado_cliente - nuevo_costo_cliente)

    # === REGISTRAR DEVOLUCIÓN O SALDO A FAVOR ===
    if tipo_devolucion == "devolucion" and devolucion > 0:
        cursor.execute("""
            INSERT INTO pagos (reservacion_id, tipo_pago, monto, forma_pago, fecha, observacion, concepto, recibo_id)
            VALUES (%s, 'agencia_cliente', %s, 'Transferencia', %s, %s, 'Devolución Cliente', %s)
        """, (reservacion_id, devolucion, ahora, comentarios, recibo_id))
        cursor.execute("UPDATE reservaciones SET devolucion_cliente = %s, saldo_a_favor = 0 WHERE id = %s",
                       (devolucion, reservacion_id))
        recibo_id += 1

    elif tipo_devolucion == "saldo_favor" and devolucion > 0:
        cursor.execute("UPDATE reservaciones SET saldo_a_favor = %s, devolucion_cliente = 0 WHERE id = %s",
                       (devolucion, reservacion_id))

    # === RECALCULAR PAGOS FINALES ===
    cursor.execute("""
        SELECT
            COALESCE(SUM(CASE WHEN tipo_pago = 'cliente_agencia' THEN monto END), 0),
            COALESCE(SUM(CASE WHEN tipo_pago = 'agencia_cliente' THEN monto END), 0),
            COALESCE(SUM(CASE WHEN tipo_pago = 'agencia_proveedor' THEN monto END), 0),
            COALESCE(SUM(CASE WHEN tipo_pago = 'proveedor_agencia' THEN monto END), 0)
        FROM pagos WHERE reservacion_id = %s
    """, (reservacion_id,))
    pagado_cliente, devuelto_cliente, pagado_proveedor, devuelto_proveedor = cursor.fetchone()

    saldo_cliente = pagado_cliente - devuelto_cliente
    saldo_proveedor = pagado_proveedor - devuelto_proveedor
    nuevo_estatus = "cancelada" if saldo_cliente == 0 and saldo_proveedor == 0 else "cancelada"

    # === ACTUALIZAR CAMPOS FINALES DE LA RESERVACIÓN ===
    utilidad_real = penalidad_agencia_real
    nuevo_costo_proveedor = penalidad_proveedor
    saldo_a_favor_cliente = max(0, pagado_cliente - nuevo_costo_cliente)

    cursor.execute("""
        UPDATE reservaciones
        SET
            costo_cliente = %s,
            costo_proveedor = %s,
            utilidad = %s,
            saldo_a_favor = %s,
            penalidad_proveedor = %s,
            penalidad_agencia = %s,
            estatus = %s
        WHERE id = %s
    """, (
        nuevo_costo_cliente,
        nuevo_costo_proveedor,
        utilidad_real,
        saldo_a_favor_cliente if tipo_devolucion == "saldo_favor" else 0,
        penalidad_proveedor,
        penalidad_agencia,
        nuevo_estatus,
        reservacion_id
    ))

    conn.commit()
    conn.close()
    flash(f"Reservación cancelada. Estatus: {nuevo_estatus}", "success")
    return redirect(url_for("detalle_reservacion", reservacion_id=reservacion_id))

@app.route("/editar_reservacion/<int:reservacion_id>", methods=["GET", "POST"])
def editar_reservacion(reservacion_id):
    if "usuario" not in session:
        return redirect(url_for("login"))

    conn = get_db()
    cursor = conn.cursor()
    if request.method == "POST":
        # =========================
        # DATOS GENERALES
        # =========================
        proveedor = request.form.get("proveedor")
        costo_cliente = request.form.get("costo_cliente")
        costo_proveedor = request.form.get("costo_proveedor")

        cursor.execute("""
            UPDATE reservaciones
            SET proveedor = %s, costo_cliente = %s, costo_proveedor = %s
            WHERE id = %s
        """, (proveedor, costo_cliente, costo_proveedor, reservacion_id))

        # =========================
        # DATOS HOTEL (INSERT / UPDATE)
        # =========================
        fecha_entrada = request.form.get("fecha_entrada")

        if fecha_entrada:
            fecha_salida = request.form.get("fecha_salida")
            menores = request.form.get("menores")
            plan = request.form.get("plan")
            tiempo_limite = request.form.get("tiempo_limite")
            clave_proveedor = request.form.get("clave_proveedor")
            observaciones = request.form.get("observaciones")

            cursor.execute(
                "SELECT 1 FROM reservacion_hotel WHERE reservacion_id = %s",
                (reservacion_id,)
            )
            existe_hotel = cursor.fetchone()

            if existe_hotel:
                cursor.execute("""
                    UPDATE reservacion_hotel
                    SET fecha_entrada = %s, fecha_salida = %s, menores = %s, plan = %s,
                        tiempo_limite = %s, clave_proveedor = %s, observaciones = %s
                    WHERE reservacion_id = %s
                """, (
                    fecha_entrada, fecha_salida, menores, plan,
                    tiempo_limite, clave_proveedor, observaciones,
                    reservacion_id
                ))
            else:
                cursor.execute("""
                    INSERT INTO reservacion_hotel
                    (reservacion_id, fecha_entrada, fecha_salida, menores, plan,
                     tiempo_limite, clave_proveedor, observaciones)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                """, (
                    reservacion_id, fecha_entrada, fecha_salida, menores, plan,
                    tiempo_limite, clave_proveedor, observaciones
                ))

        # =========================
        # DATOS AVIÓN (INSERT / UPDATE)
        # =========================
        origen = request.form.get("origen")

        if origen:
            destino = request.form.get("destino")
            vuelo = request.form.get("vuelo")
            fecha_salida_avion = request.form.get("fecha_salida")
            hora_salida = request.form.get("hora_salida")
            hora_llegada = request.form.get("hora_llegada")
            tiempo_limite_avion = request.form.get("tiempo_limite")

            cursor.execute(
                "SELECT 1 FROM reservacion_avion WHERE reservacion_id = %s",
                (reservacion_id,)
            )
            existe_avion = cursor.fetchone()

            if existe_avion:
                cursor.execute("""
                    UPDATE reservacion_avion
                    SET origen = %s, destino = %s, vuelo = %s, fecha_salida = %s,
                        hora_salida = %s, hora_llegada = %s, tiempo_limite = %s
                    WHERE reservacion_id = %s
                """, (
                    origen, destino, vuelo, fecha_salida_avion,
                    hora_salida, hora_llegada, tiempo_limite_avion,
                    reservacion_id
                ))
            else:
                cursor.execute("""
                    INSERT INTO reservacion_avion
                    (reservacion_id, origen, destino, vuelo, fecha_salida,
                     hora_salida, hora_llegada, tiempo_limite)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                """, (
                    reservacion_id, origen, destino, vuelo,
                    fecha_salida_avion, hora_salida,
                    hora_llegada, tiempo_limite_avion
                ))

        conn.commit()
        conn.close()

        return redirect(url_for("detalle_reservacion", reservacion_id=reservacion_id))

    # =========================
    # MODO GET (CARGAR DATOS)
    # =========================
    cursor.execute("SELECT * FROM reservaciones WHERE id = %s", (reservacion_id,))
    r = cursor.fetchone()

    cursor.execute(
        "SELECT * FROM reservacion_hotel WHERE reservacion_id = %s",
        (reservacion_id,)
    )
    hotel = cursor.fetchone()

    cursor.execute(
        "SELECT * FROM reservacion_avion WHERE reservacion_id = %s",
        (reservacion_id,)
    )
    avion = cursor.fetchone()

    conn.close()

    return render_template(
        "editar_reservacion.html",
        r=r,
        hotel=hotel,
        avion=avion
    )

@app.route('/clientes', methods=['GET', 'POST'])
def vista_clientes():
    cliente_id = request.form.get('cliente_id')
    nombre = request.form.get('nombre')

    conn = get_db()
    cursor = conn.cursor()

    # Base del query
    query = """
        SELECT 
            c.id AS cliente_id, c.nombre, c.apellidos, c.email, c.celular, c.referencia,
            r.id AS reservacion_id, r.tipo_reservacion AS tipo_reservacion, r.producto_reservado,
            r.proveedor, r.fecha_creacion, r.costo_cliente
        FROM clientes c
        LEFT JOIN reservaciones r ON c.id = r.cliente_id
        WHERE 1 = 1
    """
    parametros = []

    if cliente_id:
        query += " AND c.id = %s"
        parametros.append(cliente_id)

    if nombre:
        query += " AND c.nombre LIKE %s"
        parametros.append(f"%{nombre}%")

    query += " ORDER BY c.id DESC"

    cursor.execute(query, parametros)
    clientes = cursor.fetchall()

    return render_template("clientes.html", clientes=clientes, cliente_id=cliente_id, nombre=nombre)



if __name__ == "__main__":
    app.run(debug=True)

