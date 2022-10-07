
const toDoForm = document.getElementById("todo-form");
const toDoInput = toDoForm.querySelector("#todo-form input");
const toDoList = document.getElementById("todo-list");

let toDos = [];
const TODOS_KEY = "todos";

function saveToDos(){//���ÿ� ������ �����ϱ� ���� ��� 

    localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
    // �׳� toDos�� �����ϸ� �ϳ��� ����� �ؽ�Ʈ�� ����ȴ�. 
    // �迭�� �����ϱ� ���ؼ��� JSON.stringify() �� ����Ѵ� 
}

function toDoDelete(event){//�θ� �±��� li�±׸� ������Ŵ 
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

    const newTodoObj = {//array�� �ƴ� object������ �����Ѵ�. 
        text : newTodo,
        id : Date.now(),
    };

    toDos.push(newTodoObj);
    paintTodo(newTodoObj);//�ؽ�Ʈ ���� 
    saveToDos();


}

toDoForm.addEventListener("submit", handleTodoSubmit);


const local_saveToDos = localStorage.getItem(TODOS_KEY);

console.log(local_saveToDos);

if(local_saveToDos !== null){
    const parsedToDos = JSON.parse(local_saveToDos);
    toDos = parsedToDos;//������ ����Ǿ��ִ� ���� ����ϱ� ���ؼ� 

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
