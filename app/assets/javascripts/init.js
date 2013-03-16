$(document).ready(function(){
  $('.blurme').blurjs({
    source: '.behind-bg',
    radius: 50
  }); //end blur.js
 
  run_masonry();
}); 




function run_masonry() {
  var $container = $('.mason-holder');
  $container.imagesLoaded(function(){
    $container.masonry({
    itemSelector: '.mason',
    // isFitWidth: true,
    // isResizable: true,
    // columnWidth: 220
    });
  }); // end masonry
};


function addInfoBubble(index, name, city, street, nostreet, place_url, postcode) {
  window['contentString'+index] = "<a href='"+place_url+"'>"+name+"</a><br>";
  window['contentString'+index] += street+" "+nostreet+"<br>"
  window['contentString'+index] += postcode+" "+city

  window['infowindow'+index] = new google.maps.InfoWindow({ content: window['contentString'+index] });
  infoBubbles.push(window['infowindow'+index]);
  google.maps.event.addListener(window['styleMarker'+index], 'click', function() {
    for (var i = 0; i < infoBubbles.length; i++) {
      infoBubbles[i].close();
    }
    window['infowindow'+index].open(map,window['styleMarker'+index]);
  });
};

function addStyledMarker(latitude, longitude, index, name, indicator, color) {
  window['pointCoords'+index] = new google.maps.LatLng(latitude,longitude);
  window['styleMarker'+index] = new StyledMarker({
    styleIcon: new StyledIcon(
      StyledIconTypes.MARKER,{
        color: color,
        text: indicator,
        fore: 'FFFFFF'
      }
    ),
    position: window['pointCoords'+index],
    map:map,
    title: name
  });
  markersArray.push(window['styleMarker'+index]);
  coordsArray.push(window['pointCoords'+index]);
};

function clearOverlays() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
  }
};