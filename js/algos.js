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
// Take the first hash and iterate through each of the keys. In a second iteration, test to see if the first hash key == the second hash keys. If there is no match, then no matching key-value pairs.
// If there is a match, then test to see if the values are also equal. If true, then return true.

function matching_key_value_pair(hash1, hash2) {
  for ( var a in hash1 ) {
    for ( var b in hash2) {
      if (a == b) {
        if (hash1[a] == hash2[b]) {
          return true;
        }
      }
    }
  }
  return false;
}



// DRIVER CODE
// Release 0
// var array = ["long phrase", "longest phrase", "longer phrase"];
// console.log(longest_phrase(array));
// var array = ["", "  ", "123", "abcdef"];
// console.log(longest_phrase(array));

// Release 1
// var hash = { name: 'Brian', age: 27, job: 'student' };
// var hash1 = {name: 'Al', age: 27 };
// var hash3 = { name: 'Ed', age: 500, city: 'NYC', human: true };
// console.log(matching_key_value_pair(hash,hash1));
// console.log(matching_key_value_pair(hash, hash3));

// Release 2
var int = nextInt();
console.log(int);