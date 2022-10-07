
const toDoForm = document.getElementById("todo-form");
const toDoInput = toDoForm.querySelector("#todo-form input");
const toDoList = document.getElementById("todo-list");

let toDos = [];
const TODOS_KEY = "todos";

function saveToDos(){//로컬에 정보를 저장하기 위해 사용 

    localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
    // 그냥 toDos를 저장하면 하나의 연결된 텍스트로 저장된다. 
    // 배열로 저장하기 위해서는 JSON.stringify() 를 사용한다 
}

function toDoDelete(event){//부모 태그인 li태그를 삭제시킴 
    //console.log(event.target.parentElement.innerText);
    //console.dir(event.target.parentElement);
    
    const remove_li = event.target.parentElement;
    remove_li.remove();

    toDos = toDos.filter((t) => t.id !== parseInt(remove_li.id));
    saveToDos();


}


function paintTodo(newTodoObj){
    const li = document.createElement("li");
    li.id = newTodoObj.id;
    const span = document.createElement("span");
    const button = document.createElement("button");
    button.innerText = " X ";    

    li.appendChild(span);
    li.appendChild(button);

    span.innerText = newTodoObj.text + " ";
    toDoList.appendChild(li);

    button.addEventListener("click", toDoDelete);

    //console.log(li);



}


function handleTodoSubmit(e){
    e.preventDefault();
    const newTodo = toDoInput.value;
    toDoInput.value = "";

    const newTodoObj = {//array가 아닌 object형으로 관리한다. 
        text : newTodo,
        id : Date.now(),
    };

    toDos.push(newTodoObj);
    paintTodo(newTodoObj);//텍스트 내용 
    saveToDos();


}

toDoForm.addEventListener("submit", handleTodoSubmit);


const local_saveToDos = localStorage.getItem(TODOS_KEY);

console.log(local_saveToDos);

if(local_saveToDos !== null){
    const parsedToDos = JSON.parse(local_saveToDos);
    toDos = parsedToDos;//이전의 저장되어있는 값을 기억하기 위해서 

    console.log(` save : ${local_saveToDos}`);
    parsedToDos.forEach(element => {
        paintTodo(element);
        
    });

    //parsedToDos.forEach(paintTodo);
}



// function test_item(item){
//     console.log(item);
// }

// const _test = {
//     name: "test",
//     age : 9,
// }

// const _test_array = ["a","b","c"];


// test_item(_test_array);
