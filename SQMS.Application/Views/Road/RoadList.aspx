<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="RoadList.aspx.cs" Inherits="SQMS.Application.Views.Road.RoadList"
    MasterPageFile="~/Masters/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td align="center">
                    <fieldset>
                        <button id="btnNew" onclick="location.href='RoadEdit.aspx?p=RoadRoadNew';" style="width:110px;">新增</button>&nbsp;&nbsp;
                        <asp:Button Width="110px" ID="ButtonDelete1" runat="server" Text="删除" OnClick="ButtonDelete_Click" />
                    </fieldset>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="UpdatePanelGridViewRoad" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridViewRoad" runat="server" AllowPaging="True" Width="100%" AllowSorting="False"
                    AutoGenerateColumns="False" DataKeyNames="ROADID" EmptyDataText="没有可显示的数据记录。"
                    OnPageIndexChanging="GridViewRoad_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                <input name="header" onclick='SelectAll("<%=this.GridViewRoad.ClientID %>")' type="checkbox"
                                    value='<%#Eval("ROADID") %>' />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input name="__KeyValues__" type="checkbox" value='<%#Eval("ROADID") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ROADID" HeaderText="路段ID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ROADID" Visible="False">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ROADNAME" HeaderText="路段名称" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ROADNAME">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ROADCODE" HeaderText="路段编码" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="ROADCODE">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ROADTYPE" HeaderText="路段类型" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="ROADTYPE">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ISVOID" HeaderText="是否禁用" SortExpression="ISVOID" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            <HeaderTemplate>
                                操作</HeaderTemplate>
                            <ItemTemplate>
                                <a href="RoadEdit.aspx?p=RoadRoadEdit&id=<%# Eval("ROADID") %>">编辑</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
