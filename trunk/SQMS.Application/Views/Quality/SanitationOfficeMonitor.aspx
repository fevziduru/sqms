<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SanitationOfficeMonitor.aspx.cs" Inherits="SQMS.Application.Views.Quality.SanitationOfficeMonitor" MasterPageFile="~/Masters/Main.Master" %>

<%@ Register TagName="Map" TagPrefix="uc" Src="~/Views/Components/Map.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
            width: 19%;
            height: 650px;
            float: left;
        }
        .right
        {
            float: right;
            position: relative;
            display: inline;
            width: 80%;
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
            <div style="height: 300px; overflow: auto;">
                <div>
                    作业现场</div>
                <asp:UpdatePanel ID="UpdatePanelQualityPoint" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewMP" runat="server" AllowPaging="False" Width="100%"
                            AutoGenerateColumns="False" DataKeyNames="MPID" 
                            EmptyDataText="没有可显示的数据记录。" onrowdatabound="GridViewMP_RowDataBound">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="片区监控点">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnkBtnMPName" runat="server" Text='<%#Eval("MPNAME") %>' OnCommand="lnkBtnMP_Command"
                                            CommandArgument='<%#Eval("MPID") %>' OnClientClick='setToMarker("<%#Eval("MPID") %>","<%#Eval("MPNAME") %>",<%#Eval("LATITUDE") %>,<%#Eval("LONGITUDE") %>,<%#Eval("MPLEVEL") %>,true,true)'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EMPNAME" HeaderText="负责人" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" />
                            </Columns>
                        </asp:GridView>
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
            <div>
                <div>
                    视频数据</div>
                <asp:UpdatePanel ID="UpdatePanelVideoList" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridViewVideo" runat="server" AllowPaging="True" Width="100%" AllowSorting="True"
                            AutoGenerateColumns="False" DataKeyNames="VIDEOID" EmptyDataText="没有可显示的数据记录。">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="名称">
                                    <ItemTemplate>
                                        <a href="javascript:openVideo(&quot;<%#Eval("VIDEOID") %>&quot;,&quot;<%#Eval("VIDEONAME") %>&quot;,true)"><%#Eval("VIDEONAME") %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CREATEDBY" HeaderText="拍摄者" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" />
                            </Columns>
                        </asp:GridView>
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