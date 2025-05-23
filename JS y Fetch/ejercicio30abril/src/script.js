// El query selector es para buscar la clase button.
// El addEventListener es para asociar un evento al hacer click.
document.querySelector('.button').addEventListener('click', () => {
    fetch('productos.xml') // Cargar el archivo productos.xml facilitado por Profesor
    .then(response => response.text()) // Conversión de respuesta a texto plano
    .then(xmlString => {
        // Crear un objeto DOMParser para analizar el XML
        // El DOMParser es una interfaz que permite analizar cadenas de texto en un documento XML o HTML.
        const parser = new DOMParser(); // Instanciamos objeto DOMParser
        const xml = parser.parseFromString(xmlString, 'application/xml'); // Analizamos el XML
        const productos = xml.getElementsByTagName('Producto'); // Obtenemos todos los elementos con la etiqueta Producto.
        
        const contenedor = document.getElementById('lista-productos'); // En la ID lista-productos cargaremos nuestros productos.
        // Limpiar el contenido del contenedor con removeChild
    while (contenedor.firstChild) {
        contenedor.removeChild(contenedor.firstChild);
    }
    const h1 = document.createElement('h1');
    h1.textContent = 'QUIERO MI 10!!! MIKE';
    contenedor.appendChild(h1);
        // Recorremos los productos y creamos un elemento div para cada uno.
        // Declaramos las variables fuera del bucle for para evitar que se repitan en cada iteración (Esto es importante para evitar problemas de alcance y mantener el código limpio):
        const productosLength = productos.length;
        let producto;
        let nombre;
        let precio;
        let etiquetas;
        let etiquetasTexto;
        let etiquetasLength;
        for (let i = 0; i < productos.length; i++) {
            producto = productos[i]; // Obtenemos el producto actual
            nombre = producto.getElementsByTagName('Nombre')[0].textContent;// Obtenemos el nombre del producto.
            precio = producto.getElementsByTagName('Precio')[0].textContent;// Obtenemos el precio del producto
  
            etiquetas = producto.getElementsByTagName('Etiqueta');
            etiquetasTexto = [];// Creamos un array para almacenar las etiquetas de cada producto.
            etiquetasLength = etiquetas.length;// Obtenemos la longitud del array etiquetas.
            // Recorremos las etiquetas y las almacenamos en el array etiquetasTexto:
            for (let j = 0; j < etiquetas.length; j++) {
                etiquetasTexto.push(etiquetas[j].textContent);// Apendamos el contenido de cada etiqueta al array etiquetasTexto.
            }
            const div = document.createElement('div');
            div.innerHTML = `
            <h3>${nombre}</h3>
            <p><strong>Precio:</strong> $${precio}</p>
            <p><strong>Etiquetas:</strong> ${etiquetasTexto.join(', ')}</p>
            <button class="eliminar">Eliminar</button>
            <hr/>`; // La etiqueta <hr/> es para separar los productos visualmente con una línea horizontal.
            // Creamos un button class para añadir la opción de eliminar el producto.
            // Agregar evento al botón "Eliminar"
            div.querySelector('.eliminar').addEventListener('click', () => {
            div.remove(); // Elimina este producto del DOM
            });

            contenedor.appendChild(div);
            // Añadimos el div al contenedor en el HTML.
        }
    })

    // Si hay un error al cargar el XML, lo capturamos y mostramos en la consola.
    .catch(error => {
        console.error('Error al cargar el XML:', error);
    });
});
