<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeList" %>
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
    <asp:GridView ID="gvEmployeeList" runat="server" AllowPaging="True"  Width="100%"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EMPID" OnSorting="gvEmployeeList_Sorting"
        EmptyDataText="没有可显示的数据记录。" 
         onrowcommand="GridView1_RowCommand" 
        onpageindexchanging="gvEmployeeList_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvEmployeeList.ClientID %>")' type="checkbox" value='<%#Eval("EMPID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("EMPID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EMPID" HeaderText="EMPID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                SortExpression="EMPID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="EMPID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                DataNavigateUrlFormatString="/Views/Basedata/EmployeeView.aspx?p=employeeview&id={0}" 
                DataTextField="EMPNAME" HeaderText="职员名称" SortExpression="EMPNAME" />
            <asp:BoundField DataField="EMPCODE" HeaderText="职员编码"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                SortExpression="EMPCODE" />
            <asp:BoundField DataField="EMPSTATUS" HeaderText="状态"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" 
                SortExpression="EMPSTATUS" />
            <asp:BoundField DataField="MOBILE" HeaderText="移动电话" SortExpression="MOBILE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="JOBTITLE" HeaderText="职位"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                SortExpression="JOBTITLE" />
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
                    <asp:Button Width="110px" ID="Button3" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" ID="Button4" runat="server" Text="删除" OnClick="btnDelete_OnClick" />
                </fieldset>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
