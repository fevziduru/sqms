<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TimeSchemaList.aspx.cs" Inherits="SQMS.Application.Views.Quality.TimeSchemaList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button2" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button1" runat="server" Text="禁用" OnClick="btnDelete_OnClick" />&nbsp;&nbsp;
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button5" runat="server" Text="启用" OnClick="btnActive_OnClick" />
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <asp:GridView Width="100%" ID="gvList" runat="server" AllowPaging="True" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RESID" OnSorting="gvList_Sorting" PageSize="25"
        EmptyDataText="没有可显示的数据记录。" ShowFooter="true" 
        onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("RESID") %>' />
                </HeaderTemplate>
                <ItemTemplate>                
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("RESID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RESID" HeaderText="RESID" ReadOnly="True" SortExpression="RESID" Visible="False" />
            <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="RESID" ItemStyle-Width="120" 
                DataNavigateUrlFormatString="/Views/Basedata/ResourceView.aspx?p=resview&id={0}" 
                DataTextField="RESNAME" HeaderText="时间模板名称" SortExpression="RESNAME" />
            
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="RESIDENTITY" HeaderText="时间模板11"  ItemStyle-Width="200" SortExpression="RESIDENTITY" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="VIEWNAME" HeaderText="时间模板22" SortExpression="VIEWNAME" />
            
            <asp:TemplateField HeaderText="状态" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="80">
                <ItemTemplate>
                    <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" SelectText="编辑">
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
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button3" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button4" runat="server" Text="禁用" OnClick="btnDelete_OnClick" />&nbsp;&nbsp;
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button6" runat="server" Text="启用" OnClick="btnActive_OnClick" />
                </fieldset>
            </td>
        </tr>
    </table>
    </div>

</asp:Content>
