// Mostrar tipo de reservación
function mostrarTipo(tipo) {
  const hotel = document.getElementById("bloque_hotel");
  const avion = document.getElementById("bloque_avion");

  if (hotel) hotel.style.display = "none";
  if (avion) avion.style.display = "none";

  if (tipo === "hotel" && hotel) {
    hotel.style.display = "block";
  }

  if (tipo === "avion" && avion) {
    avion.style.display = "block";
  }
}

// Generar habitaciones dinámicamente
function generarHabitaciones(cantidad) {
  const contenedor = document.getElementById("contenedor_habitaciones");
  contenedor.innerHTML = "";

  const num = parseInt(cantidad);
  if (isNaN(num) || num <= 0) return;

  for (let i = 1; i <= num; i++) {
    const div = document.createElement("div");
    div.className = "habitacion";
    div.innerHTML = `
      <label>Habitación ${i}</label><br>
      Adultos: <input type="number" name="adultos_${i}" min="1" max="4" required>
      Menores: <input type="number" name="menores_${i}" min="0" max="4" onchange="mostrarEdadMenores(this, ${i})">
      Edades: <input type="text" name="edades_${i}" placeholder="Ej: 5, 8" >

      ${i > 1 ? `
      <br>
      <label><input type="checkbox" onchange="toggleNombreExtra(this, ${i})"> Agregar nombre adicional</label>
      <div id="nombre_extra_${i}" style="display:none;">
        Nombre adicional: <input type="text" name="nombre_adicional_${i}">
      </div>
      ` : ""}
    `;
    contenedor.appendChild(div);
    
    
  }
}

function toggleNombreExtra(checkbox, index) {
  const div = document.getElementById(`nombre_extra_${index}`);
  div.style.display = checkbox.checked ? "block" : "none";
}

// Mostrar campos de edad de menores
function mostrarEdades(habitacion, cantidad) {
  const div = document.getElementById(`edades_${habitacion}`);
  div.innerHTML = "";

  const num = parseInt(cantidad);
  if (isNaN(num) || num <= 0) return;

  for (let j = 1; j <= num; j++) {
    const input = document.createElement("input");
    input.type = "number";
    input.name = `edades_${habitacion}_${j}`;
    input.placeholder = `Edad menor ${j}`;
    input.min = 1;
    input.max = 17;
    input.style.marginRight = "5px";
    div.appendChild(input);
  }
}

// Mostrar/ocultar nombre extra
function toggleNombreExtra(checkbox, habitacion) {
  const input = document.getElementById(`nombre_extra_${habitacion}`);
  if (checkbox.checked) {
    input.style.display = "inline-block";
  } else {
    input.value = "";
    input.style.display = "none";
  }
}

function limpiarMoneda(valor) {
  return valor.replace(/[^\d.-]/g, '');
}



