<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="MonitorPointDetail.aspx.cs"
        Inherits="SQMS.Application.Views.Quality.MonitorPointDetail" %>

<%@ Register TagName="PagingBar" TagPrefix="uc" Src="~/Views/Components/List/PagingBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        </style>
</head>
<body>
        <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <script type="text/javascript">
                var cal1 = null;
                var currentInfoList = new Array();
                var lightbox1 = null;
                function getUrlParam(name) {
                        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                        var r = window.location.search.substr(1).match(reg);
                        if (r != null) {
                                return unescape(r[2]);
                        }
                        return "";
                }
                Sys.Application.add_load(function() {
                        var myTabs = new YAHOO.widget.TabView("divTabs");
                        initCaledar();
                        lightbox1 = new Lightbox();
                });
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
                        cal1 = new YAHOO.widget.Calendar("divCal", { START_WEEKDAY: 1, MULTI_SELECT: false });

                        // Correct formats for Chinese: dd.mm.yyyy, dd.mm, mm.yyyy
                        cal1.cfg.setProperty("MDY_YEAR_POSITION", 1);
                        cal1.cfg.setProperty("MDY_MONTH_POSITION", 2);
                        cal1.cfg.setProperty("MDY_DAY_POSITION", 3);

                        cal1.cfg.setProperty("MY_YEAR_POSITION", 1);
                        cal1.cfg.setProperty("MY_MONTH_POSITION", 2);


                        // Date labels for Chinese locale
                        cal1.cfg.setProperty("MONTHS_SHORT", ["一月", "二月", "三月", "五月", "六月", "七月", "八月", "八月", "九月", "十月", "十一月", "十二月"]);
                        cal1.cfg.setProperty("MONTHS_LONG", ["一月", "二月", "三月", "五月", "六月", "七月", "八月", "八月", "九月", "十月", "十一月", "十二月"]);
                        cal1.cfg.setProperty("WEEKDAYS_1CHAR", ["日", "一", "二", "三", "四", "五", "六"]);
                        cal1.cfg.setProperty("WEEKDAYS_SHORT", ["日", "一", "二", "三", "四", "五", "六"]);
                        cal1.cfg.setProperty("WEEKDAYS_MEDIUM", ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]);
                        cal1.cfg.setProperty("WEEKDAYS_LONG", ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]);

                        cal1.cfg.setProperty("MY_LABEL_YEAR_POSITION", 1);
                        cal1.cfg.setProperty("MY_LABEL_MONTH_POSITION", 2);
                        cal1.cfg.setProperty("MY_LABEL_YEAR_SUFFIX", "\u5E74");
                        cal1.cfg.setProperty("MY_LABEL_MONTH_SUFFIX", "");

                        cal1.selectEvent.subscribe(calSelectedHandler, cal1, true);
                        cal1.select(cal1.today);
                        cal1.render();
                }
        </script>

        <div class="yui-skin-sam">
                <div id="divTabs" class="yui-navset">
                        <ul class="yui-nav">
                                <li class="selected"><a href="#tab1"><em>监控点信息</em></a></li>
                                <li><a href="#tab2"><em>图片监控数据</em></a></li>
                                <li><a href="#tab3"><em>视频监控数据</em></a></li>
                        </ul>
                        <div class="yui-content">
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
                                <div>
                                        <div class="top">
                                                <div>
                                                        <label id="labelDate">
                                                        </label>
                                                </div>
                                                <div id="divCal">
                                                </div>
                                                <div id="divImages">
                                                </div>
                                        </div>
                                        <div id="divLeft" class="left" style="display: none;">
                                                <div>
                                                        <!--时间段过滤器-->
                                                        <div>
                                                                起始时间：<asp:TextBox ID="TextBoxBeginTime" runat="server"></asp:TextBox></div>
                                                        <div>
                                                                <asp:RegularExpressionValidator ID="REVBeginTime" ValidationExpression="^[\d]{4}-[\d]{2}-[\d]{2} [\d]{2}:[\d]{2}:[\d]{2}$"
                                                                        runat="server" ErrorMessage="起始时间格式不正确，正确格式如：2009-08-10 09:01:08" ControlToValidate="TextBoxBeginTime"></asp:RegularExpressionValidator></div>
                                                        <div>
                                                                截止时间：<asp:TextBox ID="TextBoxEndTime" runat="server"></asp:TextBox></div>
                                                        <div>
                                                                <asp:RegularExpressionValidator ID="REVEndTime" ValidationExpression="^[\d]{4}-[\d]{2}-[\d]{2} [\d]{2}:[\d]{2}:[\d]{2}$"
                                                                        runat="server" ErrorMessage="截止时间格式不正确，正确格式如：2009-08-10 09:01:08" ControlToValidate="TextBoxEndTime"></asp:RegularExpressionValidator></div>
                                                        <div>
                                                                <asp:UpdatePanel ID="UpdatePanelSearchBtn" runat="server">
                                                                        <ContentTemplate>
                                                                                <asp:Button ID="BtnSearch" runat="server" Text="查询" OnClick="BtnSearch_Click" />
                                                                        </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                        </div>
                                                </div>
                                                <div>
                                                        <!--QC数据列表，分为常态和巡检两个tab-->
                                                        <div id="divQcType">
                                                                <asp:HiddenField ID="HiddenFieldQcType" runat="server" />
                                                                <input type="radio" name="raidoQcType" id="raidoQcTypeNormal" checked="checked" onclick="document.getElementById('<%=this.HiddenFieldQcType.ClientID %>').value='_qc_type_normal';document.getElementById('divQcTypeNormal').style.display='';document.getElementById('divQcTypeDynamic').style.display='none';" /><label
                                                                        for="raidoQcTypeNormal">常态监控</label>
                                                                <input type="radio" name="raidoQcType" id="raidoQcTypeDynamic" onclick="document.getElementById('<%=this.HiddenFieldQcType.ClientID %>').value='_qc_type_dynamic';document.getElementById('divQcTypeNormal').style.display='none';document.getElementById('divQcTypeDynamic').style.display='';" /><label
                                                                        for="raidoQcTypeDynamic">巡检数据</label>
                                                        </div>
                                                        <div id="divQcTypeNormal">
                                                                <asp:UpdatePanel ID="UpdatePanelQcListNormal" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                                <asp:GridView ID="GridViewQcNormal" runat="server" AutoGenerateColumns="false">
                                                                                        <Columns>
                                                                                                <asp:TemplateField HeaderText="采集时间">
                                                                                                        <ItemTemplate>
                                                                                                                <asp:LinkButton ID="LnkBtnQc" runat="server" Text='<%# Eval("CREATED") %>' CommandArgument='<%# Eval("QMID") %>'
                                                                                                                        OnCommand="LnkBtnQc_Command"></asp:LinkButton>
                                                                                                        </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="采集者">
                                                                                                        <ItemTemplate>
                                                                                                                <asp:Label ID="LabelQcCreatedBy" runat="server"></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                        </Columns>
                                                                                </asp:GridView>
                                                                        </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                        </div>
                                                        <div id="divQcTypeDynamic" style="display: none">
                                                                <asp:UpdatePanel ID="UpdatePanelQcListDynamic" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                                <asp:GridView ID="GridViewQcDynamic" runat="server" AutoGenerateColumns="false">
                                                                                        <Columns>
                                                                                                <asp:TemplateField HeaderText="采集时间">
                                                                                                        <ItemTemplate>
                                                                                                                <asp:LinkButton ID="LnkBtnQc" runat="server" Text='<%# Eval("CREATED") %>' CommandArgument='<%# Eval("QMID") %>'
                                                                                                                        OnCommand="LnkBtnQc_Command"></asp:LinkButton>
                                                                                                        </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="采集者">
                                                                                                        <ItemTemplate>
                                                                                                                <asp:Label ID="LabelQcCreatedBy" runat="server"></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                        </Columns>
                                                                                </asp:GridView>
                                                                        </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                        </div>
                                                </div>
                                        </div>
                                        <div id="right" class="right" style="display: none;">
                                                <!--QC详细数据-->
                                                <asp:UpdatePanel ID="UpdatePanelQcInfo" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                                <div>
                                                                        <asp:HyperLink ID="LinkImageSource" runat="server" Target="_blank"></asp:HyperLink></div>
                                                                <div>
                                                                        <span><span>数据采集时间：</span><span><asp:Label ID="LabelDataFetchTime" runat="server"></asp:Label></span></span></div>
                                                                <div>
                                                                        <span><span>类型：</span><span><asp:Label ID="LabelQCType" runat="server"></asp:Label></span></span></div>
                                                                <div>
                                                                        <span><span>状态：</span><span><asp:Label ID="LabelQCState" runat="server"></asp:Label></span></span></div>
                                                                <div>
                                                                        <span><span>责任人：</span><span><asp:Label ID="LabelDutyMan" runat="server"></asp:Label></span></span></div>
                                                                <div>
                                                                        <span><span>巡查员：</span><span><asp:Label ID="LabelPatrolMan" runat="server"></asp:Label></span></span></div>
                                                                <div>
                                                                        <span><span>应急处理责任人：</span><span><asp:Label ID="LabelEmergencyMan" runat="server"></asp:Label></span></span></div>
                                                        </ContentTemplate>
                                                </asp:UpdatePanel>
                                        </div>
                                </div>
                                <div>
                                        <div class="left">
                                                <asp:GridView ID="GridViewVideo" runat="server" AllowPaging="True" Width="100%" AllowSorting="True"
                                                        AutoGenerateColumns="False" DataKeyNames="VIDEOID" EmptyDataText="暂时没有视频监控记录。">
                                                        <Columns>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="名称">
                                                                        <ItemTemplate>
                                                                                <a href="javascript:openVideo(&quot;<%#Eval("VIDEOID") %>&quot;,&quot;<%#Eval("VIDEONAME") %>&quot;,false,true)">
                                                                                        <%#Eval("VIDEONAME") %></a>
                                                                        </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="CREATEDBY" HeaderText="拍摄者" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" />
                                                        </Columns>
                                                </asp:GridView>
                                        </div>
                                        <div class="right">
                                                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="MapVideo" width="320"
                                                        height="280" codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
                                                        <param name="movie" value="../../Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf" />
                                                        <param name="quality" value="high" />
                                                        <param name="bgcolor" value="#869ca7" />
                                                        <param name="allowScriptAccess" value="sameDomain" />
                                                        <embed src="../../Resources/Scripts/Controls/GoogleMap/VideoPlayer/MapVideo.swf"
                                                                quality="high" bgcolor="#869ca7" width="320" height="280" name="MapVideo"
                                                                align="middle" play="true" loop="false" quality="high" allowscriptaccess="sameDomain"
                                                                type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer"></embed>
                                                </object>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
        </form>

        <script type="text/javascript">
                function getQueryValue(name) {
                        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                        var r = window.location.search.substr(1).match(reg);
                        if (r != null) {
                                return unescape(r[2]);
                        }
                        return "";
                }
                var qcType = getQueryValue("qcType");
                if (qcType == "_qc_type_dynamic") {
                        document.getElementById("raidoQcTypeDynamic").setAttribute("checked", "checked");
                        document.getElementById('divQcTypeNormal').style.display = 'none';
                        document.getElementById('divQcTypeDynamic').style.display = '';
                }
        </script>

</body>
</html>
