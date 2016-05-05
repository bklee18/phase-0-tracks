// Release 0

var colors = ["blue", "green", "red", "yellow"];
var names = ["Ed", "Bob", "Jim", "Lucy"];

colors.push("magenta");
names.push("Jim");

console.log(colors);
console.log(names);

// Release 1
var horses = {}
if (colors.length == names.length) {
  for (var i = 0; i < colors.length; i++ ) {
    horses[names[i]] = colors[i];
  }
}
//var horses = {};
// horses.sadasd(colors[i],names[i]) bad pseudocode
console.log(horses);

// Release 2
function Car (make, year, color) {
  this.make = make;
  this.year = year;
  this.color = color;
  this.goodReview = true
  // skipping a line for clarity
  this.drive = function() {console.log("Driving!");};
}

var toyota = new Car("Toyota", 1998, "Midnight Blue");
console.log(toyota);
toyota.drive();