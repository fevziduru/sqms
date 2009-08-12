/// <reference name="MicrosoftAjax.js"/>
/// <reference name="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"/>

function WGMarker() {
    this.gMap = null;
    this.gMarker = null;
    this.mpId = "";
    this.mpName = "";
    this.lat = "";
    this.lng = "";
}
WGMarker.iframeQcNormal = null;
WGMarker.iframeQcDynamic = null;
WGMarker.prototype.onClick = function() {
    //this.gMap.setCenter(this.gMarker.getLatLng(), this.gMap.getZoom());
    this.openInfoWindowHtmlTab();
}

WGMarker.prototype.openInfoWindowHtmlTab = function() {
    //var tab1 = new GInfoWindowTab("常态数据",this.getInfoHtml("_qc_type_normal"));
    //var tab2 = new GInfoWindowTab("巡检数据",this.getInfoHtml("_qc_type_dynamic"));
    var tab1 = new GInfoWindowTab("常态数据", this.getInfoHtmlElement("_qc_type_normal"));
    var tab2 = new GInfoWindowTab("巡检数据", this.getInfoHtmlElement("_qc_type_dynamic"));
    //this.gMap.openInfoWindowTabsHtml(this.gMarker.getLatLng(), [tab1,tab2]);
    this.gMap.openInfoWindowTabs(this.gMarker.getLatLng(), [tab1, tab2]);
}

WGMarker.prototype.getInfoHtml = function(qcType) {
    var html = "<iframe src='QualityMonitorPointMap.aspx?qcType=" + qcType + "&mpid=" + this.mpId + "' width='500' height='300' frameborder='0' border='0' frameborder='no' />";
    return html;
}
WGMarker.prototype.getInfoHtmlElement = function(qcType) {
    if (qcType == "_qc_type_normal") {
        if (!WGMarker.iframeQcNormal) {
            WGMarker.iframeQcNormal = document.createElement("iframe");
            WGMarker.iframeQcNormal.width = 500;
            WGMarker.iframeQcNormal.height = 300;
            WGMarker.iframeQcNormal.frameBorder = "0";
        }
        WGMarker.iframeQcNormal.src = "QualityMonitorPointMap.aspx?qcType=" + qcType + "&mpid=" + this.mpId;
        return WGMarker.iframeQcNormal;
    }
    else if (qcType == "_qc_type_dynamic") {
        if (!WGMarker.iframeQcDynamic) {
            WGMarker.iframeQcDynamic = document.createElement("iframe");
            WGMarker.iframeQcDynamic.width = 500;
            WGMarker.iframeQcDynamic.height = 300;
            WGMarker.iframeQcDynamic.frameBorder = "0";
        }
        WGMarker.iframeQcDynamic.src = "QualityMonitorPointMap.aspx?qcType=" + qcType + "&mpid=" + this.mpId;
        return WGMarker.iframeQcDynamic;
    }
    return null;
}
var WGMarkerFactory = {
    createWGMarker: function(mpId, mpName, lat, lng, gmap) {
        var m = new WGMarker();
        m.mpId = mpId;
        m.mpName = mpName;
        m.lat = lat;
        m.lng = lng;
        m.gMap = gmap;
        m.gMarker = new GMarker(new GLatLng(lat, lng), { title: mpName });
        GEvent.bind(m.gMarker, "click", m, m.onClick);
        gmap.addOverlay(m.gMarker);
        return m;
    }
}

