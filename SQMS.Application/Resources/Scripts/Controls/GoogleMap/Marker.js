/// <reference name="MicrosoftAjax.js"/>
/// <reference name="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"/>

function WGMarker() {
    this.fields = new Object();
    this.gMap = null;
    this.gMarker = null;
    this.mpId = "";
    this.mpName = "";
    this.lat = "";
    this.lng = "";
    this.lv = 10;
    this.qualityLevel = 0;
    this.isStart = false;
    this.isEnd = false;
}
WGMarker.iframeQcNormal = null;
WGMarker.iframeQcDynamic = null;
WGMarker.prototype.onClick = function() {
    //this.gMap.setCenter(this.gMarker.getLatLng(), this.gMap.getZoom());
    this.openInfoWindowHtml();
}

WGMarker.prototype.openInfoWindowHtmlTab = function() {
    //var tab1 = new GInfoWindowTab("常态数据",this.getInfoHtml("_qc_type_normal"));
    //var tab2 = new GInfoWindowTab("巡检数据",this.getInfoHtml("_qc_type_dynamic"));
    var tab1 = new GInfoWindowTab("常态数据", this.getInfoHtmlElement("_qc_type_normal"));
    var tab2 = new GInfoWindowTab("巡检数据", this.getInfoHtmlElement("_qc_type_dynamic"));
    //this.gMap.openInfoWindowTabsHtml(this.gMarker.getLatLng(), [tab1,tab2]);
    //this.gMap.openInfoWindowTabs(this.gMarker.getLatLng(), [tab1, tab2]);
    this.gMarker.openInfoWindowTabs([tab1, tab2], { pixelOffset: 0, maxWidth: 500, maxContent: $get("divMaxInfoWindowContent"), maxTitle: $get("maxInfoWindowTitle") });
//    if (currentClickedMarker) {
//        prevClickedMarkerMeta.mpId = currentClickedMarker.mpId;
//        prevClickedMarkerMeta.iconUrl = currentClickedMarker.gMarker.getIcon().image;
//        currentClickedMarker.gMarker.setImage(this.gMarker.getIcon().image);
//    }
      currentClickedMarker = this;
//    this.gMarker.setImage("/Resources/Images/Controls/Map/marker-blank-h.png");
//    if (markers[prevClickedMarkerMeta.mpId]) {
//        markers[prevClickedMarkerMeta.mpId].gMarker.setImage(prevClickedMarkerMeta.iconUrl);
//    }
}
WGMarker.prototype.openInfoWindowHtml = function() {
    var html = "";
    if (this.isStart) {
        html = this.getInfoHtml("_qc_type_dynamic");
    } else {
        html = this.getInfoHtml("_qc_type_normal");
    }
    this.gMarker.openInfoWindowHtml(html, { pixelOffset: 0, maxWidth: 500, maxContent: $get("divMaxInfoWindowContent"), maxTitle: $get("maxInfoWindowTitle") });
    currentClickedMarker = this;
    $get("divCurrSelMPPath").innerHTML = "<h4 style='font-size:14px;'>" + this.fields.ProjectName + " - " + this.fields.RoadName + " - <a href='javascript:setToMarker(&quot;" + this.mpId + "&quot;,&quot;" + this.mpName + "&quot;," + this.lng + "," + this.lat + "," + this.lv + "," + this.qualityLevel + ",true,true);'>" + this.fields.MonitorPointName + "</a></h4>";
}
WGMarker.prototype.getInfoHtml = function(qcType) {
    var html = "<iframe src='/Views/Quality/QualityMonitorPointMap.aspx?p=QualityQualityMonitorPointMap&mptype="+mpType+"&qcType=" + qcType + "&mpid=" + this.mpId + "' width='500' height='300' frameborder='0' border='0' frameborder='no' />";
    return html;
}
WGMarker.prototype.getInfoHtmlElement = function(qcType) {
    if (qcType == "_qc_type_normal") {
        if (!WGMarker.iframeQcNormal) {
            WGMarker.iframeQcNormal = document.createElement("iframe");
            WGMarker.iframeQcNormal.width = 500;
            WGMarker.iframeQcNormal.height = 300;
            WGMarker.iframeQcNormal.frameBorder = "0";
            WGMarker.iframeQcNormal.id = "iframeQcNormal";
        }
        WGMarker.iframeQcNormal.src = "/Views/Quality/QualityMonitorPointMap.aspx?p=QualityQualityMonitorPointMap&qcType=" + qcType + "&mpid=" + this.mpId;
        return WGMarker.iframeQcNormal;
    }
    else if (qcType == "_qc_type_dynamic") {
        if (!WGMarker.iframeQcDynamic) {
            WGMarker.iframeQcDynamic = document.createElement("iframe");
            WGMarker.iframeQcDynamic.width = 500;
            WGMarker.iframeQcDynamic.height = 300;
            WGMarker.iframeQcDynamic.frameBorder = "0";
            WGMarker.iframeQcDynamic.id = "iframeQcDynamic";
        }
        WGMarker.iframeQcDynamic.src = "/Views/Quality/QualityMonitorPointMap.aspx?p=QualityQualityMonitorPointMap&qcType=" + qcType + "&mpid=" + this.mpId;
        return WGMarker.iframeQcDynamic;
    }
    return null;
}
var WGMarkerFactory = {
    MAX_ZOOM_LEVEL: 19,
    markerManager: null,
    gmap: null,
    getMarkerManager: function() {
        if (!WGMarkerFactory.markerManager) {
            WGMarkerFactory.markerManager = new MarkerManager(WGMarkerFactory.gmap);
        }
        return WGMarkerFactory.markerManager;
    },
    createWGMarker: function(mpId, mpName, lat, lng, lv, qclv, mpFields) {
        var icon = new GIcon();
        if (!qclv) {
            qclv = 0;
        }
        var iconImgName = "marker-qclv-";
        if (qclv > 0) {
            iconImgName += qclv + ".png";
        } else {
            iconImgName = "marker-blank.png";
        }
        if (mpFields.IsStart == true) {
            iconImgName = "marker-start.png";
        }
        if (mpFields.IsEnd == true) {
            iconImgName = "marker-end.png";
        }
        icon.image = "/Resources/Images/Controls/Map/" + iconImgName;
        icon.iconAnchor = new GPoint(5, 34);
        icon.infoWindowAnchor = new GPoint(10, 0);
        icon.iconSize = new GSize(20, 34);

        var m = new WGMarker();
        m.mpId = mpId;
        m.mpName = mpName;
        m.lat = lat;
        m.lng = lng;
        m.gMap = WGMarkerFactory.gmap;
        m.level = (lv < 1 || lv > 19) ? 10 : lv;
        m.qualityLevel = qclv;
        m.isStart = (mpFields && mpFields.IsStart && (mpFields.IsStart == true || mpFields.IsStart == "Y")) ? true : false;
        m.fields = mpFields;
        m.gMarker = new GMarker(new GLatLng(lat, lng), { icon: icon, title: mpName });
        GEvent.bind(m.gMarker, "click", m, m.onClick);
        GEvent.addListener(m.gMarker, "infowindowopen", function() {
            map.getInfoWindow().enableMaximize();
        });
        //GEvent.addListener(m.gMarker, "infowindowopen", function() { alert("infowindowopen"); });
        //GEvent.addListener(m.gMarker, "infowindowclose", function() { alert("infowindowclose"); });


        //gmap.addOverlay(m.gMarker);
        return m;
    }
}

