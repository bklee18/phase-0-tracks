// Release 4 Pseudocode
// Write a function that would take a string, and decrementing from its length to zero, add each letter into a new var. Return that var.

function reverse(string) {
  var rstring = "";
  for (var i = string.length-1; i > -1; i--) {
    rstring = rstring + string[i];
  }
  return rstring;
}


// DRIVER CODE *****
// console.log(reverse("Hello"));
var brian_reverse = reverse("brian");

if (5 > 0) {
  console.log(brian_reverse);
}
