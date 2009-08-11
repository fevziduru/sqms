<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="gvEmployeeList" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EMPID" OnSorting="gvEmployeeList_Sorting"
        EmptyDataText="没有可显示的数据记录。" 
        Width="829px" onrowcommand="GridView1_RowCommand" 
        onpageindexchanging="gvEmployeeList_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvEmployeeList.ClientID %>")' type="checkbox" value='<%#Eval("EMPID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("EMPID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EMPID" HeaderText="EMPID" ReadOnly="True" 
                SortExpression="EMPID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="EMPID" 
                DataNavigateUrlFormatString="/Views/Basedata/EmployeeView.aspx?p=employeeview&id={0}" 
                DataTextField="EMPNAME" HeaderText="职员名称" SortExpression="EMPNAME" />
            <asp:BoundField DataField="EMPCODE" HeaderText="职员编码" 
                SortExpression="EMPCODE" />
            <asp:BoundField DataField="EMPSTATUS" HeaderText="状态" 
                SortExpression="EMPSTATUS" />
            <asp:BoundField DataField="MOBILE" HeaderText="移动电话" SortExpression="MOBILE" />
            <asp:BoundField DataField="JOBTITLE" HeaderText="职位" 
                SortExpression="JOBTITLE" />
            <asp:CommandField ShowSelectButton="True" 
                SelectText="编辑">
            <ItemStyle Width="60px" />
            </asp:CommandField>
        </Columns>
    </asp:GridView>
    
    <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_OnClick" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnNew" runat="server" Text="新增" onclick="btnNew_Click" />
</asp:Content>
