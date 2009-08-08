<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="CompanyQualityMonitor.aspx.cs"
    Inherits="SQMS.Application.Views.Quality.CompanyQualityMonitor" MasterPageFile="~/Masters/Main.Master" %>

<%@ Register TagName="Map" TagPrefix="uc" Src="~/Views/Components/Map.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Dependencies -->
    <!-- Sam Skin CSS for TabView -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/tabview/assets/skins/sam/tabview.css">
    <!-- JavaScript Dependencies for Tabview: -->

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/element/element-min.js"></script>

    <!-- OPTIONAL: Connection (required for dynamic loading of data) -->

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/connection/connection-min.js"></script>

    <!-- Source file for TabView -->

    <script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/tabview/tabview-min.js"></script>

    <style type="text/css">
        .left
        {
            margin: 0 25 0 0px;
            width: 200px;
            float: left;
        }
        .right
        {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="divLeft" class="left">

            <script type="text/javascript">
                new YAHOO.widget.TabView("filter");
            </script>

            <div class="yui-skin-sam">
                <div id="filter" class="yui-navset">
                    <ul class="yui-nav">
                        <li class="selected"><a href="#tab1"><em>按项目</em></a></li>
                        <li><a href="#tab2"><em>按负责人</em></a></li>
                    </ul>
                    <div class="yui-content">
                        <asp:UpdatePanel ID="UpdatePanelProjectTree" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TreeView ID="TreeViewProject" runat="server" PopulateNodesFromClient="true"
                                    OnSelectedNodeChanged="TreeViewProject_SelectedNodeChanged">
                                </asp:TreeView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div id="divEmployeeFilter">
                            <div>
                                <span>负责人:</span><span><asp:DropDownList ID="DropDownListEmployee" runat="server">
                                </asp:DropDownList>
                                </span>
                            </div>
                            <div>
                                <span>路 段:</span><span><asp:DropDownList ID="DropDownListRegion" runat="server">
                                </asp:DropDownList>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div>
                    作业现场</div>
                <asp:UpdatePanel ID="UpdatePanelQualityPoint" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Table ID="TableQualityPoint" runat="server">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Text="片区监控点" />
                                <asp:TableHeaderCell Text="负责人" />
                            </asp:TableHeaderRow>
                        </asp:Table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div>
                <div>
                    监控点查询</div>
                <asp:UpdatePanel ID="UpdatePanelMonitorPointSearch" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <span>
                            <asp:TextBox ID="TextBoxPointSearch" runat="server"></asp:TextBox></span> <span>
                                <asp:Button runat="server" ID="ButtonPointSearch" Text="查询" OnClick="ButtonPointSearch_Click" /></span>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
</asp:Content>
