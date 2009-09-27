/// <reference name="MicrosoftAjax.js"/>
function PolyLineDrawer(map) {
    this.map_ = map;
    this.polyLines_ = new Array();
    this.totalLength_ = 0;
    this.prevPoint_ = null;
}

PolyLineDrawer.prototype.draw = function(lat, lng) {
    var towPoints = new Array();
    var point = new GLatLng(lat, lng);
    if (this.prevPoint_) {
        towPoints.push(this.prevPoint_);
        towPoints.push(point);
    }
    var poly = new GPolyline(towPoints, "#0000af", 3, 0.6);
    this.totalLength_ += poly.getLength();
    this.map_.addOverlay(poly);
    this.polyLines_.push(poly);
    this.prevPoint = point;
}

PolyLineDrawer.prototype.clear = function() {
    if (this.polyLines_) {
        for (var i = 0; i < this.polyLines_.length; i++) {
            this.map_.removeOverlay(this.polyLines_[i]);
        }
    }
    this.prevPoint = null;
}