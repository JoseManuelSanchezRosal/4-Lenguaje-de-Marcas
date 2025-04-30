const sobreMi = document.getElementById('sobre-mi');
const experiencias = document.getElementById('experiencias');
const contacto = document.getElementById('contacto');
const contenedor = document.getElementById('contenedor');

// Eventos
sobreMi.addEventListener('click', async function() {
    while (contenedor.firstChild) {
        contenedor.firstChild.remove();
    }
    const response = await fetch('data/sobre-mi.json');
    const json = await response.json();

    const img = document.createElement('img');
    const descripcionP = document.createElement('p');

    img.src = json.imagen;
    descripcionP.textContent = json.descripcion;

    contenedor.appendChild(img);
    contenedor.appendChild(descripcionP);
});

experiencias.addEventListener('click', async () => {
    while (contenedor.firstChild) {
        contenedor.firstChild.remove();
    }
    const response = await fetch('data/experiencias.json');
    const json = await response.json();
    
    const experienciasUl = document.createElement('ul');
    let experienciaLi;
    for (const experiencia of json.experiencias) {
        experienciaLi = document.createElement('li');
        experienciaLi.textContent = experiencia;
        experienciasUl.appendChild(experienciaLi);
    }

    contenedor.appendChild(experienciasUl);
})

contacto.addEventListener('click', () => {
    while (contenedor.firstChild) {
        contenedor.firstChild.remove();
    }
    fetch('data/contacto.json')
        .then(response => response.json())
        .then(json => {
            const nombreP = document.createElement('p');
            nombreP.textContent = json.nombre;
        
            contenedor.appendChild(nombreP);
        });
})