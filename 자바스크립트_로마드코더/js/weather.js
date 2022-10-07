const API_KEY = "65edb99bd6437f22e3685ddd5149b002";


function onGeoOk(position){//사용자의 위도와 경도 정보를 가져올 수 있다. 
    const lat = position.coords.latitude;
    const lng = position.coords.longitude;
    console.log(lat, lng);
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${API_KEY}&units=metric`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        const weather = document.querySelector("#weather span:first-child");
        const city = document.querySelector("#weather span:last-child");

        city.innerText = ` city : ${data.name}`;
        weather.innerText = `weather : ${data.weather[0].main} / temp : ${data.main.temp} `;
      });
        
}

function onGeoError(){
    alert("Can't find you. No Weather for you.")
}

navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
