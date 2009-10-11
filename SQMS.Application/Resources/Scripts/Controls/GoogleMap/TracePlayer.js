/// <reference name="MicrosoftAjax.js"/>
/**
* 轨迹播放器
* @param Array trace 轨迹数据数据，定义为：[{Lat:Number,Lng:Number,data:Array}]
* @param GMap map Google Map Object
*/
function TracePlayer(trace, map) {
    this.traceData = (Object.getTypeName(trace) == 'Array') ? trace : new Array();
    this.map = map;
    this.pointer_ = 0;
    this.lineDrawer = new PolyLineDrawer(map);
    this.timer_ = null;
    this.animTimer_ = null;

    this.isPlaying = false;
    this.isPaused = false;

    this.streamEventHandler_ = null;

    this.dataWindow_ = null;
    this.dtWindBdChildren_ = new Array();
    this.carousel_ = null;
    this.dataWindowShow_ = true;

    this.playDelegate = Function.createDelegate(this, this.play);
    this.stopDelegate = Function.createDelegate(this, this.stop);
    this.pauseDelegate = Function.createDelegate(this, this.pause);
    this.resumeDelegate = Function.createDelegate(this, this.resume);
    this.clearDelegate = Function.createDelegate(this, this.clear);
    this.minDelegate = Function.createDelegate(this, this.minDataWindow);
    this.maxDelegate = Function.createDelegate(this, this.maxDataWindow);

    $get("btnTracePlayerStartStop").innerText = "播放";
    $get("btnTracePlayerPause").innerText = "暂停";
    $get("btnTracePlayerMin").innerText = "最小化";

    $addHandler($get("btnTracePlayerMin"), "click", this.minDelegate);
    $addHandler($get("btnTracePlayerStartStop"), "click", this.playDelegate);
    $addHandler($get("btnTracePlayerPause"), "click", this.pauseDelegate);
    $addHandler($get("btnTracePlayerClear"), "click", this.clearDelegate);

    if (map_enable_trace_player == true) {
        $get("divTracePlayerCtrl").style.display = '';
    }
}
/**
* 轨迹中包含的数据类型，图片
*/
TracePlayer.CONTENT_TYPE_IMAGE = "image";
/**
* 轨迹中包含的数据库类型，视频
*/
TracePlayer.CONTENT_TYPE_VIDEO = "video";
/**
* 隐藏数据显示窗口，被隐藏后不会触发轨迹回放事件
*/
TracePlayer.prototype.minDataWindow = function() {
    $get("divTracePlayerDataWindowBody").style.display = "none";
    $get("divCarousel").style.display = "none";
    if ($get("carousel")) {
        $get("carousel").style.display = "none";
    } 

    $get("btnTracePlayerMin").innerText = "最大化";
    $removeHandler($get("btnTracePlayerMin"), "click", this.minDelegate);
    $addHandler($get("btnTracePlayerMin"), "click", this.maxDelegate);

    this.dataWindowShow_ = false;
}
/**
* 显示数据显示窗口
*/
TracePlayer.prototype.maxDataWindow = function() {
    $get("divTracePlayerDataWindowBody").style.display = "";
    $get("divCarousel").style.display = "";
    if ($get("carousel")) {
        $get("carousel").style.display = "";
    }

    $get("btnTracePlayerMin").innerText = "最小化";
    $removeHandler($get("btnTracePlayerMin"), "click", this.maxDelegate);
    $addHandler($get("btnTracePlayerMin"), "click", this.minDelegate);

    this.dataWindowShow_ = true;
}
/**
* 设置轨迹事件处理函数
* @param Function handler 其返回值定义为：[{src:String,type:String,title:String}]
*/
TracePlayer.prototype.setStreamEventHandler = function(handler) {
    this.streamEventHandler_ = null;
    this.streamEventHandler_ = handler;
}
/**
* 清除轨迹事件处理函数绑定
*/
TracePlayer.prototype.clearStreamEventHandler = function(handler) {
    this.streamEventHandler_ = null;
}
/**
* 从头开始播放轨迹
*/
TracePlayer.prototype.play = function() {
    if (!this.isPaused) {
        this.map.setCenter(new GLatLng(this.traceData[0].Lat, this.traceData[0].Lng), 14);
    }
    this.clear();
    var delegate = Function.createDelegate(this, function() {
        this.executePlay_();
    });
    this.timer_ = window.setInterval(delegate, 1000);
    this.isPlaying = true;

    $get("btnTracePlayerStartStop").innerText = "停止";
    $removeHandler($get("btnTracePlayerStartStop"), "click", this.playDelegate);
    $addHandler($get("btnTracePlayerStartStop"), "click", this.stopDelegate);

    $get("btnTracePlayerPause").disabled = false;
    $get("btnTracePlayerClear").disabled = true;

    this.showDataWindow_();
}
/**
* 执行播放操作的委托
*/
TracePlayer.prototype.executePlay_ = function() {
    if (this.pointer_ < this.traceData.length) {
        this.lineDrawer.draw(this.traceData[this.pointer_].Lat, this.traceData[this.pointer_].Lng);

        if (this.dataWindowShow_ == true
            && this.traceData[this.pointer_].data
            && Object.getTypeName(this.traceData[this.pointer_].data) == 'Array'
            && this.traceData[this.pointer_].data.length > 0) {
            if (this.streamEventHandler_) {
                var data = this.streamEventHandler_.handler.apply(this.streamEventHandler_.scope, [this.traceData[this.pointer_].data]);
                this.fillDataWindow_(data);
            }
        }

        this.pointer_++;
        if (this.pointer_ == this.traceData.length) {
            this.stop();
        }
    }
}
/**
* 显示数据窗口，这个窗口亦集成了轨迹播放器的控制面板
*/
TracePlayer.prototype.showDataWindow_ = function() {
    if (!this.dataWindow_) {
        this.dataWindow_ = new YAHOO.widget.Panel("divTracePlayerDataWindow", {
            width: "968px",
            fixedcenter: false,
            constraintoviewport: true,
            close: false,
            underlay: "none",
            visible: true,
            draggable: true
        });
        this.dataWindow_.setHeader($get("divTracePlayerCtrl"));
        this.dataWindow_.setBody("<div id='divTracePlayerDataWindowBody' style='width:100%;height:300px;margin:0px;'><div id='divCarousel'></div></div>");
        this.dataWindow_.render(document.body);
    }
    this.dataWindow_.show();
}
/**
* 将数据填充到数据窗口
* @param Array data 由setStreamEventHandler指定的handler的返回值
* @see setStreamEventHandler
*/
TracePlayer.prototype.fillDataWindow_ = function(data) {
    if (!data) {
        return;
    }
    this.pause();
    this.showCarousel_(data);
}
/**
* 创建图片数据展示控件
@param String Url
@param String title
*/
TracePlayer.prototype.createImageCtrl_ = function(url, title) {
    var img = new Image();
    img.title = title;
    img.src = url;
    img.style.width = 320;
    img.style.height = 240;
    var a = document.createElement("a");
    a.href = url;
    a.target = '_blank';
    a.appendChild(img);
    return a;
}
/**
* 创建视频数据展示控件
@param String Url
@param String title
*/
TracePlayer.prototype.createVideoCtrl_ = function(url, title) {
    var span = document.createElement("span");
    span.innerHTML = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' id='tracePlayerVideo' width='320' "
                        + "data='" + url + "'"
                        + "height='280' codebase='http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab'>"
                        + "<param name='movie' value='../../Resources/Swf/SimpleVideoPlay.swf?file=" + url + "' />"
                        + "<param name='quality' value='high' />"
                        + "<param name='bgcolor' value='#869ca7' />"
                        + "<param name='allowScriptAccess' value='sameDomain' />"
                        + "<embed src='../../Resources/Swf/SimpleVideoPlay.swf?file=" + url + "' "
                            + "quality='high' bgcolor='#869ca7' width='320' height='280' name='tracePlayerVideo' id='tracePlayerVideo' align='middle' "
                            + "play='true' loop='false' quality='high' allowscriptaccess='sameDomain' type='application/x-shockwave-flash' "
                            + "pluginspage='http://www.adobe.com/go/getflashplayer'></embed>"
                        + "</object>";
    return span;
}
/**
* 显示滚动展示控件
* @param Array data 由setStreamEventHandler指定的handler的返回值
* @see setStreamEventHandler
*/
TracePlayer.prototype.showCarousel_ = function(data) {
    if (this.carousel_) {
        var ctx = { this_: this, data: data };
        this.animTimer_ = window.setInterval(function() {
            if ($get("divCarousel") && $get("divCarousel").filters.alpha) {
                $get("divCarousel").filters.alpha.opacity -= 20;
                if ($get("divCarousel").filters.alpha.opacity <= 0) {
                    window.clearInterval(ctx.this_.animTimer_);
                    ctx.this_.createCarouselEx_(ctx.data);
                }
            } else {
                window.clearInterval(ctx.this_.animTimer_);
                ctx.this_.createCarouselEx_(ctx.data);
            }
        }, 50);
    } else {
        this.createCarouselEx_(data);
    }
}
/**
* 执行显示滚动展示控件操作的委托
* @param Array data 由setStreamEventHandler指定的handler的返回值
* @see setStreamEventHandler
*/
TracePlayer.prototype.createCarouselEx_ = function(data) {
    var dtBody = new YAHOO.util.Element("divTracePlayerDataWindowBody");
    dtBody.removeChild($get("divCarousel"));

    var ol = document.createElement("ol");
    ol.id = "carousel";
    var ctrl = null;
    var li = null;
    for (var i = 0; i < data.length; i++) {
        if (data[i].type == TracePlayer.CONTENT_TYPE_IMAGE) {
            ctrl = this.createImageCtrl_(data[i].src, data[i].title);
            li = document.createElement("li");
            li.className = "item";
            li.appendChild(ctrl);
            ol.appendChild(li);
        } else if (data[i].type == TracePlayer.CONTENT_TYPE_VIDEO) {
            ctrl = this.createVideoCtrl_(data[i].src, data[i].title);
            li = document.createElement("li");
            li.className = "item";
            li.appendChild(ctrl);
            ol.appendChild(li);
        }
    }
    var div = document.createElement("div");
    div.id = "divCarousel";
    div.appendChild(ol);
    dtBody.appendChild(div);

    delete this.carousel_;
    this.carousel_ = new YAHOO.widget.Carousel("divCarousel", {
        isCircular: true, animation: { speed: 0.5 }
    });
    $get("divCarousel").filters.alpha.opacity = 0;
    this.carousel_.render(); // get ready for rendering the widget
    this.carousel_.show();
    var ctx = this;
    this.animTimer_ = window.setInterval(function() {
        if ($get("divCarousel") && $get("divCarousel").filters.alpha) {
            $get("divCarousel").filters.alpha.opacity += 20;
            if ($get("divCarousel").filters.alpha.opacity >= 100) {
                window.clearInterval(ctx.animTimer_);
                ctx.resume();
            }
        } else {
            window.clearInterval(ctx.animTimer_);
            ctx.resume();
        }
    }, 50);
}
/**
* 暂停轨迹回放
*/
TracePlayer.prototype.pause = function() {
    window.clearInterval(this.timer_);
    $get("btnTracePlayerPause").innerText = "继续";
    $removeHandler($get("btnTracePlayerPause"), "click", this.pauseDelegate);
    $addHandler($get("btnTracePlayerPause"), "click", this.resumeDelegate);
    this.isPaused = true;
}
/**
* 恢复轨迹回放
*/
TracePlayer.prototype.resume = function() {
    var delegate = Function.createDelegate(this, function() {
        this.executePlay_();
    });
    this.timer_ = window.setInterval(delegate, 1000);
    this.isPaused = false;
    $get("btnTracePlayerPause").innerText = "暂停";
    $removeHandler($get("btnTracePlayerPause"), "click", this.resumeDelegate);
    $addHandler($get("btnTracePlayerPause"), "click", this.pauseDelegate);
}
/**
* 清除已经绘制的轨迹
*/
TracePlayer.prototype.clear = function() {
    this.lineDrawer.clear();
}
/**
* 停止回放轨迹
*/
TracePlayer.prototype.stop = function() {
    if (this.isPaused) {
        this.resume();
    }
    window.clearInterval(this.timer_);
    this.pointer_ = 0;

    this.isPlaying = false;

    $get("btnTracePlayerStartStop").innerText = "播放";
    $get("btnTracePlayerPause").disabled = true;
    $removeHandler($get("btnTracePlayerStartStop"), "click", this.stopDelegate);
    $addHandler($get("btnTracePlayerStartStop"), "click", this.playDelegate);
    $get("btnTracePlayerClear").disabled = false;
}