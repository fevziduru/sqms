<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectList.aspx.cs" Inherits="SQMS.Application.Views.Project.ProjectList" MasterPageFile="~/Masters/Main.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td align="center">
                    <fieldset>
                        <button id="btnNew" onclick="location.href='ProjectEdit.aspx?p=projectnew';" style="width:110px;">新增</button>&nbsp;&nbsp;
                        <asp:Button Width="110px" ID="ButtonDelete1" runat="server" Text="删除" OnClick="ButtonDelete_Click" />
                    </fieldset>
                </td>
            </tr>
        </table>
        <br />
        <asp:UpdatePanel ID="UpdatePanelGridViewProject" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="GridViewProject" runat="server" AllowPaging="True" Width="100%" AllowSorting="False"
                    AutoGenerateColumns="False" DataKeyNames="ProjectID" EmptyDataText="没有可显示的数据记录。"
                    OnPageIndexChanging="GridViewProject_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                            <HeaderTemplate>
                                <input name="header" onclick='SelectAll("<%=this.GridViewProject.ClientID %>")' type="checkbox"
                                    value='<%#Eval("ProjectID") %>' />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input name="__KeyValues__" type="checkbox" value='<%#Eval("ProjectID") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProjectID" HeaderText="项目ID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                            SortExpression="ProjectID" Visible="False">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                         <asp:HyperLinkField DataNavigateUrlFields="PROJECTID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                DataNavigateUrlFormatString="/Views/Project/ProjectView.aspx?p=projectview&id={0}" 
                DataTextField="PROJECTNAME" HeaderText="项目名称" SortExpression="PROJECTNAME" />
                        
                        <asp:BoundField DataField="ProjectCODE" HeaderText="项目编码" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left" SortExpression="ProjectCODE">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TOTALSCALE" HeaderText="总规模" ItemStyle-HorizontalAlign="Left"
                            HeaderStyle-HorizontalAlign="Left">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            <HeaderTemplate>
                                操作</HeaderTemplate>
                            <ItemTemplate>
                                <a href="ProjectEdit.aspx?p=projectedit&id=<%# Eval("ProjectID") %>">编辑</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

