/// <reference name="MicrosoftAjax.js"/>
function setToVehicleTask(taskId) {
    var url = "/Views/AjaxServices/VehicleMission/VehicleMission.aspx?p=VehicleTaskAjaxSvc&taskid=" + taskId;
    var wRequest = new Sys.Net.WebRequest();
    wRequest.add_completed(initTracePlayer);
    wRequest.set_url(url);
    wRequest.invoke();
}
function initTracePlayer(executor, eventArgs) {
    if (executor.get_statusCode() == "200") {
        var body = executor.get_responseData();
        var task = null;
        try {
            task = Sys.Serialization.JavaScriptSerializer.deserialize(body);
        }
        catch (e) { };
        if (!task) {
            return;
        }
        var pts = buildRelation(task);
        var player = new TracePlayer(pts, map);
        player.setStreamEventHandler({ scope: this, handler: function(data) {
            var ret = new Array();
            for (var i = 0; i < data.length; i++) {
                if (data[i].ImageUrl && data[i].ImageUrl != '') {
                    ret.push({ type: TracePlayer.CONTENT_TYPE_IMAGE,
                        src: data[i].ImageUrl,
                        title: ""
                    });
                } else if (data[i].VideoUrl && data[i].VideoUrl != '') {
                    ret.push({ type: TracePlayer.CONTENT_TYPE_VIDEO,
                        src: data[i].VideoUrl,
                        title: ""
                    });
                }
            }
            return ret;
        }
        });
        player.play();
    }
}
function buildRelation(task) {
    var towPoints = new Array();
    var pts = null;
    try {
        if (task && task.Trace && task.Trace.Points && task.Trace.Points != '') {
            pts = Sys.Serialization.JavaScriptSerializer.deserialize(task.Trace.Points);
        }
    }
    catch (e) { }
    if (!pts) {
        return null;
    }
    var data = task.Trace.Data;
    var length = pts.length;
    var dataLength = data.length;
    var p1 = null;
    var p2 = null;
    var polyLine = null;
    for (var i = 0; i < length; i++) {
        pts[i].data = new Array();
        p1 = new GLatLng(pts[i].Lat, pts[i].Lng);
        towPoints[0] = p1;
        for (var j = 0; j < dataLength; j++) {
            if (data[j].isTouched) {
                continue;
            }
            p2 = new GLatLng(data[j].LatLng.Lat, data[j].LatLng.Lng);
            towPoints[1] = p2;
            polyLine = new GPolyline(towPoints, "#0000af", 3, 0.6);
            //less or equal than 20 meters
            if (polyLine.getLength() <= 20) {
                pts[i].data.push(data[j]);
                data[j].isTouched = true;
            }
        }
    }

    return pts;
}