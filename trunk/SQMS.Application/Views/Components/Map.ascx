<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Map.ascx.cs" Inherits="SQMS.Application.Views.Components.Map" %>

<script type="text/javascript" src="../../Resources/Scripts/Common/cookie.js"></script>

<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"
    type="text/javascript"></script>

<script src="../../Resources/Scripts/Controls/GoogleMap/MarkerManager.js" type="text/javascript"></script>

<script src="../../Resources/Scripts/Controls/GoogleMap/Wrapper.js" type="text/javascript"></script>

<%--<script src="../../Resources/Scripts/Controls/GoogleMap/VideoPlayer/AC_OETags.js"
    language="javascript" type="text/javascript"></script>--%>

<!-- Sam Skin CSS -->
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/container/assets/skins/sam/container.css" />
<!-- Dependencies -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<!-- OPTIONAL: Animation (only required if using ContainerEffect) -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/animation/animation-min.js"></script>

<!-- OPTIONAL: Drag & Drop (only required if enabling Drag & Drop) -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/dragdrop/dragdrop-min.js"></script>

<!-- Source file -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/container/container-min.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
    // -----------------------------------------------------------------------------
    // Globals
    // Major version of Flash required
    var requiredMajorVersion = 9;
    // Minor version of Flash required
    var requiredMinorVersion = 0;
    // Minor version of Flash required
    var requiredRevision = 124;
    // -----------------------------------------------------------------------------
// -->
</script>

<div>
    <div class="yui-skin-sam">
        <div id="videoPanel">
            <div class="hd">
            </div>
            <div class="bd">
                <div id="divVideo">
                </div>
            </div>
        </div>
    </div>
</div>
<div id="map_canvas" style="height: 600px">
</div>
<div>
    <span>经纬度:</span> <span id="spanLatLng" style="width: 300px;"></span><span>缩放级别:</span>
    <span id="spanZoomLevel"></span>&nbsp;&nbsp;<span>请求次数:</span><span id="spanRequestNum">
    </span>
</div>
<div id="divLog" style="overflow:auto;height:150px;">Logger inited.<br /></div>

