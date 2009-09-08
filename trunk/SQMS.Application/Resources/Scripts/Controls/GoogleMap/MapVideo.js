/// <reference name="MicrosoftAjax.js"/>
/// <reference name="MicrosoftAjax.js"/>
function MapVideo() {
        this.poly = null;
        this.polyPoints = new Array();
        this.videoPanel = null;
        this.flashPlayerCreated = false;
        this.videoPanel = null;
        this.flashPlayerCreated = false;

        this.width = 360;
        this.height = 330;
        this.videoWidth = 320;
        this.videoHeight = 280;
        this.videoName = "";
        this.sourceByVideoId = false;
        this.externVideoUrl = "";
        this.autoPlay = false;
        this.openNewWidnow = false;

        this.videoId = "";
        this.drawTrace = false;

        this.playerElId = YAHOO.util.Dom.generateId("", "mapVideoPlayer");
}

MapVideo.prototype.render = function() {
        this.renderPanel_();
}
MapVideo.prototype.playVideo = function() {
        this.polyPoints.length = 0;
        if (this.poly) {
                map.removeOverlay(this.poly);
        }
        log("video started");
}
MapVideo.prototype.stopVideo = function() {
        log("video stoped");
}
MapVideo.prototype.pauseVideo = function() {
        log("video paused");
}
MapVideo.prototype.videoPlayerPlayheadUpdate = function(lat, lng) {
        if (this.poly) {
                map.removeOverlay(this.poly);
        }
        log(this.polyPoints.length);
        this.polyPoints.push(new GLatLng(lat, lng));
        this.poly = new GPolyline(this.polyPoints, "#0000af", 3, 0.6);
        //var length = poly.getLength() / 100;
        //var unit = " 米";
        map.addOverlay(this.poly);
}
MapVideo.prototype.renderPanel_ = function() {
        if (!this.videoPanel) {
                var cfgObj = new Object();
                cfgObj.fixedcenter = false;
                cfgObj.constraintoviewport = true;
                cfgObj.width = this.width + "px";
                cfgObj.height = (this.height + 50) + "px";
                cfgObj.draggable = !this.openNewWindow;
                cfgObj.visible = !this.openNewWindow;
                cfgObj.close = this.openNewWindow
                cfgObj.underlay = "shadow";
                this.videoPanel = new YAHOO.widget.Panel("mapVideo", cfgObj);

                this.videoPanel.hideEvent.subscribe(function() {
                        window.setTimeout(function() {
                                try {
                                        var player = document.getElementById(this.playerElId);
                                        player.stop();
                                } catch (e) { }
                        }, 0);
                }, true, this);
                if (this.videoName != "") {
                        this.videoPanel.setHeader(this.videoName);
                }
                this.videoPanel.hideEvent.subscribe(this.letPlayerStop_, true, this);
                if (this.openNewWindow) {
                        this.videoPanel.showEvent.subscribe(function() {
                                if (!this.flashPlayerCreated) {
                                        this.videoPanel.setBody("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='" + this.playerElId + "' codebase='http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab'>"
                    + "<param name='movie' value='/Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf' />"
                    + "<param name='quality' value='high' />"
                    + "<param name='bgcolor' value='#869ca7' />"
                    + "<param name='allowScriptAccess' value='sameDomain' />"
                    + "<embed src='/Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf' "
                        + "quality='high' bgcolor='#869ca7' width='320' height='280' name='" + this.playerElId + "' align='middle' "
                        + "play='true' loop='false' quality='high' allowscriptaccess='sameDomain' type='application/x-shockwave-flash' "
                        + "pluginspage='http://www.adobe.com/go/getflashplayer'></embed>"
                    + "</object>");
                                        this.flashPlayerCreated = true;
                                }

                        }, true, this);
                }
                else {
                        this.videoPanel.setBody("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='" + this.playerElId + "' width='" + this.videoWidth + "' "
                    + "height='" + (this.videoHeight + 40) + "' codebase='http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab'>"
                    + "<param name='movie' value='/Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf' />"
                    + "<param name='quality' value='high' />"
                    + "<param name='bgcolor' value='#869ca7' />"
                    + "<param name='allowScriptAccess' value='sameDomain' />"
                    + "<embed src='/Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf' "
                        + "quality='high' bgcolor='#869ca7' width='320' height='280' name='" + this.playerElId + "' align='middle' "
                        + "play='true' loop='false' quality='high' allowscriptaccess='sameDomain' type='application/x-shockwave-flash' "
                        + "pluginspage='http://www.adobe.com/go/getflashplayer'></embed>"
                    + "</object>");
                        this.flashPlayerCreated = true;
                }

                this.videoPanel.render();
                if (!this.openNewWindow) {
                        this.letPlayerPlay_();
                }
        }
}
MapVideo.prototype.show = function() {
        this.renderPanel_();
        this.videoPanel.show();
        this.letPlayerPlay_();
}
MapVideo.prototype.hide = function() {
        this.videoPanel.hide();
        this.letPlayerStop_();
}
MapVideo.prototype.letPlayerStop_ = function() {
        var ctx = { videoId: this.videoId, drawTrace: this.drawTrace, playerElId: this.playerElId };
        window.setTimeout(function() {
                try {
                        var player = null;
                        if (navigator.appName.indexOf("Microsoft") != -1) {
                                player = document.getElementById(ctx.playerElId);
                        } else {
                                player = document[ctx.playerElId];
                        }
                        player.stop();
                } catch (e) {
                        alert(e);
                }
        }, 0);
}
MapVideo.prototype.letPlayerPlay_ = function() {
        if (this.sourceByVideoId) {
                this.playInnerVideo_();
        } else {
                this.playExternVideo_();
        }
}
MapVideo.prototype.playInnerVideo_ = function() {
        var ctx = { videoId: this.videoId, drawTrace: this.drawTrace, playerElId: this.playerElId };
        window.setTimeout(function() {
                try {
                        var player = null;
                        if (navigator.appName.indexOf("Microsoft") != -1) {
                                player = document.getElementById(ctx.playerElId);
                        } else {
                                player = document[ctx.playerElId];
                        }
                        player.setVideoId(ctx.videoId, ctx.drawTrace);
                } catch (e) {
                        alert(e);
                }
        }, 2000);
}
MapVideo.prototype.playExternVideo_ = function() {
        var ctx = { externVideoUrl: this.externVideoUrl, autoPlay: this.autoPlay, playerElId: this.playerElId };
        window.setTimeout(function() {
                try {
                        var player = null;
                        if (navigator.appName.indexOf("Microsoft") != -1) {
                                player = document.getElementById(ctx.playerElId);
                        } else {
                                player = document[ctx.playerElId];
                        }

                        player.setExternVideoUrl(ctx.externVideoUrl, ctx.autoPlay);
                } catch (e) {
                        alert(e);
                }
        }, 2000);
}
var MapVideoManager = {
        instances_: {},
        addInstance: function(id, obj) {
                this.instances_[id] = obj;
        },
        removeInstance: function(id) {
                delete this.instances_[id];
        },
        clearInstance: function() {
                delete this.instances_;
                this.instances_ = new Object();
        },
        getInstance: function(id) {
                return this.instances_[id];
        }

}