// Variables globales
let currentVersion = 'array';
let notesArray = [];
let notesClass = [];

// Función para mostrar la interfaz de la versión con arrays
function showArrayVersion() {
    currentVersion = 'array';
    renderApp();
}

// Función para mostrar la interfaz de la versión con clases
function showClassVersion() {
    currentVersion = 'class';
    renderApp();
}

// Función para renderizar la aplicación según la versión seleccionada
function renderApp() {
    let appContainer = document.getElementById('app');
    appContainer.innerHTML = `
        <h2>Aplicación de Notas (${currentVersion === 'array' ? 'Versión Array' : 'Versión Clases'})</h2>
        <textarea id="noteText" placeholder="Escribe tu nota aquí..."></textarea>
        <br>
        <button onclick="addNote()">Añadir Nota</button>
        <div class="note-container" id="notes"></div>
    `;
    renderNotes();
}

// Función para agregar una nota
function addNote() {
    let noteText = document.getElementById('noteText').value;
    if (noteText.trim() === '') return;

    if (currentVersion === 'array') {
        notesArray.push(noteText);
    } else if (currentVersion === 'class') {
        notesClass.push(new Note(noteText));
    }
    document.getElementById('noteText').value = '';
    renderNotes();
}

// Función para eliminar una nota
function deleteNote(index) {
    if (currentVersion === 'array') {
        notesArray.splice(index, 1);
    } else if (currentVersion === 'class') {
        notesClass.splice(index, 1);
    }
    renderNotes();
}

// Función para editar una nota
function editNote(index) {
    let newText = prompt('Edita tu nota:', currentVersion === 'array' ? notesArray[index] : notesClass[index].text);
    if (newText === null || newText.trim() === '') return;

    if (currentVersion === 'array') {
        notesArray[index] = newText;
    } else if (currentVersion === 'class') {
        notesClass[index].edit(newText);
    }
    renderNotes();
}

// Función para renderizar las notas
function renderNotes() {
    let notesContainer = document.getElementById('notes');
    notesContainer.innerHTML = '';

    let notes = currentVersion === 'array' ? notesArray : notesClass;

    notes.forEach((note, index) => {
        let noteElement = document.createElement('div');
        noteElement.classList.add('note');

        let noteText = currentVersion === 'array' ? note : `${note.text} <br><small>Creado: ${note.timestamp}</small>`;

        noteElement.innerHTML = `
            <div>
                <p>${noteText}</p>
            </div>
            <div>
                <button onclick="editNote(${index})">Editar</button>
                <button onclick="deleteNote(${index})">Borrar</button>
            </div>
        `;

        notesContainer.appendChild(noteElement);
    });
}

// Clase para la versión con objetos
class Note {
    constructor(text) {
        this.text = text;
        this.timestamp = new Date().toLocaleString();
    }

    // Método para editar una nota
    edit(newText) {
        this.text = newText;
        this.timestamp = new Date().toLocaleString(); // Actualizamos la hora
    }
}

// Inicializamos la interfaz
renderApp();