document.addEventListener("DOMContentLoaded", () => {
  // ========== Fecha Entrada ==========
  const mostrarEntrada = document.getElementById("fecha_entrada_mostrar");
  const realEntrada = document.getElementById("fecha_entrada_real");
  const selectorEntrada = document.getElementById("selector_fecha_entrada");

  if (mostrarEntrada && realEntrada && selectorEntrada) {
    mostrarEntrada.addEventListener("click", () => selectorEntrada.showPicker());

    selectorEntrada.addEventListener("change", () => {
      const fecha = new Date(selectorEntrada.value);
      const opciones = { day: '2-digit', month: 'short', year: 'numeric' };
      mostrarEntrada.value = fecha.toLocaleDateString('es-MX', opciones);
      realEntrada.value = selectorEntrada.value;
    });
  }

  // ========== Fecha Salida ==========
  const mostrarSalida = document.getElementById("fecha_salida_mostrar");
  const realSalida = document.getElementById("fecha_salida_real");
  const selectorSalida = document.getElementById("selector_fecha_salida");

  if (mostrarSalida && realSalida && selectorSalida) {
    mostrarSalida.addEventListener("click", () => selectorSalida.showPicker());

    selectorSalida.addEventListener("change", () => {
      const fecha = new Date(selectorSalida.value);
      const opciones = { day: '2-digit', month: 'short', year: 'numeric' };
      mostrarSalida.value = fecha.toLocaleDateString('es-MX', opciones);
      realSalida.value = selectorSalida.value;
    });
  }

  // ========== Fecha Regreso ==========
  const mostrarRegreso = document.getElementById("fecha_regreso_mostrar");
  const realRegreso = document.getElementById("fecha_regreso_real");
  const selectorRegreso = document.getElementById("selector_fecha_regreso");

  if (mostrarRegreso && realRegreso && selectorRegreso) {
    mostrarRegreso.addEventListener("click", () => selectorRegreso.showPicker());

    selectorRegreso.addEventListener("change", () => {
      const fecha = new Date(selectorRegreso.value);
      const opciones = { day: '2-digit', month: 'short', year: 'numeric' };
      mostrarRegreso.value = fecha.toLocaleDateString('es-MX', opciones);
      realRegreso.value = selectorRegreso.value;
    });
  }

  // ========== Fecha Salida Avión ==========
  const mostrarSalidaAvion = document.getElementById("fecha_salida_avion_mostrar");
  const realSalidaAvion = document.getElementById("fecha_salida_avion_real");
  const selectorSalidaAvion = document.getElementById("selector_fecha_salida_avion");

  if (mostrarSalidaAvion && realSalidaAvion && selectorSalidaAvion) {
    mostrarSalidaAvion.addEventListener("click", () => selectorSalidaAvion.showPicker());

    selectorSalidaAvion.addEventListener("change", () => {
      const fecha = new Date(selectorSalidaAvion.value);
      const opciones = { day: '2-digit', month: 'short', year: 'numeric' };
      mostrarSalidaAvion.value = fecha.toLocaleDateString('es-MX', opciones);
      realSalidaAvion.value = selectorSalidaAvion.value;
    });
  }

// ========== Tiempo Límite Hotel ==========
  const mostrarLimiteHotel = document.getElementById("tiempo_limite_hotel_mostrar");
  const realLimiteHotel = document.getElementById("tiempo_limite_hotel_real");
  const selectorLimiteHotel = document.getElementById("selector_tiempo_limite_hotel");

  if (mostrarLimiteHotel && realLimiteHotel && selectorLimiteHotel) {
    mostrarLimiteHotel.addEventListener("click", () => selectorLimiteHotel.showPicker());

    selectorLimiteHotel.addEventListener("change", () => {
      const fecha = new Date(selectorLimiteHotel.value);
      const opciones = {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
      };

      mostrarLimiteHotel.value =
        fecha.toLocaleDateString('es-MX', opciones) + " " +
        fecha.toLocaleTimeString('es-MX', { hour: '2-digit', minute: '2-digit' });

      realLimiteHotel.value = selectorLimiteHotel.value;
    });
  }


  // ========== Tiempo Límite Avión ==========
  const mostrarLimiteAvion = document.getElementById("tiempo_limite_avion_mostrar");
  const realLimiteAvion = document.getElementById("tiempo_limite_avion_real");
  const selectorLimiteAvion = document.getElementById("selector_tiempo_limite_avion");

  if (mostrarLimiteAvion && realLimiteAvion && selectorLimiteAvion) {
    mostrarLimiteAvion.addEventListener("click", () => selectorLimiteAvion.showPicker());

    selectorLimiteAvion.addEventListener("change", () => {
      const fecha = new Date(selectorLimiteAvion.value);
      const opciones = { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' };
      mostrarLimiteAvion.value = fecha.toLocaleDateString('es-MX', opciones) + " " + fecha.toLocaleTimeString('es-MX', { hour: '2-digit', minute: '2-digit' });
      realLimiteAvion.value = selectorLimiteAvion.value;
    });
  }
});


function formatearMoneda(input) {
  let valor = parseFloat(input.value.replace(/[^\d.]/g, ''));
  if (isNaN(valor)) {
    input.value = "";
    return;
  }

  input.value = valor.toLocaleString("es-MX", {
    style: "currency",
    currency: "MXN",
    minimumFractionDigits: 2
  });
}

function generarPasajeros(cantidad) {
  const contenedor = document.getElementById("contenedor_pasajeros");
  contenedor.innerHTML = ""; // Limpiar contenido previo

  const checkboxDiv = document.getElementById("checkbox_copiar");
  checkboxDiv.innerHTML = ""; // Limpiar también el div

  // ✅ Insertar checkbox SOLO si es 1 pasajero
  if (cantidad === "1") {
    checkboxDiv.innerHTML = `
      <label><input type="checkbox" id="usar_nombre_cliente">
      Usar nombre del cliente para pasajero 1</label>
    `;
  }

  // Generar campos de pasajeros
  for (let i = 1; i <= cantidad; i++) {
    const div = document.createElement("div");
    div.className = "form-row";
    div.innerHTML = `
      <label>Pasajero ${i}:</label>
      <input type="text" id="nombre_pasajero_${i}" name="nombre_pasajero_${i}" placeholder="Nombre">
      <input type="text" id="apellidos_pasajero_${i}" name="apellidos_pasajero_${i}" placeholder="Apellidos">
      <input type="date" name="fecha_nacimiento_${i}" placeholder="Fecha de nacimiento">
    `;
    contenedor.appendChild(div);
  }

  // Asignar evento al checkbox si existe
  const checkbox = document.getElementById("usar_nombre_cliente");
  if (cantidad === "1" && checkbox) {
    checkbox.checked = false;
    checkbox.onchange = function () {
      const nombreCliente = document.getElementById("cliente_nombre");
      const apellidosCliente = document.getElementById("cliente_apellidos");

      if (this.checked && nombreCliente && apellidosCliente) {
        document.getElementById("nombre_pasajero_1").value = nombreCliente.value;
        document.getElementById("apellidos_pasajero_1").value = apellidosCliente.value;
      } else {
        document.getElementById("nombre_pasajero_1").value = "";
        document.getElementById("apellidos_pasajero_1").value = "";
      }
    };
  }
}
  

document.addEventListener("DOMContentLoaded", () => {
  const selectPasajeros = document.getElementById("no_pasajeros");
  if (selectPasajeros) {
    selectPasajeros.addEventListener("change", function() {
      generarPasajeros(this.value);
    });
  }
});

// Al final de reservacion.js
function toggleRedondo() {
  const redondo = document.querySelector('input[name="tipo_vuelo"][value="redondo"]').checked;
  const bloque = document.getElementById("fecha_regreso_bloque");

  if (bloque) {
    bloque.style.display = redondo ? "block" : "none";
  }
}

function toggleEscala() {
  const checkbox = document.getElementById("agregar_escala");
  const bloqueEscala = document.getElementById("bloque_escala");

  if (checkbox && bloqueEscala) {
    bloqueEscala.style.display = checkbox.checked ? "block" : "none";
  }
}

function validarCamposObligatorios() {
    let campos = document.querySelectorAll('[data-requiere="true"]');
    let valido = true;

    campos.forEach(function(campo) {
        // Solo valida campos visibles
        if (campo.offsetParent !== null && campo.value.trim() === "") {
            campo.classList.add("is-invalid");
            valido = false;
        } else {
            campo.classList.remove("is-invalid");
        }
    });

    return valido;
}

document.addEventListener("DOMContentLoaded", function () {
    // Validación de campos con data-requiere
    function validarCamposObligatorios() {
        let campos = document.querySelectorAll('[data-requiere="true"]');
        let valido = true;

        campos.forEach(function(campo) {
            if (campo.offsetParent !== null && campo.value.trim() === "") {
                campo.classList.add("is-invalid");
                valido = false;
            } else {
                campo.classList.remove("is-invalid");
            }
        });

        return valido;
    }

    // Validación al enviar formulario
    const form = document.getElementById("formulario");
    if (form) {
        form.addEventListener("submit", function (e) {
            if (!validarCamposObligatorios()) {
                e.preventDefault();
                alert("Por favor, completa todos los campos obligatorios.");
            }
        });
    }

   
});

let camposModificados = false;

document.addEventListener("DOMContentLoaded", function () {
  const formulario = document.querySelector("form");

  // Detectar si se ha escrito algo
  formulario.addEventListener("input", function () {
    camposModificados = true;
  });

  // Botón de volver al menú
  const botonMenu = document.getElementById("btn_volver_menu");
  if (botonMenu) {
    botonMenu.addEventListener("click", function (e) {
      if (camposModificados) {
        const confirmar = confirm("¿Desea abandonar esta reservación? Se perderán los datos no guardados.");
        if (!confirmar) {
          e.preventDefault();
        }
      }
    });
  }
});

document.getElementById('usar_nombre_cliente').addEventListener('change', function () {
  const checked = this.checked;
  const nombre = document.getElementById('cliente_nombre').value;
  const apellidos = document.getElementById('cliente_apellidos').value;

  if (checked && nombre && apellidos) {
    const inputNombre = document.querySelector('input[name="pasajero_1_nombre"]');
    const inputApellidos = document.querySelector('input[name="pasajero_1_apellidos"]');
    if (inputNombre && inputApellidos) {
      inputNombre.value = nombre;
      inputApellidos.value = apellidos;
    }
  }
});

function generarPasajeros(n) {
  const contenedor = document.getElementById('contenedor_pasajeros');
  contenedor.innerHTML = '';

  for (let i = 1; i <= n; i++) {
    const div = document.createElement('div');
    div.className = 'form-row-doble';
    div.innerHTML = `
      <div>
        <label>Pasajero ${i} - Nombre</label>
        <input type="text" name="pasajero_${i}_nombre">
      </div>
      <div>
        <label>Apellidos</label>
        <input type="text" name="pasajero_${i}_apellidos">
      </div>
    `;
    contenedor.appendChild(div);
  }

  const usarNombre = document.getElementById('usar_nombre_cliente');
  if (usarNombre.checked && n >= 1) {
    const nombre = document.getElementById('cliente_nombre').value;
    const apellidos = document.getElementById('cliente_apellidos').value;

    const inputNombre = document.querySelector('input[name="pasajero_1_nombre"]');
    const inputApellidos = document.querySelector('input[name="pasajero_1_apellidos"]');

    if (inputNombre && inputApellidos) {
      inputNombre.value = nombre;
      inputApellidos.value = apellidos;
    }
  }
}

function generarPasajeros(num) {
  const contenedor = document.getElementById('contenedor_pasajeros');
  contenedor.innerHTML = ''; // Limpia contenido anterior

  const checkboxDiv = document.getElementById('checkbox_uso_cliente');
  checkboxDiv.style.display = (parseInt(num) > 0) ? 'block' : 'none';

  for (let i = 1; i <= num; i++) {
    const div = document.createElement('div');
    div.className = 'form-row';
    div.innerHTML = `
      <label>Pasajero ${i} - Nombre</label>
      <input type="text" name="pasajero_${i}_nombre">

      <label>Apellidos</label>
      <input type="text" name="pasajero_${i}_apellidos">
    `;
    contenedor.appendChild(div);
  }
}

// Lógica para copiar nombre y apellidos del cliente al pasajero 1
document.addEventListener('DOMContentLoaded', function () {
  const checkbox = document.getElementById('usar_nombre_cliente');

  if (checkbox) {
    checkbox.addEventListener('change', function () {
      const checked = this.checked;
      const nombre = document.querySelector('input[name="nombre"]').value;
      const apellidos = document.querySelector('input[name="apellidos"]').value;

      if (checked && nombre && apellidos) {
        const inputNombre = document.querySelector('input[name="pasajero_1_nombre"]');
        const inputApellidos = document.querySelector('input[name="pasajero_1_apellidos"]');
        if (inputNombre && inputApellidos) {
          inputNombre.value = nombre;
          inputApellidos.value = apellidos;
        }
      }
    });
  }
});