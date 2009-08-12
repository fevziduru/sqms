<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EquipmentList.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EquipmentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
<table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" ID="Button1" runat="server" Text="删除" OnClick="btnDelete_OnClick" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="Button2" runat="server" Text="新增" onclick="btnNew_Click" />
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <asp:GridView Width="100%" ID="gvList" runat="server" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EQUID" OnSorting="gvList_Sorting" PageSize="25"
        EmptyDataText="没有可显示的数据记录。" 
        onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="50px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("EQUID") %>' />
                </HeaderTemplate>
                <ItemTemplate>                
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("EQUID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EQUID" HeaderText="EQUID" ReadOnly="True" SortExpression="EQUID" Visible="False" />
            <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="EQUID" 
                DataNavigateUrlFormatString="/Views/Basedata/EquipmentView.aspx?p=equview&id={0}" 
                DataTextField="EQUNAME" HeaderText="设备名称" SortExpression="EQUNAME" />
                
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="IDENTIFY" HeaderText="设备标识" SortExpression="IDENTIFY" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="EQUCODE" HeaderText="设备编码" SortExpression="EQUCODE" />
            
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
                    <asp:Button Width="110px" ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_OnClick" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="btnNew" runat="server" Text="新增" onclick="btnNew_Click" />
                </fieldset>
            </td>
        </tr>
    </table>
     </div>
</asp:Content>
