<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="RoadList.aspx.cs" Inherits="SQMS.Application.Views.Road.RoadList"
    MasterPageFile="~/Masters/Main.Master" %>

<%@ Register TagName="PagingBar" TagPrefix="uc" Src="~/Views/Components/List/PagingBar.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td align="center">
                    <fieldset>
                        <asp:Button Width="110px" ID="ButtonNew1" runat="server" Text="新增" OnClick="ButtonNew_Click" />&nbsp;&nbsp;
                        <asp:Button Width="110px" ID="ButtonDelete1" runat="server" Text="删除" OnClick="ButtonDelete_Click" />
                    </fieldset>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="UpdatePanelGridViewRoad" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridViewRoad" runat="server" AllowPaging="True" Width="100%" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="ROADID" EmptyDataText="没有可显示的数据记录。"
                    OnRowCommand="GridViewRoad_RowCommand" OnSorting="GridViewRoad_Sorting">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                <input name="header" onclick='SelectAll("<%=this.GridViewRoad.ClientID %>")' type="checkbox"
                                    value='<%#Eval("ROADID") %>' />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input name="__KeyValues__" type="checkbox" value='<%#Eval("ROADID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ROADID" HeaderText="路段ID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ROADID" Visible="False" />
                        <asp:BoundField DataField="ROADNAME" HeaderText="路段名称" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ROADNAME" />
                        <asp:BoundField DataField="ROADCODE" HeaderText="路段编码" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="ROADCODE" />
                        <asp:BoundField DataField="ROADTYPE" HeaderText="路段类型" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="ROADTYPE" />
                        <asp:BoundField DataField="ISVOID" HeaderText="是否禁用" SortExpression="ISVOID" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left" />
                        <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" SelectText="编辑">
                            <ItemStyle Width="60px" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <table style="width: 100%">
            <tr>
                <td align="center">
                    <fieldset>
                        <uc:PagingBar ID="Pagingbar1" runat="server" />
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
