


// // 1. �ڹٽ�ũ��Ʈ�� element �������� 
// const h1 = document.getElementById("h1");
// console.dir(h1);
// h1.innerHTML = "hi";






// // 2. �ڹٽ�ũ��Ʈ�� �̺�Ʈ �߰� 
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

// window.addEventListener("resize", handleWindowResize);//window�� ȭ��ũ�Ⱑ ���ϸ� ���� 
// window.addEventListener("copy", handlerWidowCopy);//ī��������� ��µ� 
// window.addEventListener("offline", handlerWindowOffline);//�������� ������ ��� 
// window.addEventListener("online", handlerWindowOnline);// �������� ������� ���








// 3. �̺�Ʈ �����ʿ� css ���� 
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








// 4. ClassList�̿��ؼ� class ��� 
const h1 = document.querySelector("div.hello:first-child h1");

function handleTitleClick(){
    // const clickedClass = "clicked";

    // if(h1.classList.contains(clickedClass)){
    //     h1.classList.remove(clickedClass);
    //     //h1 �±׿� clicked �� �̸��� ���� class�� ������ class�̸��� clicked�� ������ 
        
    // }else{
    //     h1.classList.add(clickedClass);
    //     //���� �� ó�� class�̸��� grab-font �� add�� �߰����� ��� h1�� Ŭ��������Ʈ�� 
    //     // grab-font �� clicked �� �ȴ�.     
    // }

    h1.classList.toggle("clicked");
    //h1�� classList�� clicked class�� �ִ��� ���� Ȯ���ϰ� 
    // ������ clicked�� �����ϰ� ������ �߰��Ѵ�. 
}

h1.addEventListener("click", handleTitleClick);

