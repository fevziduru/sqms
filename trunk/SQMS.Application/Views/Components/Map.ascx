<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Map.ascx.cs" Inherits="SQMS.Application.Views.Components.Map" %>

<script type="text/javascript" src="../../Resources/Scripts/Common/cookie.js"></script>

<script src=" http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAA41EnQa1wtzf10JQz5YdqmRQ6hbvwoS9GD89j9qEqTKobihdwiBTS_QjMbHbdYwkxWiBA-XpSkWHt_w&hl=zh-CN"
    type="text/javascript" charset="utf-8"></script>

<script src="../../Resources/Scripts/Controls/GoogleMap/MarkerManager.js" type="text/javascript"></script>

<script src="../../Resources/Scripts/Controls/GoogleMap/Marker.js" type="text/javascript"></script>

<script type="text/javascript" src="../../Resources/Scripts/Controls/GoogleMap/Map.js"></script>

<script type="text/javascript" src="../../Resources/Scripts/Controls/GoogleMap/Video.js"></script>

<script type="text/javascript" src="../../Resources/Scripts/Controls/GoogleMap/PolyLineDrawer.js"></script>

<script type="text/javascript" src="../../Resources/Scripts/Controls/GoogleMap/TracePlayer.js"></script>

<!-- Sam Skin CSS -->
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/container/assets/skins/sam/container.css" />
<link rel="stylesheet" type="text/css" href="../../Resources/Scripts/Controls/yui/build/assets/skins/sam/carousel.css" />
<!-- Dependencies -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<!-- OPTIONAL: Animation (only required if using ContainerEffect) -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/animation/animation-min.js"></script>

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/carousel/carousel-min.js"></script>

<!-- OPTIONAL: Drag & Drop (only required if enabling Drag & Drop) -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/dragdrop/dragdrop-min.js"></script>

<!-- Source file -->

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/container/container-min.js"></script>

<style type="text/css">
    img
    {
        border: none;
    }
    #divCarousel
    {
        font-size: 13px;
        margin: 0 auto;
    }
    #divCarousel a
    {
        text-decoration: none;
    }
    #divCarousel .item
    {
        border: none;
        display: inline;
        overflow: hidden;
    }
    .yui-skin-sam .yui-carousel
    {
        border: none;
    }
    .yui-skin-sam .yui-carousel-nav
    {
        background: none;
        text-align: right;
        padding: 0px;
        margin: 0px;
    }
    .yui-skin-sam .yui-panel .bd
    {
        padding: 0px;
    }
    .yui-skin-sam .yui-panel .bd
    {
    
    }
    #divCarousel
    {
        filter:alpha(opacity=100);
    }
    #divTracePlayerCtrl span
    {
        margin-right:730px;
    }
</style>
<div>
    <div class="yui-skin-sam">
        <div id="videoPanel">
            <div class="hd">
            </div>
            <div class="bd">
                <div id="divVideo">
                </div>
            </div>
        </div>
    </div>
</div>
<div id="map_canvas" style="height: 600px;">
</div>
<div>
    <fieldset>
        <legend>当前选中监控点</legend>
        <div id="divCurrSelMPPath">
        </div>
    </fieldset>
</div>
<%--<div>
        <span>经纬度:</span> <span id="spanLatLng" style="width: 300px;"></span><span>缩放级别:</span>
        <span id="spanZoomLevel"></span>&nbsp;&nbsp;<span>请求次数:</span><span id="spanRequestNum">
        </span>
</div>--%>
<%--<div id="divLog" style="overflow: auto;display:none;">
</div>--%>
<div id="divTracePlayerCtrl" style='display: none;zoom:1;'>
    <span>轨迹回放</span>
    <button type="button" id="btnTracePlayerMin">最小化</button>
    <button type="button" id="btnTracePlayerStartStop">
        开始</button>
    <button type="button" id="btnTracePlayerPause">
        暂停</button>
    <button type="button" id="btnTracePlayerClear" disabled="disabled">
        清除</button>
</div>
<div style="width: 100%">
    <div id="divMaxInfoWindowTitle">
    </div>
    <div id="divMaxInfoWindowContent">
    </div>
</div>

<script type="text/javascript">
    var markers = new Object();
    var map = null;
    var requestNum = 0;
    var currentClickedMarker = null;
    var prevClickedMarkerMeta = {mpId:"",iconUrl:""};
    var autoFetchMarker = <%=(this.AutoFetchMarker ? "true" : "false") %>;
    var initLat = <%=this.InitLatLng.Lat %>;
    var initLng = <%=this.InitLatLng.Lng %>;
    var mpType = '<%=this.MPTypeString%>';
    var map_enable_trace_player = <%=((this.EnableTracePlayer == true) ? "true" : "false")%>;
</script>

