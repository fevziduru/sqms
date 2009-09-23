<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true"
        CodeBehind="EmergencyEventEdit.aspx.cs" Inherits="SQMS.Application.Views.Quality.EmergencyEventEdit" %>

<%@ Register Src="../Components/PopupReference/PopupReference.ascx" TagName="PopupReference"
        TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script type="text/javascript" src="../../Resources/Scripts/Controls/TimeBox/TimeBox.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <script type="text/javascript">
                YAHOO.util.Event.onDOMReady(function()
                {

                        var Event = YAHOO.util.Event,
            Dom = YAHOO.util.Dom,
            dialog,
            calendar;

                        var showBtn = Dom.get("show");

                        Event.on(showBtn, "click", function()
                        {

                                // Lazy Dialog Creation - Wait to create the Dialog, and setup document click listeners, until the first time the button is clicked.
                                if (!dialog)
                                {

                                        // Hide Calendar if we click anywhere in the document other than the calendar
                                        Event.on(document, "click", function(e)
                                        {
                                                var el = Event.getTarget(e);
                                                var dialogEl = dialog.element;
                                                if (el != dialogEl && !Dom.isAncestor(dialogEl, el) && el != showBtn && !Dom.isAncestor(showBtn, el))
                                                {
                                                        dialog.hide();
                                                }
                                        });

                                        function resetHandler()
                                        {
                                                // Reset the current calendar page to the select date, or 
                                                // to today if nothing is selected.
                                                var selDates = calendar.getSelectedDates();
                                                var resetDate;

                                                if (selDates.length > 0)
                                                {
                                                        resetDate = selDates[0];
                                                } else
                                                {
                                                        resetDate = calendar.today;
                                                }

                                                calendar.cfg.setProperty("pagedate", resetDate);
                                                calendar.render();
                                        }

                                        function closeHandler()
                                        {
                                                dialog.hide();
                                        }

                                        dialog = new YAHOO.widget.Dialog("container", {
                                                visible: false,
                                                context: ["show", "tl", "bl"],
                                                //buttons: [{ text: "Reset", handler: resetHandler, isDefault: true }, { text: "Close", handler: closeHandler}],
                                                //buttons: [{ text: "Reset", handler: resetHandler, isDefault: true }],
                                                buttons: [],
                                                draggable: true,
                                                close: true
                                        });
                                        dialog.setHeader('选择时间');
                                        dialog.setBody('<div id="cal"></div>');
                                        dialog.render(document.body);

                                        dialog.showEvent.subscribe(function()
                                        {
                                                if (YAHOO.env.ua.ie)
                                                {
                                                        // Since we're hiding the table using yui-overlay-hidden, we 
                                                        // want to let the dialog know that the content size has changed, when
                                                        // shown
                                                        dialog.fireEvent("changeContent");
                                                }
                                        });
                                }

                                // Lazy Calendar Creation - Wait to create the Calendar until the first time the button is clicked.
                                if (!calendar)
                                {

                                        calendar = new YAHOO.widget.Calendar("cal", {
                                                iframe: false,          // Turn iframe off, since container has iframe support.
                                                hide_blank_weeks: true  // Enable, to demonstrate how we handle changing height, using changeContent
                                        });
                                        calendar.render();
                                        calendar.cfg.setProperty("MDY_YEAR_POSITION", 1);
                                        calendar.cfg.setProperty("MDY_MONTH_POSITION", 2);
                                        calendar.cfg.setProperty("MDY_DAY_POSITION", 3);

                                        calendar.cfg.setProperty("MY_YEAR_POSITION", 1);
                                        calendar.cfg.setProperty("MY_MONTH_POSITION", 2);


                                        // Date labels for Chinese locale
                                        calendar.cfg.setProperty("MONTHS_SHORT", ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]);
                                        calendar.cfg.setProperty("MONTHS_LONG", ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]);
                                        calendar.cfg.setProperty("WEEKDAYS_1CHAR", ["日", "一", "二", "三", "四", "五", "六"]);
                                        calendar.cfg.setProperty("WEEKDAYS_SHORT", ["日", "一", "二", "三", "四", "五", "六"]);
                                        calendar.cfg.setProperty("WEEKDAYS_MEDIUM", ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]);
                                        calendar.cfg.setProperty("WEEKDAYS_LONG", ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]);

                                        calendar.cfg.setProperty("MY_LABEL_YEAR_POSITION", 1);
                                        calendar.cfg.setProperty("MY_LABEL_MONTH_POSITION", 2);
                                        calendar.cfg.setProperty("MY_LABEL_YEAR_SUFFIX", "\u5E74");
                                        calendar.cfg.setProperty("MY_LABEL_MONTH_SUFFIX", "");
                                        calendar.selectEvent.subscribe(function()
                                        {
                                                if (calendar.getSelectedDates().length > 0)
                                                {

                                                        var selDate = calendar.getSelectedDates()[0];

                                                        // Pretty Date Output, using Calendar's Locale values: Friday, 8 February 2008
                                                        var wStr = calendar.cfg.getProperty("WEEKDAYS_LONG")[selDate.getDay()];
                                                        var dStr = selDate.getDate();
                                                        var mStr = calendar.cfg.getProperty("MONTHS_LONG")[selDate.getMonth()];
                                                        var yStr = selDate.getFullYear();

                                                        Dom.get("<%=checkTime.ClientID %>").value = yStr + "-" + mStr + "-" + dStr;
                                                } else
                                                {
                                                        Dom.get("<%=checkTime.ClientID %>").value = "";
                                                }
                                                dialog.hide();
                                        });

                                        calendar.renderEvent.subscribe(function()
                                        {
                                                // Tell Dialog it's contents have changed, which allows 
                                                // container to redraw the underlay (for IE6/Safari2)
                                                dialog.fireEvent("changeContent");
                                        });
                                }

                                var seldate = calendar.getSelectedDates();

                                if (seldate.length > 0)
                                {
                                        // Set the pagedate to show the selected date if it exists
                                        calendar.cfg.setProperty("pagedate", seldate[0]);
                                        calendar.render();
                                }

                                dialog.show();
                        });
                });
        </script>

        <div>
                <table style="width: 100%">
                        <tr>
                                <td align="right">
                                        <a href="EmergencyEventList.aspx?p=emergencylist">返回到列表</a>
                                </td>
                        </tr>
                        <tr>
                                <td align="center">
                                        <fieldset>
                                                <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click" />
                                                <asp:Button Width="110px" runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click" />
                                        </fieldset>
                                </td>
                        </tr>
                </table>
                <br />
                <fieldset>
                        <legend>紧急事件基本信息</legend>
                        <table style="width: 100%">
                                <tr>
                                        <td style="width: 110px">
                                                事件名称：
                                        </td>
                                        <td style="width: 330px">
                                                <asp:TextBox ID="txtEEName" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="width: 110px">
                                                事件编号：
                                        </td>
                                        <td style="width: 330px">
                                                <asp:TextBox ID="txtEECode" runat="server"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                检查单位：
                                        </td>
                                        <td>
                                                <asp:TextBox ID="txtEECHECKUNIT" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="width: 110px">
                                                监控时间段：
                                        </td>
                                        <td style="width: 330px">
                                                <uc1:PopupReference ID="refEESCHEMAID" Service="SQMS.Services.TimeSchemaService"
                                                        HeaderColumns="SCHEMAID:时间段编号,SCHEMANAME:时间段名称,ISVOID:时间段状态" KeyFieldName="时间段编号"
                                                        TextFieldName="时间段名称" KeyField="SCHEMAID" TextField="SCHEMANAME" SearchColumn="SCHEMANAME"
                                                        AssemblyName="SQMS.Services" runat="server" />
                                        </td>
                                </tr>
                                <tr>
                                        <td style="width: 110px">
                                                检查时间：
                                        </td>
                                        <td style="width: 330px">
                                                <asp:TextBox ID="checkTime" runat="server"></asp:TextBox>
                                                <button type="button" id="show" title="Show Calendar">
                                                        <img src="../../Resources/Scripts/Controls/yui/build/calendar/assets/calx.gif" width="18"
                                                                height="18" alt="Calendar"></button>
                                                <%--        <div id="txt100_main">
                                                                <input type="text" id="txt100" value="<%= strSTIME %>" name="tbSTIME" onchange="javascript:checkTime(this)"
                                                                        onblur="javascript:checkTime(this)" onfocus="javascript:showHint(this)" />
                                                                <div id="txt100_hint" style="z-index: 1000; display: none; position: absolute; border: #6B90DA 1px solid;
                                                                        background-color: #F0F7F9; vertical-align: middle; text-align: center">
                                                                        <span style="font-size: 10pt; vertical-align: absmiddle; text-align: center; padding: 30">
                                                                                时间格式为hh24(小时):mm(分钟):ss(秒)</span>
                                                                </div>
                                                                <div id="txt100_errinfo" style="z-index: 1000; display: none; position: absolute;
                                                                        border: #ff0000 1px solid; background-color: #FFEDDB">
                                                                        <span style="font-size: 10pt; vertical-align: absmiddle; padding: 30; text-align: center">
                                                                                时间格式不对,时间格式应为hh24(小时):mm(分钟):ss(秒)</span>
                                                                </div>
                                                        </div>--%>
                                        </td>
                                        <td style="width: 110px">
                                                事件负责人：
                                        </td>
                                        <td style="width: 330px">
                                                <uc1:PopupReference ID="refEMP" Service="SQMS.Services.EmployeeService" HeaderColumns="EMPID:职员编号,EMPNAME:职员名称,ISVOID:职员状态"
                                                        KeyFieldName="职员编号" TextFieldName="职员名称" KeyField="EMPID" TextField="EMPNAME"
                                                        SearchColumn="EMPNAME" AssemblyName="SQMS.Services" runat="server" />
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                优先级：
                                        </td>
                                        <td>
                                                <asp:DropDownList ID="ddlPRIVILIGE" runat="server">
                                                </asp:DropDownList>
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                &nbsp;
                                        </td>
                                        <td>
                                                <asp:CheckBox ID="cbIsvoid" runat="server" Text="禁用" />
                                        </td>
                                </tr>
                                <tr>
                                        <td>
                                                备注：
                                        </td>
                                        <td colspan="3">
                                                <asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" Height="181px" Width="488px"></asp:TextBox>
                                        </td>
                                </tr>
                        </table>
                </fieldset>
                <br />
                <table style="width: 100%">
                        <tr>
                                <td align="center">
                                        <fieldset>
                                                <asp:Button Width="110px" runat="server" ID="Button3" Text="保存" OnClick="btnSave_Click" />
                                                <asp:Button Width="110px" runat="server" ID="Button4" Text="保存并新增" OnClick="btnSaveAndNew_Click" />
                                        </fieldset>
                                </td>
                        </tr>
                </table>
        </div>
</asp:Content>
