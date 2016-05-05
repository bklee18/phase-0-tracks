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
// horses.sadasd(colors[i],names[i]) bad pseudocode
console.log(horses);
//var horses = {};
