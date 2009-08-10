<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="RoleList.aspx.cs" Inherits="SQMS.Application.Views.Basedata.RoleList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gvList" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ROLEID" OnSorting="gvList_Sorting"
        EmptyDataText="没有可显示的数据记录。" 
        Width="829px" onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("ROLEID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("ROLEID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ROLEID" HeaderText="ROLEID" ReadOnly="True"  SortExpression="ROLEID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ROLEID" 
                DataNavigateUrlFormatString="/Views/Basedata/RoleView.aspx?id={0}"
                DataTextField="ROLENAME" HeaderText="角色名称" SortExpression="ROLENAME" />
            <asp:BoundField DataField="ROLECODE" HeaderText="角色编码"  SortExpression="ROLECODE" />  
            <asp:BoundField DataField="MEMO" HeaderText="角色备注"  SortExpression="MEMO" /> 
            <asp:TemplateField>
                <ItemTemplate>
                    <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowSelectButton="True" 
                SelectText="编辑">
            <ItemStyle Width="60px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    
    <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_OnClick" />

</asp:Content>
