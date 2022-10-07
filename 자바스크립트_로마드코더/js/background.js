const images = [
    "noble.jpg",
    "banis.jpg",
    "mountain.jpg"
];

const choseImage = images[Math.floor(Math.random() * images.length)];

const bgImage = document.createElement("img");
bgImage.src = `img/${choseImage}`;

console.log(bgImage);

document.body.appendChild(bgImage);
