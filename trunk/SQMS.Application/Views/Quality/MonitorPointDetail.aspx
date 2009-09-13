<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="MonitorPointDetail.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.MonitorPointDetail" %>

<%@ Register TagName="PagingBar" TagPrefix="uc" Src="~/Views/Components/List/PagingBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <!-- Combo-handled YUI CSS files: -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/combo?2.7.0/build/reset-fonts-grids/reset-fonts-grids.css&2.7.0/build/base/base-min.css&2.7.0/build/assets/skins/sam/skin.css">
    <!-- Combo-handled YUI JS files: -->

    <script type="text/javascript" src="http://yui.yahooapis.com/combo?2.7.0/build/utilities/utilities.js&2.7.0/build/datasource/datasource-min.js&2.7.0/build/autocomplete/autocomplete-min.js&2.7.0/build/container/container-min.js&2.7.0/build/menu/menu-min.js&2.7.0/build/button/button-min.js&2.7.0/build/calendar/calendar-min.js&2.7.0/build/carousel/carousel-min.js&2.7.0/build/json/json-min.js&2.7.0/build/charts/charts-min.js&2.7.0/build/slider/slider-min.js&2.7.0/build/colorpicker/colorpicker-min.js&2.7.0/build/cookie/cookie-min.js&2.7.0/build/paginator/paginator-min.js&2.7.0/build/datatable/datatable-min.js&2.7.0/build/editor/editor-min.js&2.7.0/build/history/history-min.js&2.7.0/build/resize/resize-min.js&2.7.0/build/imagecropper/imagecropper-min.js&2.7.0/build/imageloader/imageloader-min.js&2.7.0/build/selector/selector-min.js&2.7.0/build/layout/layout-min.js&2.7.0/build/logger/logger-min.js&2.7.0/build/profiler/profiler-min.js&2.7.0/build/profilerviewer/profilerviewer-min.js&2.7.0/build/stylesheet/stylesheet-min.js&2.7.0/build/tabview/tabview-min.js&2.7.0/build/treeview/treeview-min.js&2.7.0/build/uploader/uploader.js&2.7.0/build/yuitest/yuitest-min.js"></script>

    <script type="text/javascript" src="../../Resources/Scripts/Controls/GoogleMap/Video.js"></script>

    <link rel="stylesheet" href="../../Resources/Scripts/Controls/LightBox2/css/lightbox.css"
        type="text/css" media="screen" />

    <script type="text/javascript" src="../../Resources/Scripts/Controls/LightBox2/prototype.js"></script>

    <script type="text/javascript" src="../../Resources/Scripts/Controls/LightBox2/scriptaculous.js?load=effects"></script>

    <script type="text/javascript" src="../../Resources/Scripts/Controls/LightBox2/lightbox.js"></script>

    <style type="text/css">
        body
        {
            margin: 0 0 0 0;
            font-size: 12px;
            text-align: left;
        }
        div table tr td th
        {
            font-size: 12px;
        }
        .top
        {
            background-color: Green;
        }
        .left
        {
            width: 200px;
            height: 650px;
            float: left;
        }
        .right
        {
        }
        /* Clear calendar's float, using dialog inbuilt form element */#container .bd form
        {
            clear: left;
        }
        /* Have calendar squeeze upto bd bounding box */#container .bd
        {
            padding: 0;
        }
        #container .hd
        {
            text-align: left;
        }
        /* Center buttons in the footer */#container .ft .button-group
        {
            text-align: center;
        }
        /* Prevent border-collapse:collapse from bleeding through in IE6, IE7 */#container_c.yui-overlay-hidden table
        { *display:none;}/* Remove calendar's border and set padding in ems instead of px, so we can specify an width in ems for the container */
        #cal
        {
            border: none;
            padding: 1em;
        }
        /* Datefield look/feel */.datefield
        {
            position: relative;
            top: 10px;
            left: 10px;
            white-space: nowrap;
            border: 1px solid black;
            background-color: #eee;
            width: 25em;
            padding: 5px;
        }
        .datefield input, .datefield button, .datefield label
        {
            vertical-align: middle;
        }
        .datefield label
        {
            font-weight: bold;
        }
        .datefield input
        {
            width: 15em;
        }
        .datefield button
        {
            padding: 0 5px 0 5px;
            margin-left: 2px;
        }
        .datefield button img
        {
            padding: 0;
            margin: 0;
            vertical-align: middle;
        }
        /* Example box */.box
        {
            position: relative;
            height: 5em;
        }
    </style>
