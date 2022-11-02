 // Import the functions you need from the SDKs you need
 import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
 import { getFirestore, collection, getDocs, doc, setDoc, deleteDoc, updateDoc } from 'https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js';
 // TODO: Add SDKs for Firebase products that you want to use
 // https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyCOYGWGfGOMjdntIQR77LE_uecVmJxfluA",
    authDomain: "primer-proyecto-56d75.firebaseapp.com",
    projectId: "primer-proyecto-56d75",
    storageBucket: "primer-proyecto-56d75.appspot.com",
    messagingSenderId: "661554891743",
    appId: "1:661554891743:web:ae332acb6fbb065b9e926a"
  };

 // Initialize Firebase
 export const app = initializeApp(firebaseConfig);
 export const db = getFirestore(app);
 export const querySnapshot = await getDocs(collection(db, "tasks"));

 function createCard(id, task) {
     //<div class="card text-white bg-info mb-6  offset-md-4" style="max-width: 20rem;">
     const principalDiv = document.createElement('div');
     principalDiv.setAttribute("class", "card bg-light mb-3");
     principalDiv.style = "max-width: 20rem;";
     principalDiv.setAttribute("name",id);
     //<div class="card-header">Formulario Tareas</div>
     const headerDiv = document.createElement('div');
     const contentDiv = document.createTextNode("Id: " + id);
     headerDiv.setAttribute("class", "card-header");
     
     headerDiv.appendChild(contentDiv);
     principalDiv.appendChild(headerDiv);
     // <div class="card-body">
     const bodyDiv = document.createElement('div');
     const labelTitle = document.createElement("label");
     const labelTitleText = document.createTextNode("Title");
     const inputTitle = document.createElement("input");
     const hr = document.createElement('hr');
     const labelDescription = document.createElement("label");
     const labelDescriptionText = document.createTextNode("Description");
     const inputDescription = document.createElement("input");
     
     inputTitle.value = task.title;
     inputTitle.id = id;
     inputTitle.name = "title";
     inputTitle.readOnly=true;
     inputDescription.value = task.description;
     inputDescription.id = id;
     inputDescription.name = "description";
     inputDescription.readOnly=true;
     
     labelTitle.appendChild(labelTitleText);
     bodyDiv.appendChild(labelTitle);
     bodyDiv.appendChild(inputTitle);
     bodyDiv.appendChild(hr);
     bodyDiv.appendChild(hr);
     labelDescription.appendChild(labelDescriptionText);
     bodyDiv.appendChild(labelDescription);
     bodyDiv.appendChild(inputDescription);
     bodyDiv.appendChild(hr);
     
     
     var input = document.createElement("input");
     input.type = "button";
     input.value = "Borrar Tarea";
     input.setAttribute("name", "delete");
     input.setAttribute("id",id);
     bodyDiv.appendChild(input);

     var input2 = document.createElement("input");
     input2.type = "button";
     input2.value = "Modificar tarea";
     input2.style.display="none";
     input2.setAttribute("name", "update");
     input2.setAttribute("id",id);
     bodyDiv.appendChild(input2);

     var input3 = document.createElement("input");
     input3.type = "button";
     input3.value = "Editar";
     input3.setAttribute("name", "edit");
     input3.setAttribute("id",id);
     bodyDiv.appendChild(input3);
 
     principalDiv.appendChild(bodyDiv);

     document.body.appendChild(principalDiv);
     const br = document.createElement("br");
     document.body.appendChild(br);
     
 }

 export function getTasks() {
    querySnapshot.forEach((doc) => {
        createCard(doc.id, doc.data());
    });
 }
 function generateRandomIdTask(num) {
     const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
     let result = '';
     const charactersLength = characters.length;
     for (let i = 0; i < num; i++) {
         result += characters.charAt(Math.floor(Math.random() * charactersLength));
     }

     return result;
 }
 export async function insertTask(task) {
     await setDoc(doc(db, "tasks", generateRandomIdTask(20)), task);
     alert("Insertada la tarea: "+task.title);
 }

 export async function deleteTask(id){
     await deleteDoc(doc(db, "tasks", id));   
     alert("Borrada la tarea: "+id);
 }

 export async function updateTask(id){
    var title = document.querySelector(`#${id}[name="title"]`).value;
    var description = document.querySelector(`#${id}[name="description"]`).value;
    await updateDoc(doc(db, "tasks", id),{"title": title, "description": description});  
    alert("Actualizada la tarea: "+id);
}