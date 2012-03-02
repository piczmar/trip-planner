<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBuNdfo_qt85nGwr5IrgQTGXAbwP9uN84w&sensor=false">
    </script>
    <script type="text/javascript">
      function initialize() {
        var myOptions = {
          center: new google.maps.LatLng(39.833333, -98.583333),
          zoom: 4,
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          mapTypeControl: true,
          mapTypeControlOptions: {
        	     mapTypeIds: [google.maps.MapTypeId.HYBRID, 
        	         	     google.maps.MapTypeId.ROADMAP, 
        	         	     google.maps.MapTypeId.SATELLITE, 
        	         	     google.maps.MapTypeId.TERRAIN]
        	  },
        	  style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
        };
        var map = new google.maps.Map(document.getElementById("map"),
            myOptions);


        <g:each in="${airportList}" status="i" var="airport">
        	var point${airport.id} = new google.maps.LatLng(${airport.lat}, ${airport.lng});
        	var marker${airport.id} = new google.maps.Marker({
        			 position: point${airport.id},
        			 map: map,
        			 title: "${airport.name}"
        	});
        	var infowindow${airport.id} = new google.maps.InfoWindow({
        		     content: "${airport.iata}<br/>${airport.name}",
        		     disableAutoPan:true
        		});
        	google.maps.event.addListener(marker${airport.id}, 'click', function() {
        			 infowindow${airport.id}.open(map,marker${airport.id});
        	});
     	</g:each>
      }
    </script>
  </head>
  <body onload="initialize()">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
    	<div id="map" style="width: 800px; height: 400px"></div>
  </body>
</html>