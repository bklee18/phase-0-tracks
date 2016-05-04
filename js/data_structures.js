// Release 0
var colors = ["Blue", "Green", "Pink", "Red"];
var names = ["Ed", "Benny", "Skrillex", "Touche"];

colors.push("White");
names.push("Mr Black");

// Release 1
// Lets make a single entry object hash first
// var name = names[0];
// var color = colors[0];
// var hash = {};
// hash[name] = color;
// console.log(hash);

// Now let's loop
var hash = {};
for ( var i = 0; i < names.length; i++ ) {
  hash[names[i]] = colors[i];
}

console.log(hash);
