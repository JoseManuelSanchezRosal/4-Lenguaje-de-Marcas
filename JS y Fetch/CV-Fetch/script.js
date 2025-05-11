

document.addEventListener("DOMContentLoaded", () => {
    const botones = document.querySelectorAll("button[data-section]");
    const texto = document.getElementById("contenido-texto");
    const img = document.getElementById("img-seccion");

    const imagenes = {
        sobre_mi: "sources/sobremi.png",
        formacion: "sources/logoestudios.png",
        experiencia: "sources/logotrabajo.png",
        actitudes: "sources/logoactitudes.png",
        habilidades: "sources/logohabilidades.png"
    };

    botones.forEach(boton => {
        boton.addEventListener("click", () => {
            const seccion = boton.dataset.section;
            fetch("cv.json")
                .then(response => response.json())
                .then(data => {
                    texto.innerHTML = data[seccion] || "Sección no encontrada.";
                    img.src = imagenes[seccion] || "img/inicial.jpg";
                    img.classList.remove("inicial"); // Quitar clase de imagen inicial
                })
                .catch(error => {
                    texto.innerHTML = "Error al cargar el contenido.";
                    console.error(error);
                });
        });
    });

    // Al inicio, aplicar clase "inicial" para que se vea grande
    document.getElementById("img-seccion").classList.add("inicial");
});
