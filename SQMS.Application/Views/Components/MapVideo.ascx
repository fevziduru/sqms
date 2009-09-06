<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MapVideo.ascx.cs" Inherits="SQMS.Application.Views.Components.MapVideo" %>
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset-fonts-grids/reset-fonts-grids.css&2.7.0/build/base/base-min.css&2.7.0/build/assets/skins/sam/skin.css" />

<script type="text/javascript" src="http://yui.yahooapis.com/combo?2.7.0/build/utilities/utilities.js&2.7.0/build/datasource/datasource-min.js&2.7.0/build/autocomplete/autocomplete-min.js&2.7.0/build/container/container-min.js&2.7.0/build/menu/menu-min.js&2.7.0/build/button/button-min.js&2.7.0/build/calendar/calendar-min.js&2.7.0/build/carousel/carousel-min.js&2.7.0/build/json/json-min.js&2.7.0/build/charts/charts-min.js&2.7.0/build/slider/slider-min.js&2.7.0/build/colorpicker/colorpicker-min.js&2.7.0/build/cookie/cookie-min.js&2.7.0/build/paginator/paginator-min.js&2.7.0/build/datatable/datatable-min.js&2.7.0/build/editor/editor-min.js&2.7.0/build/history/history-min.js&2.7.0/build/resize/resize-min.js&2.7.0/build/imagecropper/imagecropper-min.js&2.7.0/build/imageloader/imageloader-min.js&2.7.0/build/selector/selector-min.js&2.7.0/build/layout/layout-min.js&2.7.0/build/logger/logger-min.js&2.7.0/build/profiler/profiler-min.js&2.7.0/build/profilerviewer/profilerviewer-min.js&2.7.0/build/stylesheet/stylesheet-min.js&2.7.0/build/tabview/tabview-min.js&2.7.0/build/treeview/treeview-min.js&2.7.0/build/uploader/uploader.js&2.7.0/build/yuitest/yuitest-min.js"></script>

<script type="text/javascript" src="/Resources/Scripts/Controls/GoogleMap/MapVideo.js"></script>

<div id="mapVideoContainer" class="yui-skin-sam">
    <div id="mapVideo"></div>
</div>

<script type="text/javascript">
    (function() {
        var v = new MapVideo();
        v.width = <%=this.Width %>;
        v.height = <%=this.Height %>;
        v.videoWidth = <%=this.VideoWidth %>;
        v.videoHeight = <%=this.VideoHeight %>;

        v.sourceByVideoId = <%=(this.SourceByVideoId ? "true":"false") %>;
        v.externVideoUrl = "<%=this.ExternVideoUrl %>";
        v.autoPlay = <%=(this.AutoPlay ? "true":"false") %>;

        v.videoId ="<%=this.VideoId %>";
        v.drawTrace = <%=(this.DrawTrace ? "true":"false") %>;
        
        v.render();
        
        MapVideoManager.addInstance("<%=this.ClientID %>",v);
    })();
</script>

