
// const link = document.querySelector("a");

// function handleLinkClick(event){
//     event.preventDefault();
//     //console.dir(event);
// }

// link.addEventListener("click",handleLinkClick);
// //이 안의 함수는 브라우저가 실행해주는 함수이기 때문에 ()를 붙이지 않아아 한다. 


const loginInput = document.querySelector("#login-form input");
const loginForm = document.querySelector("#login-form");
const greeting = document.querySelector("#greeting");

const USERNAME_KEY = "userName"; //String을 연속해서 사용할 때 오타날 확률때문에 공통변수로 사용 

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




