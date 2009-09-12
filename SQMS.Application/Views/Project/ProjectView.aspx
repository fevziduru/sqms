<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="ProjectView.aspx.cs" Inherits="SQMS.Application.Views.Project.ProjectView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
        <table width="100%">
        <tr>
            <td align="right"><a href="EmployeeList.aspx?p=employeelist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button4" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
        <fieldset>
            <legend>项目基本信息</legend>
            <table style="width: 100%">
            <tr>
                    <td>项目名称：</td>
                    <td><asp:Label ID="lblProjectName" runat="server" ></asp:Label></td>
                    <td>项目编码：</td>
                    <td><asp:Label ID="lblProjectCode" runat="server" ></asp:Label></td>
                </tr>
                <tr>
                    <td>负责人：</td>
                    <td><asp:Label ID="lblChargePerson" runat="server" ></asp:Label></td>
                    <td>助理人数：</td>
                    <td><asp:Label ID="lblAssistAmount" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        组长人数：
                    </td>
                    <td>
                        <asp:Label ID="lblLeaderAmount" runat="server"></asp:Label>
                    </td>
                    <td>
                        副组长人数：
                    </td>
                    <td>
                        <asp:Label ID="lblViseleaderAmount" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        总工人数：
                    </td>
                    <td>
                        <asp:Label ID="lblTotalWorkerAmount" runat="server"></asp:Label>
                    </td>
                    <td>
                        总作业时间：
                    </td>
                    <td>
                        <asp:Label ID="lblTotalWorkTime" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                       总规模：
                    </td>
                    <td>
                        <asp:Label ID="lblTotalScale" runat="server"></asp:Label>
                    </td>
                    <td>
                        状态：
                    </td>
                    <td>
                        <asp:Label ID="lblIsVoid" runat="server" Text="禁用" />
                    </td>
                </tr>
                <tr>
                    <td>
                        备注：
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblMemo" runat="server" />
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <fieldset>
        <legend>项目路段</legend>
        <div>
          <asp:GridView ID="gvRoadList" runat="server" AllowPaging="True"  Width="100%" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ROADID" OnSorting="gvRoadList_Sorting"
        EmptyDataText="没有可显示的数据记录。"  ShowFooter="true" PageSize="8"
         onrowcommand="GridView1_RowCommand"   onpageindexchanging="gvList_PageIndexChanging" >
        <Columns>
            <%--<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvRoadList.ClientID %>")' type="checkbox" value='<%#Eval("ROADID") %>' />
                </HeaderTemplate>
                <ItemTemplate>
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("ROADID") %>' />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField DataField="ROADID" HeaderText="ROADID" ReadOnly="True" HeaderStyle-HorizontalAlign="Left"
                SortExpression="ROADID" Visible="False" />
            <asp:HyperLinkField DataNavigateUrlFields="ROADID" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                DataNavigateUrlFormatString="/Views/Road/RoadView.aspx?p=roadview&id={0}" 
                DataTextField="ROADNAME" HeaderText="职员名称" SortExpression="ROADNAME" />
            <asp:BoundField DataField="ROADCODE" HeaderText="职员编码"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                SortExpression="ROADCODE" />
            <asp:BoundField DataField="WORKERAMOUNT" HeaderText="工作人数"  ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" 
                SortExpression="WORKERAMOUNT" />
            <asp:BoundField DataField="WORKTIME" HeaderText="工作时间" SortExpression="WORKTIME" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center"
                SelectText="编辑">
            <ItemStyle Width="60px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle CssClass="footer" />
    </asp:GridView>
    </div>
        </fieldset>
        
        <table width="100%">
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button2" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button5" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
    </div>
</asp:Content>
