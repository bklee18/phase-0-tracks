console.log("The script is running!");

// function addPinkBorder(event) {
//   console.log("click happened! here's the click event:");
//   console.log(event);
//   event.target.style.border = "2px solid pink";
// }

// var photo = document.getElementById("lizard-photo");
// photo.addEventListener("click", addPinkBorder);

// var photo = document.getElementById("lizard-photo");
// var hideButton = document.getElementById("hidebutton");

// console.log(hideButton);

// function hidePhoto(event) {
//   console.log("hide happened");
//   console.log(event);
//   event.target.style.visibility = "hidden";
// }

// photo.addEventListener("click", hidePhoto);
// hideButton.addEventListener("click", hidePhoto);

// Add new element
var newHeading = document.createElement('h1');
var h1Text = document.createTextNode("new text node!");
newHeading.appendChild(h1Text);

var button = document.getElementById("hidebutton");
var parent = button.parentNode;
parent.insertBefore(newHeading, button);


// For loop
var listItems = document.getElementsByClassName('list');

for (var i=0; i<listItems.length; i++) {
  listItems[i].style.border = "2px solid blue";
}