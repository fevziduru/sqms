<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Map.ascx.cs" Inherits="SQMS.Application.Views.Components.Map" %>

<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"
    type="text/javascript"></script>

<script src="../../Resources/Scripts/Controls/GoogleMap/Wrapper.js" type="text/javascript"></script>

<div id="map_canvas" style="width: 1000px; height: 600px">
</div>

<script type="text/javascript">
    var qps = [{ name: "海尔路主干道监控点1", id: "A0001", lat: 39.9493, lng: 116.3975 },
               { name: "海尔路主干道监控点2", id: "A0002", lat: 39.8493, lng: 116.3975 }];
    var markers = [];

    function initMap() {
        var map = new GMap2(document.getElementById("map_canvas"));
        map.addControl(new GLargeMapControl());
        map.addControl(new GMapTypeControl());
        map.enableDoubleClickZoom();
        map.enableScrollWheelZoom();
        map.setCenter(new GLatLng(39.9493, 116.3975), 14);
        //map.openInfoWindow(map.getCenter(),document.createTextNode("Hello, world"));
        for (var i = 0; i < qps.length; i++) {
            var wgMarker = WGMarkerFactory.createWGMarker(qps[i], map);
            markers[i] = wgMarker;
        }
    }
    Sys.Application.add_load(initMap);
    Sys.Application.add_unload(GUnload);
</script>

