$(document).ready(function(){
  startTime();
});

function startTime() {
  var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
  var today = new Date();
  var month = monthNames[today.getMonth()]
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('date').innerHTML =
  month + " " + today.getDate() + " " + today.getFullYear();
  document.getElementById('clock').innerHTML =
  h + ":" + m + ":" + s;
  var t = setTimeout(startTime, 1000);
}

function checkTime(i) {
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}


// When the user scrolls down 400px from the top of the document, show the button
window.onscroll = function() {
  scrollFunction()
};

function scrollFunction() {
  if (document.body.scrollTop > 400 || document.documentElement.scrollTop > 400) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}


$( function() {
  $( "#datepicker" ).datepicker({ minDate: "-30Y", maxDate: "-1D" });
});
//Get yesterday's date.
$( function() {
  $( ".yesterday-daypicker" ).datepicker({ minDate: "-30Y", maxDate: "-1D" });
  // .datepicker().datepicker("setDate", "-1D");

});

// Confirm delete user profile. 
function ConfirmDelete(){
  var x = confirm("Are you sure you want to delete?");
  if (x)
    return true;
  else
    return false;
}





