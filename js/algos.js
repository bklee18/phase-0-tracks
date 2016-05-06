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


// Release 2
// Goal: Write a function that takes an int and returns an array of strings of the given length int. The strings should be of varying length from 1 letter to 10 letters.
// My first step is to define a function called random_int that will produce a random integer between its min and max parameters. (I had originally made this function a subfunction of my random_string_array, but I needed access to it for lines 110-115, so I made it a seperate, stand-alone function.)
// I'll write a function that will take an int. Then I'll initialize a new array, and iterate that array int number of times by calling on a subfunction that will return a random string.
// The random string function will have a random length provided by my random_int function, this function will also provide a random number that will correspond with an alphabet string to get a random letter.


function random_int(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
}

function random_string_array(length) {
  
  this.random_word = function() {
    var alphabet = "abcdefghijklmnopqrstuvwxyz";
    var str_length = random_int(1,10);
    var string = "";
    for ( i = 0; i < str_length; i++) {
      string = string + alphabet[random_int(0,25)];
    }
    return string;
  }
  
  var str_array = [];

  for (var count = 0; count < length; count++ ) {
    var word = this.random_word();
    str_array.push(word);
  }

  return str_array;
}



// DRIVER CODE

// Release 0 ******************************************
// var array = ["long phrase", "longest phrase", "longer phrase"];
// console.log(longest_phrase(array));
// var array = ["", "  ", "123", "abcdef"];
// console.log(longest_phrase(array));


// Release 1 ******************************************
// var hash = { name: 'Brian', age: 27, job: 'student' };
// var hash1 = {name: 'Al', age: 27 };
// var hash3 = { name: 'Ed', age: 500, city: 'NYC', human: true };
// console.log(matching_key_value_pair(hash,hash1));
// console.log(matching_key_value_pair(hash, hash3));


// Release 2  ******************************************
// var array = random_string_array(3);
// console.log(array);

// Goal: Generate an array, prints the array, then calls the longest_phrase function on that array. Do x10
// Seems since I need to do it 10 times, a for loop would be useful. I'll loop this 10 times, and do each of the directions (generate an array, print it, call the longest_phrase on it, repeat)
// For the array length, I'll do a fixed number the first time, then below it, I'll use a random number between 2 and 8.

for ( var instances = 0; instances < 10; instances++ ) {
  var array = random_string_array(5);
  console.log((instances + 1) + ". Random generated word array: " + array);
  console.log("The longest phrase from the above array is: " + longest_phrase(array) + '\n');
}

// For a random, varied array length (I chose between 2 - 8 on line 111):

for ( var instances = 0; instances < 10; instances++ ) {
  var random_length = random_int(2,8);
  var array = random_string_array(random_length);
  console.log((instances + 1) + ". Random generated word array: " + array);
  console.log("The longest phrase from the above array is: " + longest_phrase(array) + '\n');
}