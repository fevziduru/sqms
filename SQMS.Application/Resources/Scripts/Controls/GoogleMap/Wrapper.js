/// <reference name="MicrosoftAjax.js"/>
/// <reference name="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRTxeaWv84-ck4x-DUqL2zaVsQe3uhRN79rDUN9KUejjajmJPO2i0VJbUw&hl=zh-CN"/>

function WGMarker() {
    this.gMap = null;
    this.gMarker = null;
    this.qp = null;
}

WGMarker.prototype.onClick = function() {
    this.gMap.setCenter(this.gMarker.getLatLng(), this.gMap.getZoom());
    this.gMap.openInfoWindowHtml(this.gMarker.getLatLng(), this.getInfoHtml());
}

WGMarker.prototype.getInfoHtml = function() {
    var html = "<iframe src='QualityMonitorPointMap.aspx?qpid=" + this.qp.id + "' width='300' height='500' frameborder='0' border='0' frameborder='no' />";
    return html;
}
var WGMarkerFactory = {
    createWGMarker: function(qp, gmap) {
        var m = new WGMarker();
        m.qp = qp;
        m.gMap = gmap;
        m.gMarker = new GMarker(new GLatLng(qp.lat, qp.lng));
        GEvent.bind(m.gMarker, "click", m, m.onClick);
        gmap.addOverlay(m.gMarker);
        return m;
    }
}

