
if(navigator.geolocation){
  navigator.geolocation.getCurrentPosition(function(objPosition){
    var lon = objPosition.coords.longitude;
    var lat = objPosition.coords.latitude;

    var dirOrigen = "";
    var latlng = new google.maps.LatLng(lat, lon);
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({"latLng": latlng}, function(results, status){
      if(status == google.maps.GeocoderStatus.OK){
        if(results[0]){
          dirOrigen += results[0].formatted_address;
          // ************************************************************* //
          // Instanciamos DS API Google
          var directionsService = new google.maps.DirectionsService;

          // Creación Centrando Mapa Tienda
          var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 13,
            center: {lat: 39.4548, lng: -0.395748}
          });

          var directionsDisplay = new google.maps.DirectionsRenderer({map: map});

          // Recuperamos desde la BBDD la dirección de la tienda
          var jsonTienda = (function () {
            var jsonTienda = null;
            $.ajax({
                'async': false,
                'global': false,
                'url': './Servidor/stores.php',
                'dataType': "json",
                'success': function (data) {
                    jsonTienda = data;
                }
            });
            return jsonTienda;
          })();

        var dirTienda = jsonTienda.stores[0].address;

          // Ruta
          directionsService.route({
            origin: dirOrigen,
            destination: dirTienda,
            travelMode: google.maps.TravelMode.DRIVING
          }, function(response, status) {
            if (status === google.maps.DirectionsStatus.OK) {

              // Duración del recorrido

              var route = response.routes[0];
              console.log(response.routes[0]);
              var distancia = "";
              var duration = 0;

              route.legs.forEach(function (leg) {
              	// The leg duration in seconds.
              	duration += leg.duration.text;
                distancia += leg.distance.text;
              });

              directionsDisplay.setDirections(response);
              document.getElementById('duration').innerHTML = duration;
              document.getElementById('distancia').textContent = distancia;
            } else {
              window.alert('Directions request failed due to ' + status);
            }
          });
          // ************************************************************* //
        }
      }else{
        document.getElementById("error").innerHTML = "Error al iniciar la geolocalización.";
      }
    });
  }, function(objPositionError)
  {
    switch (objPositionError.code)
    {
      case objPositionError.PERMISSION_DENIED:
        document.getElementById("error").innerHTML = "No se ha permitido el acceso a la posición del usuario.";
      break;
      case objPositionError.POSITION_UNAVAILABLE:
        document.getElementById("error").innerHTML = "No se ha podido acceder a la información de su posición.";
      break;
      case objPositionError.TIMEOUT:
        document.getElementById("error").innerHTML = "El servicio ha tardado demasiado tiempo en responder.";
      break;
      default:
        document.getElementById("error").innerHTML = "Error desconocido.";
    }
  }, {
    maximumAge: 75000,
    timeout: 15000
  });
}else{
  document.getElementById("error").innerHTML = "Su navegador no soporta la API de geolocalización.";
}