<script type="text/javascript">
    var markers = new Object();
    var map = null;
    var requestNum = 0;
    var poly;
    var polyPoints = new Array();
    var videoPanel = null;
    var flashPlayerCreated = false;
    
    function log(msg) {
        document.getElementById("divLog").innerHTML += msg + "<br />";
    }
    function unload() {
        GUnload();
    }
    function initMap() {
        if (GBrowserIsCompatible()) {
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

                var lastLatLngCookie = new Cookie("lastlatlng");
                var lastLat = 29.5548;
                var lastLng = 106.5483;
                if (lastLatLngCookie.lat) {
                    lastLat = lastLatLngCookie.lat;
                }
                if (lastLatLngCookie.lng) {
                    lastLng = lastLatLngCookie.lng;
                }
                map.setCenter(new GLatLng(lastLat, lastLng), 14);
                showZoomLevel(0, map.getZoom());

                WGMarkerFactory.gmap = map;
                WGMarkerFactory.markerManager = new MarkerManager(WGMarkerFactory.gmap);
            }
        }
    }
    function setToMarker(mpId, mpName, lat, lng, lv, openInfoWindow, setCenter) {
        var m;
        if (!markers[mpId]) {
            m = createMarker(mpId, mpName, lat, lng, lv);
            WGMarkerFactory.getMarkerManager().addMarkers([m.gMarker], m.level, WGMarkerFactory.MAX_ZOOM_LEVEL);
            WGMarkerFactory.getMarkerManager().refresh();
        }
        else {
            m = markers[mpId];
        }

        if (setCenter == true) {
            map.setCenter(m.gMarker.getLatLng(), m.level);
        }
        if (openInfoWindow) {
            window.setTimeout(function() { openMarkerInfoWindow(m); });
        }
        var lastLatLngCookie = new Cookie("lastlatlng");
        lastLatLngCookie.lat = lat;
        lastLatLngCookie.lng = lng;
        lastLatLngCookie.store(365);
    }
    function openMarkerInfoWindow(m) {
        m.openInfoWindowHtmlTab();
    }
    function createMarker(mpId, mpName, lat, lng, lv) {
        var marker = null;
        if (markers[mpId]) {
            return markers[mpId];
        }
        else {
            marker = WGMarkerFactory.createWGMarker(mpId, mpName, lat, lng, lv);
            markers[mpId] = marker;
        }
        return marker;
    }

    function fetchMarkers() {
        var bound = map.getBounds();
        var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&swlat=" + bound.getSouthWest().lat()
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
                try {
                    mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
                }
                catch (e) { };
                if (mps) {
                    var length = mps.length;
                    var lvMarkers = new Array();
                    for (var i = 0; i < length; i++) {
                        if (!markers[mps[i].MonitorPointId]) {
                            if (!lvMarkers[i]) {
                                lvMarkers[i] = { level: 14, markers: [] };
                            }
                            var m = createMarker(mps[i].MonitorPointId, mps[i].MonitorPointName, mps[i].Lat, mps[i].Lng, mps[i].Level);
                            lvMarkers[i].markers.push(m.gMarker);
                            lvMarkers[i].level = m.level;
                        }
                    }
                    var foundNewMarker = false;
                    for (var i = 0; i < lvMarkers.length; i++) {
                        if (lvMarkers[i] && lvMarkers[i].markers) {
                            WGMarkerFactory.getMarkerManager().addMarkers(lvMarkers[i].markers, lvMarkers[i].level, WGMarkerFactory.MAX_ZOOM_LEVEL);
                            foundNewMarker = true;
                        }
                    }
                    if (true == foundNewMarker) {
                        WGMarkerFactory.getMarkerManager().refresh();
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
    Sys.Application.add_unload(unload);

    function playVideo() {
        polyPoints.length = 0;
        if (poly) {
            map.removeOverlay(poly);
        }
        log("video started");
    }
    function stopVideo() {
        log("video stoped");
    }
    function pauseVideo() {
        log("video paused");
    }
    function videoPlayerPlayheadUpdate(lat, lng) {
        if (poly) {
            map.removeOverlay(poly);
        }
        polyPoints.push(new GLatLng(lat, lng));
        poly = new GPolyline(polyPoints, "#0000af", 3, 0.6);
        //var length = poly.getLength() / 100;
        //var unit = " 米";
        map.addOverlay(poly);
    }
    function openVideo(videoId, videoName) {
        if (!videoPanel) {
            //The second argument passed to the
            //constructor is a configuration object:
            videoPanel = new YAHOO.widget.Panel("videoPanel", {
                width: "320px",
                fixedcenter: false,
                constraintoviewport: true,
                underlay: "shadow",
                close: true,
                visible: false,
                draggable: true
            });
            //If we haven't built our panel using existing markup,
            //we can set its content via script:
            videoPanel.setHeader(videoName);
            //Although we configured many properties in the
            //constructor, we can configure more properties or 
            //change existing ones after our Panel has been
            //instantiated:
            videoPanel.cfg.setProperty("underlay", "matte");
            videoPanel.showEvent.subscribe(function() {
                if (!flashPlayerCreated) {
                    var divVideo = document.getElementById("divVideo");
                    divVideo.innerHTML = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='MapVideo' width='320' "
                        + "height='280' codebase='http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab'>"
                        + "<param name='movie' value='../../Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf' />"
                        + "<param name='quality' value='high' />"
                        + "<param name='bgcolor' value='#869ca7' />"
                        + "<param name='allowScriptAccess' value='sameDomain' />"
                        + "<embed src='../../Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf' "
                            + "quality='high' bgcolor='#869ca7' width='320' height='280' name='MapVideo' align='middle' "
                            + "play='true' loop='false' quality='high' allowscriptaccess='sameDomain' type='application/x-shockwave-flash' "
                            + "pluginspage='http://www.adobe.com/go/getflashplayer'></embed>"
                        + "</object>";
                    flashPlayerCreated = true;
                }
                if (flashPlayerCreated) {
                    window.setTimeout(function() {
                        var player = document.getElementById("MapVideo");
                        player.setVideoId(videoId);
                    }, 0);
                }
            });
        }
        videoPanel.render();
        videoPanel.show();
    }
    
</script>

