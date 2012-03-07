<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
}
</style>
<g:javascript library="prototype" />
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBuNdfo_qt85nGwr5IrgQTGXAbwP9uN84w&sensor=false">
</script>
<script type="text/javascript">
	  var map
      function initialize() {
        var myOptions = {
          center: new google.maps.LatLng(39.833333, -98.583333),
          zoom: 4,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
      }
      var airportMarkers = []
      var line
      function addAirport(response, position) {     
        var airport = eval('(' + response.responseText + ')')
        var label = airport.iata + " -- " + airport.name
        
        if(airportMarkers[position] != null){
          airportMarkers[position].setMap(null);
        }
        if(airport.name != "Not found"){
        	var marker = new google.maps.Marker({
    			 position: new google.maps.LatLng(airport.lat, airport.lng),
    			 map: map,
    			 title: label
    		});
           airportMarkers[position] = marker;
           airportMarkers[position].setMap(map);         
        }
        document.getElementById("airport_" + position).innerHTML = airport.name
        drawLine();
        showHotelsLink();
      }
      function drawLine(){
        if(line != null){
          line.setMap(null);
        }
        
        if(airportMarkers.length == 2){
          var line = new google.maps.Polyline({
        	    path: [airportMarkers[0].getPosition(), airportMarkers[1].getPosition()],
        	    strokeColor: "#FF0000",
        	    strokeOpacity: 1.0,
        	    strokeWeight: 2
        	});
          line.setMap(map);
        }
      }   
      
      function showHotelsLink(){
    	  if(airportMarkers[1] != null){
    	    var hotels_link = document.getElementById("hotels_link")
    	    hotels_link.innerHTML = "<a href='#' onClick='loadHotels()'>Show Nearby Hotels...</a>"
    	  }
    	}
    	      
      function loadHotels(){
    	  var url = "${createLink(controller:'hotelStay', action:'near')}"
    	  
    	  new Ajax.Request(url,{
    	    onSuccess: function(res) { showHotels(res) },
    	    onFailure: function(res) { displayError(res) }
    	  })
      }    

      function displayError(response){
        var html = "response.status=" + response.status + "<br />"
        html += "response.responseText=" + response.responseText + "<br />"
        var hotels = document.getElementById("hotels_panel")
        hotels.innerHTML = html
      }
      function showHotels(response){
    	  var results = eval( '(' + response.responseText + ')')
    	  var resultCount = 1 * results.ResultSet.totalResultsReturned
    	  var html = "<ul>"
    	  for(var i=0; i < resultCount; i++){
    	    html += "<li>" + results.ResultSet.Result[i].Title + "<br />"
    	    html += "Distance: " + results.ResultSet.Result[i].Distance + " m <br />"
    	    html += "<hr />"
    	    html += "</li>"
    	  }
    	  html += "</ul>"
    	  var hotels = document.getElementById("hotels_panel")
    	  hotels.innerHTML = html
     }
</script>
</head>
<body onload="initialize()">
	<div id="search" style="width: 25%; float: left">
		<h1>Where to?</h1>
		<g:formRemote name="from_form"
			url="[controller:'airportMapping', action:'iata']"
			onSuccess="addAirport(e, 0)">
 			 From:<br />
			<input type="text" name="id" size="3" />
			<input type="submit" value="Search" />
		</g:formRemote>
		<div id="airport_0"></div>
		<g:formRemote name="to_form"
			url="[controller:'airportMapping', action:'iata']"
			onSuccess="addAirport(e, 1)">
  			To: <br />
			<input type="text" name="id" size="3" />
			<input type="submit" value="Search" />
		</g:formRemote>
		<div id="airport_1"></div>
		<div id="hotels_link"></div>
		<div id="hotels_panel"></div>
	</div>
	<div id="map_canvas" style="width: 75%; height: 100%; float: right"></div>
</body>
</html>