/// <reference name="MicrosoftAjax.js"/>
var StaticMapType = {};
StaticMapType.ROAD_MAP = "roadmap";
StaticMapType.MOBILE = "mobile";
StaticMapType.SATELLITE = "satellite";
StaticMapType.TERRAIN = "terrain";
StaticMapType.HYBRID = "hybrid";

var StaticMapFormat = {
    GIF: "gif",
    JPG: "jpg",
    JPG_BASELINE: "jpg-baseline",
    PNG8: "png8",
    PNG32: "png32"
}
var StaticMapMarkerSize = {
    TINY: "tiny",
    MID: "mid",
    SMALL: "small"
}
var StaticMapMarkerColor = {
    BLACK: "black", BROWN: "brown", GREEN: "green", PURPLE: "purple", YELLOW: "yellow", BLUE: "blue", GRAY: "gray", ORANGE: "orange", RED: "red", WHITE: "white"
}
function StaticMapMarker(lat, lng, size, color) {
    this.lat = lat;
    this.lng = lng;
    this.size = size ? size : StaticMapMarkerSize.SMALL;
    this.color = color ? color : StaticMapMarkerColor.ORANGE;
}
function StaticMap(containerElId) {
    this.key = "ABQIAAAA41EnQa1wtzf10JQz5YdqmRQ6hbvwoS9GD89j9qEqTKobihdwiBTS_QjMbHbdYwkxWiBA-XpSkWHt_w";
    this.centerLat = 0;
    this.centerLng = 0;
    this.zoom = 0;
    this.mapType = StaticMapType.ROAD_MAP;
    this.format = StaticMapFormat.GIF;
    this.markers = new Array();

    this.containerEl = document.getElementById(containerElId);
    this.width = 300;
    this.height = 200;
}
StaticMap.prototype.render = function() {
    if (!this.containerEl) {
        return;
    }
    var markers = "";
    for (var i = 0; i < this.markers.length; i++) {
        if (i == 0) {
            markers += this.markers[i].lat + "," + this.markers[i].lng + "," + this.markers[i].size +  this.markers[i].color;
        } else {
            markers += "|" + this.markers[i].lat + "," + this.markers[i].lng + "," + this.markers[i].size +  this.markers[i].color;
        }
    }
    var url = "http://ditu.google.cn/staticmap?"
//        + "center=" + this.centerLat + "," + this.centerLng + "&"
//        + "zoom=" + this.zoom + "&"
        + "size=" + this.width + "x" + this.height + "&"
        + "maptype=" + this.mapType + "&"
        + "markers=" + markers + "&"
        + "key=" + this.key + "&"
        + "sensor=false";
    var imageEl = new Image();
    imageEl.style.boder = "none";

    imageEl.setAttribute("src", url);
    this.containerEl.appendChild(imageEl);
}
StaticMap.prototype.addMarker = function(marker) {
    if (marker) {
        this.markers.push(marker);
    }
}


var StaticMapFactory = {
    currentMpId: "",
    currentStaicMap: null,
    isInRoadRequesting_: false,
    createStaticMap: function(containerElId, currMpId) {
        this.currentMpId = currMpId;
        this.currentStaicMap = new StaticMap(containerElId);
        var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&mpid=" + currMpId;

        var handler = Function.createDelegate(this, function(executor, eventArgs) {
            if (executor.get_statusCode() == "200") {
                var body = executor.get_responseData();
                var mps = [];
                try {
                    mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
                }
                catch (e) { };
                this.createStaticMarkers(mps);
                var roadUrl = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&roadid=" + mps[0].RoadId;
                if (this.isInRoadRequesting_ !== true) {
                    this.isInRoadRequesting_ = true;
                    this.fetchMonitorPoints_(roadUrl, Function.createDelegate(this, function(executor, eventArgs) {
                        if (executor.get_statusCode() == "200") {
                            var body = executor.get_responseData();
                            var mps = [];
                            try {
                                mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
                            } catch (e) { };
                            this.createStaticMarkers(mps);
                            this.currentStaicMap.render();
                        }
                    }));
                }
            }
        });
        this.fetchMonitorPoints_(url, handler);
        try {
            return handler;
        } finally {
            handler = null;
        }
    },
    fetchMonitorPoints_: function(url, handler) {
        wRequest = new Sys.Net.WebRequest();
        Sys.Net.WebRequestManager.add_completedRequest(handler);
        wRequest.set_url(url);
        Sys.Net.WebRequestManager.executeRequest(wRequest);
    },
    createStaticMarkers: function(mps) {
        if (mps) {
            for (var i = 0; i < mps.length; i++) {
                if (mps[i].MonitorPointId == this.currentMpId) {
                    this.currentStaicMap.addMarker(new StaticMapMarker(mps[i].Lat, mps[i].Lng, StaticMapMarkerSize.MID, StaticMapMarkerColor.RED));
                } else {
                    this.currentStaicMap.addMarker(new StaticMapMarker(mps[i].Lat, mps[i].Lng, StaticMapMarkerSize.SMALL, StaticMapMarkerColor.ORANGE));
                }
            }
        }
    }


}