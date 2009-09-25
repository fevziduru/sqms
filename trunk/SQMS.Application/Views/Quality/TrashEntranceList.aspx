<%@ Page Title="" Language="C#" EnableViewStateMac="false" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TrashEntranceList.aspx.cs" Inherits="SQMS.Application.Views.Quality.TrashEntranceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
<table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" ID="Button2" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="Button1" runat="server" Text="删除" OnClick="btnDelete_OnClick" />
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <asp:GridView Width="100%" ID="gvList" runat="server" AllowPaging="True" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MPID" OnSorting="gvList_Sorting" PageSize="25"
        EmptyDataText="没有可显示的数据记录。" 
        onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("MPID") %>' />
                </HeaderTemplate>
                <ItemTemplate>                
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("MPID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MPID" HeaderText="MPID" ReadOnly="True" SortExpression="MPID" Visible="False" />
            <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="MPID" 
                DataNavigateUrlFormatString="/Views/Quality/TrashEntranceView.aspx?p=trashentranceview&id={0}" 
                DataTextField="MPNAME" HeaderText="渣口名称" SortExpression="MPNAME" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="IMPORTANCE" HeaderText="重要性" SortExpression="IMPORTANCE" />    
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="LONGITUDE" HeaderText="经度" SortExpression="LONGITUDE" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="LATITUDE" HeaderText="纬度" SortExpression="LATITUDE" />
            
            <asp:TemplateField HeaderText="状态" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">                
                <ItemTemplate>
                    <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" SelectText="编辑">
                <ItemStyle Width="60px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <br />
   
    <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" ID="Button3" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="Button4" runat="server" Text="删除" OnClick="btnDelete_OnClick" />
                </fieldset>
            </td>
        </tr>
    </table>
     </div>

</asp:Content>
