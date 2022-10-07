
// const link = document.querySelector("a");

// function handleLinkClick(event){
//     event.preventDefault();
//     //console.dir(event);
// }

// link.addEventListener("click",handleLinkClick);
// //�� ���� �Լ��� �������� �������ִ� �Լ��̱� ������ ()�� ������ �ʾƾ� �Ѵ�. 


const loginInput = document.querySelector("#login-form input");
const loginForm = document.querySelector("#login-form");
const greeting = document.querySelector("#greeting");

const USERNAME_KEY = "userName"; //String�� �����ؼ� ����� �� ��Ÿ�� Ȯ�������� ���뺯���� ��� 

const savedUserName = localStorage.getItem(USERNAME_KEY);

function onLoginSubmit(event){
    event.preventDefault();
    loginForm.classList.add("hidden");
    localStorage.setItem(USERNAME_KEY,loginInput.value);
    
    paintGreetings(loginInput.value);
}

function paintGreetings(userName){
    greeting.innerHTML = "hidden Text!! input text = " + userName + "<br>";
    greeting.innerHTML += `used backTick !! input text =  ${userName} `;
    greeting.classList.toggle("hidden");

}


console.log(savedUserName);

if(savedUserName == null){
    loginForm.classList.remove("hidden");
    loginForm.addEventListener("submit", onLoginSubmit);
}else{
    paintGreetings(savedUserName);
 
}




