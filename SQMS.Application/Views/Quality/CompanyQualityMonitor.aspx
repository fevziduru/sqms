<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="CompanyQualityMonitor.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.CompanyQualityMonitor" MasterPageFile="~/Masters/Main.Master" %>

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
            white-space:normal;!important;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="divLeft" class="left side_block">
            <div>
                <fieldset>
                    <legend>项目</legend>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanelProjectManager" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <span>负责人:</span><span><asp:DropDownList ID="DropDownListProjectManager" runat="server"
                                    AutoPostBack="true" OnSelectedIndexChanged="DropDownListProjectManager_SelectedIndexChanged">
                                </asp:DropDownList>
                                </span>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanelProjectTree" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TreeView ShowLines="true" ID="TreeViewProject" runat="server" PopulateNodesFromClient="true"
                                    OnSelectedNodeChanged="TreeViewProject_SelectedNodeChanged">
                                </asp:TreeView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </fieldset>
                <br />
            </div>
            <fieldset>
                <legend>监控点</legend>
                <div>
                    <asp:UpdatePanel ID="UpdatePanelQualityPoint" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridViewMP" runat="server" AllowPaging="False" Width="100%" AutoGenerateColumns="False"
                                HeaderStyle-CssClass="Freezing" CssClass="gridview side_list" DataKeyNames="MPID" EmptyDataText="没有可显示的数据记录。"
                                OnRowDataBound="GridViewMP_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="片区监控点">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LnkBtnMPName" runat="server" Text='<%#Eval("MPNAME") %>' OnCommand="lnkBtnMP_Command"
                                                CommandArgument='<%#Eval("MPID") %>' OnClientClick='setToMarker("<%#Eval("MPID") %>","<%#Eval("MPNAME") %>",<%#Eval("LATITUDE") %>,<%#Eval("LONGITUDE") %>,<%#Eval("MPLEVEL") %>,true,true,{isStart:"<%# Eval("ISSTART") %>"})'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EMPNAME" HeaderText="负责人" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"/>
                                </Columns>
                            </asp:GridView>
                            <%--<asp:Table ID="TableQualityPoint" runat="server">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Text="片区监控点" />
                                <asp:TableHeaderCell Text="负责人" />
                            </asp:TableHeaderRow>
                        </asp:Table>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </fieldset>
            <div>
                <fieldset>
                    <legend>监控点查询</legend>
                    <asp:UpdatePanel ID="UpdatePanelMonitorPointSearch" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <span>
                                <asp:TextBox ID="TextBoxPointSearch" runat="server"></asp:TextBox></span> <span>
                                    <asp:Button runat="server" ID="ButtonPointSearch" Text="查询" OnClick="ButtonPointSearch_Click" /></span>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
            </div>
            <br />
            <div>
                <fieldset>
                    <legend>视频数据</legend>
                    <asp:UpdatePanel ID="UpdatePanelVideoList" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridViewVideo" runat="server" AllowPaging="True" Width="100%" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="VIDEOID" EmptyDataText="没有可显示的数据记录。">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="名称">
                                        <ItemTemplate>
                                            <a href="javascript:openVideo(&quot;<%#Eval("VIDEOID") %>&quot;,&quot;<%#Eval("VIDEONAME") %>&quot;,true)">
                                                <%#Eval("VIDEONAME") %></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CREATEDBY" HeaderText="拍摄者" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
            </div>
            <br />
            <div>
                <fieldset style="text-align: center; vertical-align: absmiddle">
                    <legend>历史查询</legend>
                    <div id="divCalSideContainer" class="yui-skin-sam">
                        <div id="divCalSide">
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div id="right" class="right">
            <asp:UpdatePanel ID="UpdatePanelMap" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <uc:Map ID="Map1" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">
        var calSide = null;
        Sys.Application.add_load(function() {
            calSide = new YAHOO.widget.Calendar("divCalSide", {
                iframe: false,          // Turn iframe off, since container has iframe support.
                hide_blank_weeks: true  // Enable, to demonstrate how we handle changing height, using changeContent
            });
            calSide.cfg.setProperty("MDY_YEAR_POSITION", 1);
            calSide.cfg.setProperty("MDY_MONTH_POSITION", 2);
            calSide.cfg.setProperty("MDY_DAY_POSITION", 3);

            calSide.cfg.setProperty("MY_YEAR_POSITION", 1);
            calSide.cfg.setProperty("MY_MONTH_POSITION", 2);


            // Date labels for Chinese locale
            calSide.cfg.setProperty("MONTHS_SHORT", ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]);
            calSide.cfg.setProperty("MONTHS_LONG", ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]);
            calSide.cfg.setProperty("WEEKDAYS_1CHAR", ["日", "一", "二", "三", "四", "五", "六"]);
            calSide.cfg.setProperty("WEEKDAYS_SHORT", ["日", "一", "二", "三", "四", "五", "六"]);
            calSide.cfg.setProperty("WEEKDAYS_MEDIUM", ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]);
            calSide.cfg.setProperty("WEEKDAYS_LONG", ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]);

            calSide.cfg.setProperty("MY_LABEL_YEAR_POSITION", 1);
            calSide.cfg.setProperty("MY_LABEL_MONTH_POSITION", 2);
            calSide.cfg.setProperty("MY_LABEL_YEAR_SUFFIX", "\u5E74");
            calSide.cfg.setProperty("MY_LABEL_MONTH_SUFFIX", "");

            calSide.selectEvent.subscribe(function() {
                if (calSide.getSelectedDates().length > 0) {
                    var selDate = calSide.getSelectedDates()[0];

                    // Pretty Date Output, using calSide's Locale values: Friday, 8 February 2008
                    var wStr = calSide.cfg.getProperty("WEEKDAYS_LONG")[selDate.getDay()];
                    var dStr = selDate.getDate();
                    var mStr = selDate.getMonth() + 1;
                    var yStr = selDate.getFullYear();

                    var url = "";
                    if (true == currentClickedMarker.fields.IsStart) {
                        url = "/Views/Quality/MonitorPointDetail.aspx?qcType=_qc_type_dynamic&mpid=" + currentClickedMarker.mpId + "&date=" + yStr + "-" + mStr + "-" + dStr;
                    } else if (false == currentClickedMarker.fields.IsStart) {
                        url = "/Views/Quality/MonitorPointDetail.aspx?qcType=_qc_type_normal&mpid=" + currentClickedMarker.mpId + "&date=" + yStr + "-" + mStr + "-" + dStr;
                    }

                    var divMore = document.getElementById("divMoreInfo1");
                    var iframeMore = document.getElementById("iframeMoreInfo1");

                    if (!divMore) {
                        var closeMoreText = document.createTextNode("关闭");
                        var lnkMoreClose = document.createElement('a');
                        lnkMoreClose.href = "javascript:void(0);";
                        lnkMoreClose.setAttribute("title", "");
                        lnkMoreClose.appendChild(closeMoreText);
                        var divMoreClose = document.createElement('div');
                        divMoreClose.style.cssText = "text-align:right;";
                        divMoreClose.appendChild(lnkMoreClose);
                        divMore = document.createElement('div');
                        divMore.id = "divMoreInfo1";
                        divMore.style.cssText = 'margin:0;' +
		                    'padding:0;' +
		                    'border:0;' +
		                    'background-color:#4D81BD;' +
		                    'background-image:none;';
                        divMore.style.position = "absolute";
                        divMore.style.top = "0px";
                        divMore.style.left = "0px";
                        divMore.style.width = "100%";
                        divMore.style.zIndex = 9999;
                        divMore.appendChild(divMoreClose);
                        document.body.appendChild(divMore);

                        $addHandler(lnkMoreClose, "click", function() {
                            this.parentElement.parentElement.style.display = 'none';
                        });
                    }
                    if (!iframeMore) {
                        iframeMore = document.createElement('iframe');
                        iframeMore.id = "iframeMoreInfo1";
                        iframeMore.frameborder = 0;
                        iframeMore.style.width = "100%";
                        divMore.appendChild(iframeMore);
                    }

                    if (divMore.style.display == 'none') {
                        divMore.style.display = '';
                    }
                    divMore.style.height = window.screen.availHeight;
                    iframeMore.style.height = window.screen.availHeight;
                    iframeMore.src = url;

                }
            });
            calSide.render();
        });
    </script>

</asp:Content>
