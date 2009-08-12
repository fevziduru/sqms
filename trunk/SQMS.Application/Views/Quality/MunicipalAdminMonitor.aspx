<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MunicipalAdminMonitor.aspx.cs" Inherits="SQMS.Application.Views.Quality.MunicipalAdminMonitor"  MasterPageFile="~/Masters/Main.Master"%>

<%@ Register TagName="Map" TagPrefix="uc" Src="~/Views/Components/Map.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body
        {
            margin:0 0 0 0;
        }
        div table tr td
        {
            font-size: 12px;
        }
        .left
        {
            position:relative;
            width: 19%;
            height: 650px;
            float: left;
        }
        .right
        {
            float:right;
            position: relative; 
            display:inline;
            width:80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="divLeft" class="left">
            <div>
                <div>
                    项目</div>
                <div>
                    <asp:UpdatePanel ID="UpdatePanelProjectManager" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <span>环卫公司:</span><span><asp:DropDownList ID="DropDownListProjectManager" 
                                runat="server" AutoPostBack="true" 
                                onselectedindexchanged="DropDownListProjectManager_SelectedIndexChanged">
                            </asp:DropDownList>
                            </span>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanelProjectTree" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TreeView ID="TreeViewProject" runat="server" PopulateNodesFromClient="true"
                                OnSelectedNodeChanged="TreeViewProject_SelectedNodeChanged">
                            </asp:TreeView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div>
                <div>
                    监控点列表</div>
                <asp:UpdatePanel ID="UpdatePanelQualityPoint" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Table ID="TableQualityPoint" runat="server">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell Text="监控点" />
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
