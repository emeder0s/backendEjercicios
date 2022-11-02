//Me traigo mi db firestore
import { getTasks, insertTask, deleteTask, updateTask } from "./utils.js";
//console.log(db);
//Extraigo todos los documentos de tasks y creo tarjetas con ellos
getTasks();


//Obtenemos el form y capturamos el submit
const form = document.getElementById("task-form");
form.addEventListener("submit", e => {
    e.preventDefault();
    const task = {
        title: form["task-title"].value,
        description: form["task-description"].value
    }

    insertTask(task).then(() => location.reload());
})


const buttonsCardD = document.getElementsByName("delete");
buttonsCardD.forEach(element => {
    element.addEventListener("click",  () => {
        var divDelete = element.parentNode.parentNode;
        document.body.removeChild(divDelete);
        //console.log("Estoy borrando la tarea: "+element.id);
        deleteTask(element.id).then(() => location.reload());
    })
});

const buttonsCardDUpdate = document.getElementsByName("update");
buttonsCardDUpdate.forEach(element => {
    element.addEventListener("click",  () => {
        updateTask(element.id).then(() => location.reload());
       
    })
});

const buttonsEdit = document.getElementsByName("edit");
buttonsEdit.forEach(element => {
    element.addEventListener("click",  () => {
        element.style.display="none";
        document.querySelector(`#${element.id}[name="update"]`).style.display = "";
        document.querySelector(`#${element.id}[name="title"]`).readOnly = false;
        document.querySelector(`#${element.id}[name="description"]`).readOnly = false; 
    })
});