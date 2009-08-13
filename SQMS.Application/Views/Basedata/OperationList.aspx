<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OperationList.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OperationList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
<table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" ID="Button1" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="Button2" runat="server" Text="删除" OnClick="btnDelete_OnClick" /> 
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="gvList" runat="server" AllowPaging="True" Width="100%" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OPID" OnSorting="gvList_Sorting"
        EmptyDataText="没有可显示的数据记录。" 
        onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="30" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("OPID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("OPID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OPID" HeaderText="OPID" ReadOnly="True" 
                SortExpression="OPID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="OPID" HeaderStyle-HorizontalAlign="Left"
                DataNavigateUrlFormatString="/Views/Basedata/OperationView.aspx?p=operationview&id={0}" 
                DataTextField="OPNAME" HeaderText="操作名称" SortExpression="OPNAME" />
            <asp:BoundField DataField="OPCODE" HeaderText="操作编码" HeaderStyle-HorizontalAlign="Left"
                SortExpression="OPCODE" />       
            <asp:TemplateField HeaderText="状态" HeaderStyle-HorizontalAlign="Left" SortExpression="ISVOID">
                <ItemTemplate>
                    <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center"
                SelectText="编辑">
            <ItemStyle Width="60px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    <br />
    <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" ID="Button4" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="Button3" runat="server" Text="删除" OnClick="btnDelete_OnClick" />                    
                </fieldset>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
