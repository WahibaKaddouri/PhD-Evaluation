/**
* Theme: Simple Admin Template
* Author: Coderthemes
* Google Maps
*/

var gmap;
var reserver =  function(e){
  swal({
      title: '<b>Reserver un véhicule</b>',
      html: /*'<h5>Selectionner un véhicule</h5>'+*/
      '<div classe="form-group"><label class="control-label col-sm-3" style=" margin-top:0.5em;" for="sel">Véhicule</label>'+
      '<div class="col-sm-9">'+
      '<select id="sel" class="form-control select2">'+
      '<option>Véhicule 1</option>'+
      '<option>Véhicule 2</option>'+
      '<option>Véhicule 3</option>'+
      '<option>Véhicule 4</option>'+
      '<option>Véhicule 5</option>'+
      '<option>Véhicule 6</option>'+
      '<option>Véhicule 7</option>'+
      '<option>Véhicule 8</option>'+
      '<option>Véhicule 9</option>'+
      '<option>Véhicule 10</option>'+
      '</select></div></div>'+
      '<br>'+
      '<br>'+
      '<div classe="form-group"><label class="control-label col-sm-3" style=" margin-top:0.5em;" for="sel1">Chauffeur</label>'+
      '<div class="col-sm-9">'+
      '<select id="sel1" class="form-control select2">'+
      '<option>Chauffeur 1</option>'+
      '<option>Chauffeur 2</option>'+
      '<option>Chauffeur 3</option>'+
      '<option>Chauffeur 4</option>'+
      '<option>Chauffeur 5</option>'+
      '<option>Chauffeur 6</option>'+
      '<option>Chauffeur 7</option>'+
      '<option>Chauffeur 8</option>'+
      '<option>Chauffeur 9</option>'+
      '<option>Chauffeur 10</option>'+
      '</select></div></div>'+
      '<br><br>',
      showCloseButton: true,
      showCancelButton: true,
      confirmButtonClass: 'btn btn-success',
      cancelButtonClass: 'btn btn-danger m-l-10',
      confirmButtonText: '<i class=" mdi mdi-check-circle"></i> Reserver',
      cancelButtonText: '<i class=" mdi mdi-close-circle"></i> Annuler'
  }).then(function () {
      swal(
          'Génial',
          'Un véhicule a été reservé',
          'success'
      )
  })
}

function addRDV(lat, lng, name){
  gmap.addMarker({
    lat: lat,
    lng: lng,
    title: name,
    icon:"../public/images/RDV.png",
    click: reserver
  });
}
function addSOS(lat, lng, name){
  gmap.addMarker({
    lat: lat,
    lng: lng,
    title: name,
    icon:"../public/images/SOS.png",
    click: reserver
  });
}

!function($) {
    "use strict";

    var GoogleMap = function() {};



    //creates map with markers
    GoogleMap.prototype.createMarkers = function($container) {
        gmap = new GMaps({
          div: $container,
          lat: 36.7596531,
          lng: 3.0665132,
          zoom: 11,
        });


        //sample markers, but you can pass actual marker data as function parameter
        addRDV(36.759531,3.062132,'Patient 1');
        addSOS(36.722335,3.126207,'Patient 2');
        addRDV(36.769531,3.066432,'Patient 3');
        addSOS(36.740235,3.056247,'Patient 4');
        addRDV(36.751451,3.066612,'Patient 5');
        addSOS(36.730435,3.156257,'Patient 6');
        addRDV(36.735631,3.096522,'Patient 7');
        addSOS(36.753365,3.956207,'Patient 8');
        addRDV(36.759631,2.952132,'Patient 1');
        addSOS(36.722335,2.922207,'Patient 2');
        addRDV(36.769531,2.926432,'Patient 3');
        addSOS(36.766235,2.996247,'Patient 4');
        addRDV(36.753551,2.967132,'Patient 5');
        addSOS(36.732935,2.969527,'Patient 6');
        addRDV(36.734431,2.976522,'Patient 7');
        addSOS(36.753465,2.974207,'Patient 8');

        setInterval(
          function(){
            if( Math.random()>=0.5){
              addSOS(36.699531+Math.floor((Math.random() * 100) - 50)/1000,
              2.996522+Math.floor((Math.random() * 100) - 50)/1000,
              'Patient '+Math.floor((Math.random() * 100) +1));
            }else{
              addRDV(36.699531+Math.floor((Math.random() * 100) - 50)/1000,
              2.996522+Math.floor((Math.random() * 100) - 50)/1000,
              'Patient '+Math.floor((Math.random() * 100) +1));
            }
          },5000);

        return gmap;
    },

    //creates map with overlay
    GoogleMap.prototype.createWithOverlay = function ($container) {
      gmap = new GMaps({
        div: $container,
        lat: 36.7596531,
        lng: 3.0665132,
        zoom: 11,
      });
      addRDV(36.759531,3.062132,'Patient 1');

      return map;
    },

    //creates map with street view
    GoogleMap.prototype.createWithStreetview = function ($container, $lat, $lng) {
      return GMaps.createPanorama({
        el: $container,
        lat : $lat,
        lng : $lng
      });
    },
    //Type
    GoogleMap.prototype.createMapByType = function ($container, $lat, $lng) {
      var map = new GMaps({
        div: $container,
        lat: $lat,
        lng: $lng,
        mapTypeControlOptions: {
          mapTypeIds : ["hybrid", "roadmap", "satellite", "terrain", "osm", "cloudmade"]
        }
      });
      map.addMapType("osm", {
        getTileUrl: function(coord, zoom) {
          return "http://tile.openstreetmap.org/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "OpenStreetMap",
        maxZoom: 18
      });
      map.addMapType("cloudmade", {
        getTileUrl: function(coord, zoom) {
          return "http://b.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/1/256/" + zoom + "/" + coord.x + "/" + coord.y + ".png";
        },
        tileSize: new google.maps.Size(256, 256),
        name: "CloudMade",
        maxZoom: 18
      });
      map.setMapTypeId("osm");
      return map;
    },
    GoogleMap.prototype.createWithMenu = function ($container, $lat, $lng) {
      var map = new GMaps({
        div: $container,
        lat: $lat,
        lng: $lng
      });
      map.setContextMenu({
        control: 'map',
        options: [{
          title: 'Add marker',
          name: 'add_marker',
          action: function(e){
            this.addMarker({
              lat: e.latLng.lat(),
              lng: e.latLng.lng(),
              title: 'New marker'
            });
            this.hideContextMenu();
          }
        }, {
          title: 'Center here',
          name: 'center_here',
          action: function(e){
            this.setCenter(e.latLng.lat(), e.latLng.lng());
          }
        }]
      });
    },
    //init
    GoogleMap.prototype.init = function() {
      var $this = this;
      $(document).ready(function(){
        //with sample markers
        $this.createMarkers('#gmaps-markers');

        //overlay
        $this.createWithOverlay('#gmaps-overlay');

        //street view
        $this.createWithStreetview('#panorama',  42.3455, -71.0983);

        //types
        $this.createMapByType('#gmaps-types', -12.043333, -77.028333);

      });
    },
    //init
    $.GoogleMap = new GoogleMap, $.GoogleMap.Constructor = GoogleMap
}(window.jQuery),

//initializing
function($) {
    "use strict";
    $.GoogleMap.init()
}(window.jQuery);
