/// <reference name="MicrosoftAjax.js"/>
function TracePlayer(trace,map) {
    this.traceData = (Object.getTypeName(trace) == 'Array') ? trace : new Array();
    this.map = map;
    this.pointer_ = 0;
    this.lineDrawer = new polyLineDrawer(map);
    this.timer_ = null;
}

TracePlayer.prototype.play = function() {
    var delegate = Function.createDelegate(this, function() {
        this.executePlay_();
    });
    this.timer_ = window.setInterval(delegate, 1000);
}
TracePlayer.prototype.executePlay_ = function() {
    if (this.pointer_ < this.traceData.length) {
        this.lineDrawer.draw(this.traceData[this.pointer_].Lat, this.traceData[this.pointer_].Lng);
        this.pointer_++;
    }
}

TracePlayer.prototype.pause = function() {
    window.clearInterval(this.timer_);
}

TracePlayer.prototype.stop = function() {
    window.clearInterval(this.timer_);
    this.pointer_ = 0;
}