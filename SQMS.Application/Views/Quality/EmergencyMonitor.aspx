﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyMonitor.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.EmergencyMonitor" MasterPageFile="~/Masters/Main.Master" %>

<%@ Register TagName="Map" TagPrefix="uc" Src="~/Views/Components/Map.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/fonts/fonts-min.css" />
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/calendar/assets/skins/sam/calendar.css" />

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/calendar/calendar-min.js"></script>

    <style type="text/css">
        body
        {
            margin: 0 0 0 0;
        }
        div table tr td
        {
            font-size: 12px;
        }
        .left
        {
            position: relative;
            width: 19%; /*height: 650px;*/
            float: left;
        }
        .right
        {
            float: right;
            position: relative;
            display: inline;
            width: 80%;
        }
        .Freezing
        {
            position: relative;
            table-layout: fixed;
            top: expression(this.offsetParent.scrollTop);
            z-index: 10;
        }
        .Freezing th
        {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            padding: 1px;
            z-index: 10;
        }
        table.side_block fieldset
        {
            width: 150px;
        }
        table.side_list
        {
            height: 300px;
            overflow-x: hidden;
            overflow-y: auto;
        }
        table.side_list th
        {
            width: 74px;
        }
        table.side_list td
        {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            white-space: normal; !important;}</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="divLeft" class="left side_block">
            <div>
                <fieldset>
                    <legend>事件列表</legend>
                    <div>
                        <div>
                            <!---TODO:弹出式日历控件，按日期过滤应急事件-->
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
                            <asp:HiddenField ID="HiddenEventDateFilter" runat="server" OnValueChanged="HiddenEventDateFilter_ValueChanged" />
                        </div>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanelEvents" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="GridViewEvents" runat="server" AllowPaging="True" Width="100%"
                                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EVENTID" EmptyDataText="没有可显示的数据记录。"
                                    OnRowDataBound="GridViewEvents_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="事件">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkBtnEventName" runat="server" Text='<%#Eval("EVENTNAME") %>'
                                                    OnCommand="LinkBtnEventName_Command" CommandArgument='<%#Eval("EVENTID") %>'
                                                    OnClientClick='setToEvent("<%#Eval("EVENTID") %>","<%#Eval("STARTMPID") %>")'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EMPNAME" HeaderText="负责人" ReadOnly="True" HeaderStyle-HorizontalAlign="Left">
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </fieldset>
                <br />
            </div>
            <fieldset>
                <legend>监控视频</legend>
                <div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" Visible="false">
                            <ContentTemplate>
                                <!---监控视频长度查询-->
                                视频长度
                                <select>
                                    <option value=">">大于</option>
                                    <option value="">=">大于或等于</option>
                                    <option value="=">等于</option>
                                    <option value="<=">小于或等于</option>
                                    <option value="<">小于</option>
                                </select>
                                <input type="text" value="5" style="width: 35px;" />分钟
                                <asp:HiddenField ID="HiddenVideoFilter" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanelVideoList" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridViewVideo" runat="server" AllowPaging="True" Width="100%" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="VIDEOID" EmptyDataText="没有可显示的数据记录。">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="视频名称">
                                        <ItemTemplate>
                                            <a href="javascript:openVideo(&quot;<%#Eval("VIDEOID") %>&quot;,&quot;<%#Eval("VIDEONAME") %>&quot;,true)">
                                                <%#Eval("VIDEONAME") %></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CREATEDBY" HeaderText="长度" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </fieldset>
        </div>
        <div id="right" class="right">
            <asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <uc:Map ID="Map1" runat="server" MPType="Event" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">
        var calendar = null;
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

                            Dom.get("date").value = yStr + "年" + mStr + '月' + dStr + "日";

                            Dom.get("<%=this.HiddenEventDateFilter.ClientID %>").value = yStr + "-" + mStr + '-' + dStr;
                            __doPostBack('<%=this.HiddenEventDateFilter.ClientID.Replace("_","$") %>', '');

                        } else {
                            Dom.get("date").value = "";
                        }


                        dialog.hide();
                    });

                    //var initSelectedDate = calendar.today ;
                    //calendar.select(initSelectedDate);

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

            var initSelDate = new Date();

            Dom.get("date").value = initSelDate.format('yyyy年MM月dd日');

        }
        Sys.Application.add_load(initCaledar);
    </script>

</asp:Content>
