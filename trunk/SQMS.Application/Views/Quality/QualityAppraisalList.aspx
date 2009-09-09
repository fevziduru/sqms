<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="QualityAppraisalList.aspx.cs" Inherits="SQMS.Application.Views.Quality.QualityAppraisalList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="100%">
        <tr>
                <td align="right">监控类型：<asp:DropDownList ID="ddlMonitorType" runat="server" Width="210" AutoPostBack="true" onselectedindexchanged="ddlMonitorType_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
</table>
<asp:GridView ID="gvList" runat="server" AllowPaging="True"  Width="100%" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QMID" OnSorting="gvList_Sorting"
        EmptyDataText="当前监控点没有质量数据"  ShowFooter="true"
         onrowcommand="GridView1_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("QMID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("QMID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="QMID" HeaderText="QMID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                SortExpression="QMID" Visible="False" />
            <asp:BoundField DataField="QMCODE" HeaderText="质控编码"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="QMCODE" />
            <asp:BoundField DataField="CHARGEPERSON" HeaderText="责任人"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="CHARGEPERSON" />
            <asp:BoundField DataField="EMERGENCYPERSON" HeaderText="应急处理责任人" SortExpression="ENMERGENCYPERSION" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="CHECKPERSON" HeaderText="巡查员"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="CHECKPERSON" />
            <asp:BoundField DataField="ORGNAME" HeaderText="作业单位"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="WORKUNIT" />
            <asp:BoundField DataField="LONGITUDE" HeaderText="采集点经度"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="LONGITUDE" />
            <asp:BoundField DataField="LATITUDE" HeaderText="采集点纬度"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="LATITUDE" />
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" SelectText="选择" HeaderText="质量评估" HeaderStyle-HorizontalAlign="Center">
                <ItemStyle Width="80px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle CssClass="footer" />
    </asp:GridView>
</asp:Content>
