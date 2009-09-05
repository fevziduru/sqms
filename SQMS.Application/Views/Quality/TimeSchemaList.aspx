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
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button1" runat="server" Text="删除" OnClick="btnDelete_OnClick" />&nbsp;&nbsp;
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <asp:GridView Width="100%" ID="gvList" runat="server" AllowPaging="True" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SCHEMAID" OnSorting="gvList_Sorting" PageSize="25"
        EmptyDataText="没有可显示的数据记录。" ShowFooter="true" 
        onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("SCHEMAID") %>' />
                </HeaderTemplate>
                <ItemTemplate>                
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("SCHEMAID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SCHEMAID" HeaderText="SCHEMAID" ReadOnly="True" SortExpression="SCHEMAID" Visible="False" />
            <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="SCHEMAID" ItemStyle-Width="120" 
                DataNavigateUrlFormatString="TimeSchemaView.aspx?p=tsedit&id={0}" 
                DataTextField="SCHEMANAME" HeaderText="时间模板名称" SortExpression="SCHEMANAME" />
            
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="FLOATTIME" HeaderText="浮动时间"  ItemStyle-Width="200" SortExpression="FLOATTIME" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="BEGINTIME" HeaderText="开始时间" SortExpression="BEGINTIME" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ENDTIME" HeaderText="结束时间" SortExpression="ENDTIME" />
            
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
                    <asp:Button Width="110px" CssClass="bgbutton" ID="Button4" runat="server" Text="删除" OnClick="btnDelete_OnClick" />&nbsp;&nbsp;
                </fieldset>
            </td>
        </tr>
    </table>
    </div>

</asp:Content>
