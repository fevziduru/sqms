﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Map.ascx.cs" Inherits="SQMS.Application.Views.Components.Map" %>

<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"
    type="text/javascript"></script>

<script src="../../Resources/Scripts/Controls/GoogleMap/Wrapper.js" type="text/javascript"></script>

<div id="map_canvas" style="width: 1000px; height: 600px">
</div>
<div>
    <span>经纬度:</span>
    <span id="spanLatLng" style="width:300px;"></span>
    <span>缩放级别:</span>
    <span id="spanZoomLevel"></span>
    <span>请求次数:</span>、
    <span id="spanRequestNum"></span>
    
</div>

<script type="text/javascript">
    var markers = {};
    var map = null;
    var requestNum = 0;
    function initMap() {
        if (!map) {
            map = new GMap2(document.getElementById("map_canvas"));
            GEvent.addListener(map, "load", fetchMarkers);
            GEvent.addListener(map, "moveend", fetchMarkers);
            GEvent.addListener(map, "zoomend", showZoomLevel);
            GEvent.addListener(map, "mouseover", showMouseLatLng);
            GEvent.addListener(map, "mousemove", showMouseLatLng);
            
            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());
            map.enableDoubleClickZoom();
            map.enableScrollWheelZoom();
            map.setCenter(new GLatLng(39.9493, 116.3975), 14);
            
            showZoomLevel(0, map.getZoom());
        }
    }
    function setToMarker(mpId, mpName, lat, lng,openInfoWindow,setCenter) {
        if (!markers[mpId]) {
            createMarker(mpId, mpName, lat, lng);
        }
        else {
            if (setCenter == true) {
                map.setCenter(markers[mpId].gMarker.getLatLng(), map.getZoom());
            }
            if (openInfoWindow) {
                map.openInfoWindowHtml(markers[mpId].gMarker.getLatLng(), markers[mpId].getInfoHtml());
            }
        }
    }
    function createMarker(mpId, mpName, lat, lng) {
        if (markers[mpId]) {
            return;
        }
        else {
            var marker = WGMarkerFactory.createWGMarker(mpId, mpName, lat, lng, map);
            markers[mpId] = marker;
        }
        setToMarker(mpId);
    }

    function fetchMarkers() {
        var bound = map.getBounds();
        var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?swlat=" + bound.getSouthWest().lat()
            + "&swlng=" + bound.getSouthWest().lng()
            + "&nelat=" + bound.getNorthEast().lat()
            + "&nelng=" + bound.getNorthEast().lng();
        wRequest = new Sys.Net.WebRequest();
        Sys.Net.WebRequestManager.add_completedRequest(initMarker);
        wRequest.set_url(url);
        Sys.Net.WebRequestManager.executeRequest(wRequest);
        showRequestNum(requestNum++);
    }

    function initMarker(executor, eventArgs) {
        if (executor.get_responseAvailable()) {
            if (executor.get_statusCode() == "200") {
                var body = executor.get_responseData();
                var mps = [];
                try{
                    mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
                }
                catch(e){};
                if (mps) {
                    for (var i = 0; i < mps.length; i++) {
                        setToMarker(mps[i].MonitorPointId,mps[i].MonitorPointName,mps[i].Lat,mps[i].Lng,false,false);
                    }
                }
            }

        }
    }

    function showMouseLatLng(latlng) {
        document.getElementById("spanLatLng").innerHTML = latlng.lat() + ", " + latlng.lng();
    }

    function showZoomLevel(oldLevel, newLevel) {
        document.getElementById("spanZoomLevel").innerHTML = newLevel;
    }

    function showRequestNum(num) {
        document.getElementById("spanRequestNum").innerHTML = num;
    }
    Sys.Application.add_load(initMap);
    Sys.Application.add_unload(GUnload);
</script>
