document.addEventListener("DOMContentLoaded", () => {
    const botones = document.querySelectorAll("button[data-section]");
    const contenedorTexto = document.getElementById("contenido-texto");
    const contenedorImagen = document.getElementById("contenido-imagen");

    botones.forEach(boton => {
        boton.addEventListener("click", () => {
            const seccion = boton.getAttribute("data-section");
            fetch(`secciones/${seccion}.html`)
                .then(response => {
                    if (!response.ok) throw new Error("Archivo no encontrado");
                    return response.text();
                })
                .then(html => {
                    contenedorTexto.innerHTML = html;
                    contenedorImagen.style.display = "none";
                })
                .catch(error => {
                    contenedorTexto.innerHTML = "<p>Error al cargar el contenido.</p>";
                    console.error(error);
                });
        });
    });
});
