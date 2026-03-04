document.addEventListener("DOMContentLoaded", () => {

    const hour = new Date().getHours();
    const body = document.body;

    // Quitar clases anteriores por si acaso
    body.classList.remove("theme-day", "theme-sunset");

    // Antes de las 3 pm → Lobby de día
    if (hour < 15) {
        body.classList.add("theme-day");
    } 
    // Después de las 3 pm → Playa al atardecer
    else {
        body.classList.add("theme-sunset");
    }

});