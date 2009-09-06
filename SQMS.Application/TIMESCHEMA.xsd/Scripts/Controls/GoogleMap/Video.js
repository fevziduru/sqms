/// <reference name="MicrosoftAjax.js"/>
var poly;
var polyPoints = new Array();
var videoPanel = null;
var flashPlayerCreated = false;

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
        log(polyPoints.length);
        polyPoints.push(new GLatLng(lat, lng));
        poly = new GPolyline(polyPoints, "#0000af", 3, 0.6);
        //var length = poly.getLength() / 100;
        //var unit = " 米";
        map.addOverlay(poly);
}
function openVideo(videoId, videoName, drawTrace, notOpenPanel) {
        if (!notOpenPanel) {

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
                        videoPanel.hideEvent.subscribe(function() {
                                window.setTimeout(function() {
                                        try {
                                                var player = document.getElementById("MapVideo");
                                                player.stop();
                                        } catch (e) { }
                                }, 0);
                        });
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
                                        window.setTimeout(function() { letPlayerPlay(videoId, drawTrace); }, 2000);
                                }
                        });
                }
                videoPanel.render();
                videoPanel.show();
        } else {
                letPlayerPlay(videoId, drawTrace)
        }
}
function letPlayerPlay(videoId, drawTrace) {
        try {
                var player = document.getElementById("MapVideo");
                if (!drawTrace) {
                        drawTrace = false;
                } else {
                        drawTrace = true;
                }
                player.setVideoId(videoId, drawTrace);
        } catch (e) { }
}