</head>
<body class="yui-skin-sam">
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>

    <script type="text/javascript">
        var calendar = null;
        var currentInfoList = new Array();
        var mp = null;
        var myTabs = null;
        var dynamicTabMeta = [];
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) {
                return unescape(r[2]);
            }
            return "";
        }
        Sys.Application.add_load(function() {
            fetchMonitorPoint(getUrlParam("mpid"));
        });
        function fetchMonitorPoint(mpid) {
            var url = "/Views/AjaxServices/QualityControl/MonitorPoint.aspx?p=AjaxServicesQualityControlMonitorPoint&mpid=" + mpid;
            wRequest = new Sys.Net.WebRequest();
            Sys.Net.WebRequestManager.add_completedRequest(initPage);
            wRequest.set_url(url);
            Sys.Net.WebRequestManager.executeRequest(wRequest);
        }
        function initPage(executor, eventArgs) {
            if (executor.get_responseAvailable()) {
                if (executor.get_statusCode() == "200") {
                    var body = executor.get_responseData();
                    var mps = [];
                    try {
                        mps = Sys.Serialization.JavaScriptSerializer.deserialize(body);
                    }
                    catch (e) { };
                    if (mps && mps.length > 0) {
                        mp = mps[0];
                        initTabView(mp);
                        initCaledar();
                    }
                }
            }
        }
        function initTabView(mp) {
            myTabs = new YAHOO.widget.TabView("divTabs");
            if (mp.IsStart == true) {
                //巡检
                var tabCount = 0;
                var timeSpan = 0;
                if (mp.TimeSchema.Times > 0 && mp.TimeSchema.TimeSpan <= 0) {
                    //每两小时一个TAB
                    tabCount = Math.ceil(mp.TimeSchema.TimeAmount / 2);
                    timeSpan = 2;
                } else if (mp.TimeSchema.Times <= 0 && mp.TimeSchema.TimeSpan > 0) {
                    tabCount = Math.ceil(mp.TimeSchema.TimeAmount / mp.TimeSchema.TimeSpan);
                    timeSpan = mp.TimeSchema.TimeSpan;
                } else {
                    tabCount = Math.ceil(mp.TimeSchema.TimeAmount / mp.TimeSchema.TimeSpan);
                    timeSpan = mp.TimeSchema.TimeSpan;
                }
                var beginDate = new Date(mp.TimeSchema.BeginTime);
                var endDate = new Date(mp.TimeSchema.EndTime);
                var tabBeginTime = beginDate;
                for (var i = 0; i < tabCount; i++) {
                    var date = new Date();
                    date.setTime(tabBeginTime.getTime() + timeSpan * 60 * 60 * 1000);
                    if (date.getTime() > endDate.getTime()) {
                        date = endDate;
                    }

                    var beginHour = tabBeginTime.getHours();
                    var beginMin = tabBeginTime.getMinutes();
                    var beginSec = tabBeginTime.getSeconds();
                    var endHour = date.getHours();
                    var endMin = date.getMinutes();
                    var endSec = date.getSeconds();
                    var beginHourStr = (beginHour < 10) ? "0" + beginHour.toString() : beginHour.toString();
                    var beginMinStr = (beginMin < 10) ? "0" + beginMin.toString() : beginMin.toString();
                    var beginSecStr = (beginSec < 10) ? "0" + beginSec.toString() : beginSec.toString();
                    var endHourStr = (endHour < 10) ? "0" + endHour.toString() : endHour.toString();
                    var endMinStr = (endMin < 10) ? "0" + endMin.toString() : endMin.toString();
                    var endSecStr = (endSec < 10) ? "0" + endSec.toString() : endSec.toString();

                    var tab = new YAHOO.widget.Tab({
                        label: beginHourStr + ":" + beginMinStr + "-" + endHourStr + ":" + endMinStr,
                        content: '<iframe id="tabif' + i + '" name="tabif' + i + '" frameborder=0 width="100%" height="800"'
                        + ' src="/Views/Quality/AnchorContent.aspx?p=__pub__'
                        + '&type=_qc_type_dynamic'
                        + '&begintime=' + beginHourStr + ":" + beginMinStr + ":" + beginSecStr
                        + '&endtime=' + endHourStr + ":" + endMinStr + ":" + endSecStr
                        + '&mpid=' + mp.MonitorPointId + '">',
                        active: ((i == 0) ? true : false)
                    });
                    myTabs.addTab(tab);
                    dynamicTabMeta.push({ tab: tab, begin: tabBeginTime, end: date });
                    tabBeginTime = date;
                }
            } else {
                for (var i = 0; i < mp.TimeSchema.TimeItems.length; i++) {
                    myTabs.addTab(new YAHOO.widget.Tab({
                        label: mp.TimeSchema.TimeItems[i].TimeSpot,
                        content: '<iframe id="tabif' + i + '" name="tabif' + i + '" frameborder=0 width="100%" height="800"'
                        + ' src="/Views/Quality/AnchorContent.aspx?p=__pub__&timespot=' + mp.TimeSchema.TimeItems[i].TimeSpot
                        + '&type=' + mp.TimeSchema.TimeItems[i].TimeItemType
                        + '&mpid=' + mp.MonitorPointId
                        + '&timeitemid=' + mp.TimeSchema.TimeItems[i].TimeItemId + '">',
                        active: ((i == 0) ? true : false)
                    }));
                }
            }
            myTabs.addListener("activeTabChange", function(e) {
                $get("tabif" + myTabs.getTabIndex(e.newValue)).contentWindow.location.reload();
            });
            myTabs.appendTo(document.getElementById('divTabs'));

        }
        function calSelectedHandler(type, args, obj) {
            var dates = args[0];
            var date = dates[0];
            var year = date[0], month = date[1], day = date[2];
            $get("labelDate").innerText = year + "年" + month + "月" + day + "日";

            var url = "/Views/AjaxServices/QualityControl/QualityInfo.aspx?p=AjaxServicesQualityControlQualityInfo&mpid="
                    + getUrlParam("mpid") + "&type=" + getUrlParam("qcType") + "&begin_time=" + year + "-" + month + "-" + day;
            wRequest = new Sys.Net.WebRequest();
            Sys.Net.WebRequestManager.add_completedRequest(initQCList);
            wRequest.set_url(url);
            Sys.Net.WebRequestManager.executeRequest(wRequest);
        }
        function initQCList(executor, eventArgs) {
            if (executor.get_responseAvailable()) {
                if (executor.get_statusCode() == "200") {
                    var body = executor.get_responseData();
                    var qcInfos = [];
                    try {
                        qcInfos = Sys.Serialization.JavaScriptSerializer.deserialize(body);
                    }
                    catch (e) { };
                    if (qcInfos) {
                        var length1 = qcInfos.length;
                        currentInfoList.length = 0;
                        currentInfoList = qcInfos;
                        var imageContainer = new YAHOO.util.Element($get("divImages"));
                        var children = YAHOO.util.Dom.getChildren("divImages");
                        if (imageContainer) {
                            var length2 = children.length;
                            for (var i = 0; i < length2; i++) {
                                imageContainer.removeChild(children[i]);
                            }
                        }
                        for (var i = 0; i < length1; i++) {
                            var a = document.createElement("a");
                            a.href = qcInfos[i].Url;
                            a.rel = "lightbox";
                            if (imageContainer) {
                                imageContainer.appendChild(a);
                            }
                        }
                        lightbox1.initialize();
                    }
                }
            }
        }
        function initCaledar() {
            var Event = YAHOO.util.Event,
            Dom = YAHOO.util.Dom,
            dialog;

            var showBtn = Dom.get("btnOpenCal");

            Event.on(showBtn, "click", function() {

                // Lazy Dialog Creation - Wait to create the Dialog, and setup document click listeners, until the first time the button is clicked.
                if (!dialog) {

                    // Hide Calendar if we click anywhere in the document other than the calendar
                    Event.on(document, "click", function(e) {
                        var el = Event.getTarget(e);
                        var dialogEl = dialog.element;
                        if (el != dialogEl && !Dom.isAncestor(dialogEl, el) && el != showBtn && !Dom.isAncestor(showBtn, el)) {
                            dialog.hide();
                        }
                    });

                    function resetHandler() {
                        // Reset the current calendar page to the select date, or 
                        // to today if nothing is selected.
                        var selDates = calendar.getSelectedDates();
                        var resetDate;

                        if (selDates.length > 0) {
                            resetDate = selDates[0];
                        } else {
                            resetDate = calendar.today;
                        }

                        calendar.cfg.setProperty("pagedate", resetDate);
                        calendar.render();
                    }

                    function closeHandler() {
                        dialog.hide();
                    }

                    dialog = new YAHOO.widget.Dialog("container", {
                        visible: false,
                        context: ["show", "tl", "bl"],
                        buttons: [{ text: "Reset", handler: resetHandler, isDefault: true }, { text: "Close", handler: closeHandler}],
                        draggable: false,
                        close: true
                    });
                    dialog.setHeader('选择日期');
                    dialog.setBody('<div id="cal"></div>');
                    dialog.render("divCal");

                    dialog.showEvent.subscribe(function() {
                        if (YAHOO.env.ua.ie) {
                            // Since we're hiding the table using yui-overlay-hidden, we 
                            // want to let the dialog know that the content size has changed, when
                            // shown
                            dialog.fireEvent("changeContent");
                        }
                    });
                }

                // Lazy Calendar Creation - Wait to create the Calendar until the first time the button is clicked.
                if (!calendar) {

                    calendar = new YAHOO.widget.Calendar("cal", {
                        iframe: false,          // Turn iframe off, since container has iframe support.
                        hide_blank_weeks: true  // Enable, to demonstrate how we handle changing height, using changeContent
                    });
                    calendar.cfg.setProperty("MDY_YEAR_POSITION", 1);
                    calendar.cfg.setProperty("MDY_MONTH_POSITION", 2);
                    calendar.cfg.setProperty("MDY_DAY_POSITION", 3);

                    calendar.cfg.setProperty("MY_YEAR_POSITION", 1);
                    calendar.cfg.setProperty("MY_MONTH_POSITION", 2);


                    // Date labels for Chinese locale
                    calendar.cfg.setProperty("MONTHS_SHORT", ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]);
                    calendar.cfg.setProperty("MONTHS_LONG", ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]);
                    calendar.cfg.setProperty("WEEKDAYS_1CHAR", ["日", "一", "二", "三", "四", "五", "六"]);
                    calendar.cfg.setProperty("WEEKDAYS_SHORT", ["日", "一", "二", "三", "四", "五", "六"]);
                    calendar.cfg.setProperty("WEEKDAYS_MEDIUM", ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]);
                    calendar.cfg.setProperty("WEEKDAYS_LONG", ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]);

                    calendar.cfg.setProperty("MY_LABEL_YEAR_POSITION", 1);
                    calendar.cfg.setProperty("MY_LABEL_MONTH_POSITION", 2);
                    calendar.cfg.setProperty("MY_LABEL_YEAR_SUFFIX", "\u5E74");
                    calendar.cfg.setProperty("MY_LABEL_MONTH_SUFFIX", "");

                    calendar.selectEvent.subscribe(function() {
                        if (calendar.getSelectedDates().length > 0) {

                            var selDate = calendar.getSelectedDates()[0];

                            // Pretty Date Output, using Calendar's Locale values: Friday, 8 February 2008
                            var wStr = calendar.cfg.getProperty("WEEKDAYS_LONG")[selDate.getDay()];
                            var dStr = selDate.getDate();
                            var mStr = selDate.getMonth() + 1;
                            var yStr = selDate.getFullYear();

                            Dom.get("date").value = yStr + "年" + mStr + '月' + dStr + "日 " + wStr;


                            if (mp.IsStart == true) {
                                for (var i = 0; i < dynamicTabMeta.length; i++) {
                                    var tabif = $get("tabif" + i);
                                    if (tabif) {
                                        var beginHour = dynamicTabMeta[i].begin.getHours();
                                        var beginMin = dynamicTabMeta[i].begin.getMinutes();
                                        var beginSec = dynamicTabMeta[i].begin.getSeconds();
                                        var endHour = dynamicTabMeta[i].end.getHours();
                                        var endMin = dynamicTabMeta[i].end.getMinutes();
                                        var endSec = dynamicTabMeta[i].end.getSeconds();
                                        var beginHourStr = (beginHour < 10) ? "0" + beginHour.toString() : beginHour.toString();
                                        var beginMinStr = (beginMin < 10) ? "0" + beginMin.toString() : beginMin.toString();
                                        var beginSecStr = (beginSec < 10) ? "0" + beginSec.toString() : beginSec.toString();
                                        var endHourStr = (endHour < 10) ? "0" + endHour.toString() : endHour.toString();
                                        var endMinStr = (endMin < 10) ? "0" + endMin.toString() : endMin.toString();
                                        var endSecStr = (endSec < 10) ? "0" + endSec.toString() : endSec.toString();
                                        tabif.src = '/Views/Quality/AnchorContent.aspx?p=__pub__'
                                            + '&type=_qc_type_dynamic'
                                            + '&begintime=' + beginHourStr + ":" + beginMinStr + ":" + beginSecStr
                                            + '&endtime=' + endHourStr + ":" + endMinStr + ":" + endSecStr
                                            + '&mpid=' + mp.MonitorPointId
                                            + '&date=' + yStr + '-' + mStr + '-' + dStr;
                                    }
                                }
                            } else {
                                for (var i = 0; i < mp.TimeSchema.TimeItems.length; i++) {
                                    var tabif = $get("tabif" + i);
                                    if (tabif) {
                                        tabif.src = '/Views/Quality/AnchorContent.aspx?p=__pub__&timespot=' + mp.TimeSchema.TimeItems[i].TimeSpot
                                                + '&type=' + mp.TimeSchema.TimeItems[i].TimeItemType
                                                + '&mpid=' + mp.MonitorPointId
                                                + '&timeitemid=' + mp.TimeSchema.TimeItems[i].TimeItemId
                                                + '&date=' + yStr + '-' + mStr + '-' + dStr;
                                    }
                                }
                            }
                        } else {
                            Dom.get("date").value = "";
                        }


                        dialog.hide();
                    });
                    calendar.select(calendar.today);
                    calendar.render();
                    calendar.renderEvent.subscribe(function() {
                        // Tell Dialog it's contents have changed, which allows 
                        // container to redraw the underlay (for IE6/Safari2)
                        dialog.fireEvent("changeContent");
                    });
                }

                var seldate = calendar.getSelectedDates();

                if (seldate.length > 0) {
                    // Set the pagedate to show the selected date if it exists
                    calendar.cfg.setProperty("pagedate", seldate[0]);
                    calendar.render();
                }

                dialog.show();
            });
        }
    </script>

    <div>
        <!--监控点详细数据-->
        <div>
            <span>监控点名称：<asp:Label ID="LabelMPName" runat="server"></asp:Label></span><span><asp:Label
                ID="LabelMPCode" runat="server"></asp:Label></span></div>
        <div>
            所属项目：<asp:Label ID="LabelMPProject" runat="server"></asp:Label></div>
        <div>
            所属路段：<asp:Label ID="LabelMPRoad" runat="server"></asp:Label></div>
        <div>
            备注：<asp:Label ID="LabelMPMemo" runat="server"></asp:Label></div>
        <div>
            创建者：<asp:Label ID="LabelMPCreatedBy" runat="server"></asp:Label></div>
        <div>
            创建时间：<asp:Label ID="LabelMPCreated" runat="server"></asp:Label></div>
        <div>
            修改时间：<asp:Label ID="LabelMPModified" runat="server"></asp:Label></div>
        <div>
            修改者：<asp:Label ID="LabelMPModifiedBy" runat="server"></asp:Label></div>
    </div>
    <div class="box">
        <div class="datefield">
            <label for="date">
                日期:
            </label>
            <input type="text" id="date" name="date" value="" />
            <button type="button" id="btnOpenCal" title="选择日期">
                <img src="http://developer.yahoo.com/yui/examples/calendar/assets/calbtn.gif" width="18"
                    height="18" alt="Calendar"></button>
            <div id="divCal">
            </div>
        </div>
    </div>
    <div id="divTabs">
    </div>
    </form>
</body>
</html>
