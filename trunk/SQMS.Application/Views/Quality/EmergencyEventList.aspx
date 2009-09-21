<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmergencyEventList.aspx.cs" Inherits="SQMS.Application.Views.Quality.EmergencyEventList" %>

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
    <asp:GridView ID="gvEEList" runat="server" AllowPaging="True"  Width="100%" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EVENTID" OnSorting="gvEmployeeList_Sorting"
        EmptyDataText="没有可显示的数据记录。"  ShowFooter="true"
         onrowcommand="GridView1_RowCommand" 
        onpageindexchanging="gvEmployeeList_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvEEList.ClientID %>")' type="checkbox" value='<%#Eval("EVENTID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("EVENTID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="EVENTID" HeaderText="事件编号" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                SortExpression="EVENTID" Visible="False" />
                
            <asp:HyperLinkField DataNavigateUrlFields="EVENTNAME" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                DataNavigateUrlFormatString="/Views/Quality/EmergencyEventView.aspx?p=eeview&id={0}" 
                DataTextField="EVENTNAME" HeaderText="事件名称" SortExpression="EVENTNAME" />
                
            <%--<asp:BoundField DataField="PRIVILIGE" HeaderText="优先级"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="PRIVILIGE" />--%>
            
            <asp:TemplateField HeaderText="优先级"　SortExpression="PRIVILIGE" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <span><%# Service.GetReferenceValue("ENUMNAME", "ENUMERATION", "ENUMID", Eval("PRIVILIGE").ToString()) %></span>
                </ItemTemplate>
            </asp:TemplateField>
                
            <asp:BoundField DataField="CHECKUNIT" HeaderText="检查单位" SortExpression="CHECKUNIT" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
 
             <asp:TemplateField HeaderText="状态"　SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                </ItemTemplate>
            </asp:TemplateField>
                
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center"
                SelectText="编辑">
            <ItemStyle Width="60px" />
            </asp:CommandField>
            
        </Columns>
        <FooterStyle CssClass="footer" />
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
