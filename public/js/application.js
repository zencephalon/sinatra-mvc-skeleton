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

