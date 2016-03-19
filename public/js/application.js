$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

var map;
function initMap() {
  var request = $.ajax({
    url: '/locations',
    type: 'GET',
    datatype: 'json'
  });

  request.done(function(response){
    var latitude = response;
    data = JSON.parse(response);
    coords = [];

    data.forEach(function(set){
      coords.push([set.latitude, set.longitude]);
    });

    var infowindow = new google.maps.InfoWindow();
    var marker;

    for (i = 0; i < coords.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(coords[i][0], coords[i][1]),
        map: map
      });
    }

  });

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.144, lng: -39.967},
    zoom: 1
  });
}
