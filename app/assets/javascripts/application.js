// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require leaflet

$(function(){ $(document).foundation(); });
var map = L.map('map').setView([51.505, -0.09], 13);
L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map);
map.panTo(new L.LatLng(52.2348, 21.0076));
map.setZoom(11);

put_marks = function(){
  $('.admin_event').each(function(){
    var link = $(this);
    var url = $(this).attr("href");
    var json_url = url + '.json';
    $.getJSON(json_url, function(data) {
      var marker = L.marker([data.lat, data.long]).addTo(map);
      marker.bindPopup("<a href=\"" + data.url + "\" target=\"_blank\" >" + data.name + "<\a>");
      link.attr("href", "");
      link.click(function(){
        map.panTo(new L.LatLng(data.lat, data.long));
      });
    });        
  });
};

put_marks();
