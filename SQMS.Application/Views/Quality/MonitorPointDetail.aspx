<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="MonitorPointDetail.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.MonitorPointDetail" %>

<%@ Register TagName="PagingBar" TagPrefix="uc" Src="~/Views/Components/List/PagingBar.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Dependencies -->
    <!-- Sam Skin CSS for TabView -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
    <!-- JavaScript Dependencies for Tabview: -->

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/element/element-min.js"></script>

    <!-- OPTIONAL: Connection (required for dynamic loading of data) -->

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/connection/connection-min.js"></script>

    <!-- Source file for TabView -->

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/tabview/tabview-min.js"></script>

    <!-- Source file -->

    <script src="http://yui.yahooapis.com/2.7.0/build/imageloader/imageloader-min.js"></script>

    <script type="text/javascript" src="../../Resources/Scripts/Controls/GoogleMap/Video.js"></script>

    <style type="text/css">
        body
        {
            margin: 0 0 0 0;
            font-size: 12px;
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
        var myTabs = new YAHOO.widget.TabView("divTabs");
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
                    <div id="divImages"></div>
                    </div>
                    <div id="divLeft" class="left">
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
                    <div id="right" class="right">
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
                                quality="high" bgcolor="#869ca7" width="320" height="280" name="MapVideo" align="middle"
                                play="true" loop="false" quality="high" allowscriptaccess="sameDomain" type="application/x-shockwave-flash"
                                pluginspage="http://www.adobe.com/go/getflashplayer"></embed>
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
