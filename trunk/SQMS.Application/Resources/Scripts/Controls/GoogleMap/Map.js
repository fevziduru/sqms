/// <reference name="MicrosoftAjax.js"/>
/// <reference name="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"/>
/*
* Map.js依赖于Google Map API v2，ASP.Net AJAX客户端库，Marker.js，引用Map.js前请先引用Google Map API v2，ASP.Net AJAX客户端库，Marker.js
*/
/**
* 记录日志
*/
function log(msg) {
    //document.getElementById("divLog").innerHTML += msg + "<br />";
}
/**
* 在页面卸载时执行。防止IE memory leak
*/
function unload() {
    GUnload();
}

function escKeyUpHandler(e) {
    if (e.keyCode == '27') {
        closeDetail();
        $removeHandler(document.body, "keyup", escKeyUpHandler);
    }
}
/**
* 关闭全屏信息窗口，通常这个窗口用于显示标记点详细信息
*/
function closeDetail() {
    this.parentElement.parentElement.style.display = 'none';
    map.getInfoWindow().restore();
}
/**
* 初始化地图，要求页面上包含ID为map_canvas的div元素，地图将在这个div中创建。
*/
function initMap() {
    if (GBrowserIsCompatible()) {
        if (!map) {
            document.getElementById("map_canvas").style.height = document.body.clientHeight - 170;
            map = new GMap2(document.getElementById("map_canvas"));

            if (true == autoFetchMarker) {
                GEvent.addListener(map, "load", fetchMarkers);
                GEvent.addListener(map, "moveend", fetchMarkers);
            }
            GEvent.addListener(map, "zoomend", showZoomLevel);
            GEvent.addListener(map.getInfoWindow(), "maximizeend", function() {
                var url = "";
                if (true == currentClickedMarker.fields.IsStart) {
                    url = "/Views/Quality/MonitorPointDetail.aspx?qcType=_qc_type_dynami&mpid=" + currentClickedMarker.mpId;
                } else if (false == currentClickedMarker.fields.IsStart) {
                    url = "/Views/Quality/MonitorPointDetail.aspx?qcType=_qc_type_normal&mpid=" + currentClickedMarker.mpId;
                }

                var divMore = document.getElementById("divMoreInfo");
                var iframeMore = document.getElementById("iframeMoreInfo");

                if (!divMore) {
                    var closeMoreText = document.createTextNode("关闭");
                    var lnkMoreClose = document.createElement('a');
                    lnkMoreClose.href = "javascript:void(0);";
                    lnkMoreClose.setAttribute("title", "");
                    lnkMoreClose.appendChild(closeMoreText);
                    var divMoreClose = document.createElement('div');
                    divMoreClose.style.cssText = "text-align:right;";
                    divMoreClose.appendChild(lnkMoreClose);
                    divMore = document.createElement('div');
                    divMore.id = "divMoreInfo";
                    divMore.style.cssText = 'margin:0;' +
		                    'padding:0;' +
		                    'border:0;' +
		                    'background-color:#4D81BD;' +
		                    'background-image:none;';
                    divMore.style.position = "absolute";
                    divMore.style.top = "0px";
                    divMore.style.left = "0px";
                    divMore.style.width = "100%";
                    divMore.style.zIndex = 9999;
                    divMore.appendChild(divMoreClose);
                    document.body.appendChild(divMore);

                    $addHandler(lnkMoreClose, "click", closeDetail);
                }
                if (!iframeMore) {
                    iframeMore = document.createElement('iframe');
                    iframeMore.id = "iframeMoreInfo";
                    iframeMore.frameborder = 0;
                    iframeMore.style.width = "100%";
                    divMore.appendChild(iframeMore);
                }

                if (divMore.style.display == 'none') {
                    divMore.style.display = '';
                }
                divMore.style.height = window.screen.availHeight;
                iframeMore.style.height = window.screen.availHeight;
                iframeMore.src = url;

                //$addHandler(window "keyup", escKeyUpHandler);
            });
			GEvent.addListener(map, "click", showClickLatLng);
            //GEvent.addListener(map, "mouseover", showMouseLatLng);
            //GEvent.addListener(map, "mousemove", showMouseLatLng);

            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());

            map.enableDoubleClickZoom();
            map.enableScrollWheelZoom();

            var lastLatLngCookie = new Cookie("lastlatlng");
            var lastLat = initLat;
            var lastLng = initLng;
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
/**
* 移动到某个标记点并打开信息窗口的触发器。
* 在需要通过异步HTTP请求获取标记点的情况下，
* 可以使地图在异步请求返回时将中心点移动到特定的标记点，并打开信息窗口。
* 用法：
*    setToMarkerListener.enable = true;
*    setToMarkerListener.setCenter = true;
*    setToMarkerListener.openInfoWindow = true;
*    setToMarkerListener.mpid = [mpid];//监控点ID，将会移动到这个监控点对应的地图标记点上。
*/
var setToMarkerListener = {
    enable: false,
    setCenter: false,
    openInfoWindow: false,
    mpid: "",
    setToMarker: function() {
        if (!this.enable) {
            return;
        }
        var m = markers[this.mpid];
        if (!m) {
            return;
        }
        if (this.setCenter == true) {
            map.setCenter(m.gMarker.getLatLng(), m.level);
        }

        if (this.openInfoWindow) {
            window.setTimeout(function() { openMarkerInfoWindow(m); });
        }
        var lastLatLngCookie = new Cookie("lastlatlng");
        lastLatLngCookie.lat = m.fields.Lat;
        lastLatLngCookie.lng = m.fields.Lng;
        lastLatLngCookie.store(365);

        this.enable = false;
    }
}
function setToMarker(mpId, mpName, lat, lng, lv, qclv, openInfoWindow, setCenter, mpFields) {
    setToMarkerListener.enable = true;
    setToMarkerListener.setCenter = setCenter;
    setToMarkerListener.openInfoWindow = openInfoWindow;
    setToMarkerListener.mpid = mpId;
    if (markers[mpId]) {
        setToMarkerListener.setToMarker();
    }
    else {
        fetchMarkersById(mpId);
    }
}
function openMarkerInfoWindow(m) {
    m.openInfoWindowHtml();
}
function createMarker(mpId, mpName, lat, lng, lv, qclv, mpFields) {
    var marker = null;
    if (markers[mpId]) {
        return markers[mpId];
    }
    else {
        marker = WGMarkerFactory.createWGMarker(mpId, mpName, lat, lng, lv, qclv, mpFields);
        markers[mpId] = marker;
    }
    return marker;
}
//按地图显示区域的经纬度获取监控点
function fetchMarkers() {
    var bound = map.getBounds();
    var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&mptype="+mpType+"&swlat=" + bound.getSouthWest().lat()
            + "&swlng=" + bound.getSouthWest().lng()
            + "&nelat=" + bound.getNorthEast().lat()
            + "&nelng=" + bound.getNorthEast().lng();
    wRequest = new Sys.Net.WebRequest();
    Sys.Net.WebRequestManager.add_completedRequest(initMarker);
    wRequest.set_url(url);
    Sys.Net.WebRequestManager.executeRequest(wRequest);
    showRequestNum(requestNum++);
}
function fetchMarkersById(mpid) {
    var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&mpid=" + mpid;
    wRequest = new Sys.Net.WebRequest();
    Sys.Net.WebRequestManager.add_completedRequest(initMarker);
    wRequest.set_url(url);
    Sys.Net.WebRequestManager.executeRequest(wRequest);
    showRequestNum(requestNum++);
}
function setToRoad(roadId, mpId) {
    setToMarkerListener.enable = true;
    setToMarkerListener.setCenter = true;
    setToMarkerListener.openInfoWindow = true;
    setToMarkerListener.mpid = mpId;
    if (markers[mpId]) {
        setToMarkerListener.setToMarker();
    }
    else {
        fetchMarkersByRoad(roadId);
    }
}
function setToEvent(eventId, mpId) {
    setToMarkerListener.enable = true;
    setToMarkerListener.setCenter = true;
    setToMarkerListener.openInfoWindow = true;
    setToMarkerListener.mpid = mpId;
    if (markers[mpId]) {
        setToMarkerListener.setToMarker();
    }
    else {
        fetchMarkersByEvent(eventId);
    }
}
function fetchMarkersByRoad(roadId) {
    var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&roadid=" + roadId;
    wRequest = new Sys.Net.WebRequest();
    Sys.Net.WebRequestManager.add_completedRequest(initMarker);
    wRequest.set_url(url);
    Sys.Net.WebRequestManager.executeRequest(wRequest);
    showRequestNum(requestNum++);
}
function fetchMarkersByEvent(eventId) {
    var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&mptype=_mp_type_event&eventid=" + eventId;
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
                        var m = createMarker(mps[i].MonitorPointId, mps[i].MonitorPointName, mps[i].Lat, mps[i].Lng, mps[i].Level, mps[i].LastestQCLevel, mps[i]);
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
                setToMarkerListener.setToMarker();
            }
        }
    }
}
function showClickLatLng(btn,latlng) {
	showMouseLatLng(latlng);
}
function showMouseLatLng(latlng) {
    document.getElementById("spanLatLng").innerHTML += latlng.lat() + ", " + latlng.lng() + "<br />";
}

function showZoomLevel(oldLevel, newLevel) {
    document.getElementById("spanZoomLevel").innerHTML = newLevel;
}

function showRequestNum(num) {
    document.getElementById("spanRequestNum").innerHTML = num;
}

Sys.Application.add_load(initMap);
$addHandler(document.body, "unload", unload);