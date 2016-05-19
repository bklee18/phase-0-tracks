$(document).ready(function() {
  $("a").click(function() {
    alert("You clicked the link!");
  });
  
  $("h1").click(function() {
    $(this).css('border', "solid 2px red");  
  });

  $('#landscape').click(function() {
    $(this).hide();
  });
});