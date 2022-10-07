


// // 1. 자바스크립트로 element 가져오기 
// const h1 = document.getElementById("h1");
// console.dir(h1);
// h1.innerHTML = "hi";






// // 2. 자바스크립트로 이벤트 추가 
// const h1 = document.querySelector("div.hello:first-child h1");
// //const h1 = document.querySelector(".hello h1");
// // console.log(h1)
// // h1.innerText = "Hello";

// function handTitleClick(){
//     const currentColor = h1.style.color;
//     let newColor;

//     if(currentColor == "blue"){
//         newColor = "tomato";
//     }else{
//         newColor = "blue";
//     }

//     h1.style.color = newColor;
// }

// function handleMouseEnter(){
//     h1.innerText = "Mouse is here!";
// }

// function handleMouseLeave(){
//     h1.innerText = "Mouse is out!!";
// }



// function handleWindowResize(){
//     document.body.style.backgroundColor = "tomato";
// }


// function handlerWidowCopy(){
//     alert("copier!");
// }

// function handlerWindowOffline(){
//     alert("WIFI is not connect");
// }

// function handlerWindowOnline(){
//     alert("WIFI is connect");
// }


// h1.addEventListener("click", handTitleClick);
// //h1.onclick = handTitleClick;
// h1.addEventListener("mouseenter", handleMouseEnter);
// h1.addEventListener("mouseleave", handleMouseLeave);

// window.addEventListener("resize", handleWindowResize);//window의 화면크기가 변하면 실행 
// window.addEventListener("copy", handlerWidowCopy);//카피했을경우 출력됨 
// window.addEventListener("offline", handlerWindowOffline);//와이파이 끊겼을 경우 
// window.addEventListener("online", handlerWindowOnline);// 와이파이 연결됐을 경우








// 3. 이벤트 리스너와 css 연동 
// const h1 = document.querySelector("div.hello:first-child h1");

// function handleTitleClick(){
//     const clickedClass = "clicked";

//     if(h1.className === clickedClass){
//         h1.className = "";
//     }else{
//         h1.className = clickedClass;
//     }
// }

// h1.addEventListener("click", handleTitleClick);








// 4. ClassList이용해서 class 사용 
const h1 = document.querySelector("div.hello:first-child h1");

function handleTitleClick(){
    // const clickedClass = "clicked";

    // if(h1.classList.contains(clickedClass)){
    //     h1.classList.remove(clickedClass);
    //     //h1 태그에 clicked 의 이름을 가진 class가 있으면 class이름중 clicked를 삭제함 
        
    // }else{
    //     h1.classList.add(clickedClass);
    //     //따라서 맨 처음 class이름이 grab-font 면 add로 추가했을 경우 h1의 클래스리스트는 
    //     // grab-font 와 clicked 가 된다.     
    // }

    h1.classList.toggle("clicked");
    //h1의 classList에 clicked class가 있는지 먼저 확인하고 
    // 있으면 clicked을 제거하고 없으면 추가한다. 
}

h1.addEventListener("click", handleTitleClick);

