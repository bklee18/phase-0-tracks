// Release 0
// Goal: Find and return the longest phrase in an array of phrases.
// Start with a user given array of phrases. Phrases can be single words too.
// Since we can use .LENGTH on a phrase, we can use that to compare lengths across different phrases.
// I'll loop through the array, and compare the length of each to a running variable that will start with a value of -1. I will also start another variable to store the index value.
// The first indexed phrase length will replace the -1 in the running variable, and its index will be stored in the index variable.
// When the loop goes to the second indexed phrase, I will compare that length with the running variable. If it's larger, it will replace the running variable's original value and the index variable will also be updated.. If not, then no assignement will happen.
// Continue this process for the rest of the array.

function longest_phrase(array)  {
  var running_length = -1;
  var index = 0;
  for ( var i = 0; i < array.length; i++ ) {
    if (array[i].length > running_length) {
      running_length = array[i].length;
      index = i
    }
  }
  return array[index];
}


// Release 1
// Goal: A function that takes two objects and checks to see if they share at least one key-value pair
// Start with 2 hashes.



// DRIVER CODE
// var array = ["long phrase", "longest phrase", "longer phrase"];
// console.log(longest_phrase(array));

// var array = ["", "  ", "123", "abcdef"];
// console.log(longest_phrase(array));

