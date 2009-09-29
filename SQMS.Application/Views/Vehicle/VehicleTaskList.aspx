<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="VehicleTaskList.aspx.cs" Inherits="SQMS.Application.Views.Vehicle.VehicleTaskList" %>

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
    
    <asp:GridView Width="100%" ID="gvList" runat="server" AllowPaging="True" CssClass="gridview"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TASKID" OnSorting="gvList_Sorting" PageSize="25"
        EmptyDataText="没有可显示的数据记录。" 
        onrowcommand="gvList_RowCommand" 
        onpageindexchanging="gvList_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="30px">
                <HeaderTemplate>
                    <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("TASKID") %>' />
                </HeaderTemplate>
                <ItemTemplate>                
                    <input name="__KeyValues__" type="checkbox" value='<%#Eval("TASKID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TASKID" HeaderText="任务编号" ReadOnly="True" SortExpression="TASKID" Visible="False" />
            
            <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="TASKID" 
                DataNavigateUrlFormatString="/Views/Vehicle/VehicleTaskView.aspx?p=vtview&id={0}" 
                DataTextField="TASKNAME" HeaderText="任务名称" SortExpression="TASKNAME" />
                
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="CHARGEMAN" HeaderText="负责人" SortExpression="CHARGEMAN" />    
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="STARTTIME" HeaderText="开始时间" SortExpression="STARTTIME" />
            <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ENDTIME" HeaderText="结束时间" SortExpression="ENDTIME" />
            
            <asp:TemplateField HeaderText="状态" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">                
                <ItemTemplate>
                    <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                </ItemTemplate>
            </asp:TemplateField>
            
           <asp:TemplateField HeaderText="加水" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">                
                <ItemTemplate>
                    <span><%#Eval("ISWATERSUPPLIED").ToString().Equals("Y") ? "是" : "否"%></span>
                </ItemTemplate>
            </asp:TemplateField>            
            
           <asp:TemplateField HeaderText="加油" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">                
                <ItemTemplate>
                    <span><%#Eval("ISGASSUPPLIED").ToString().Equals("Y") ? "是" : "否"%></span>
                </ItemTemplate>
            </asp:TemplateField>      
            
            <asp:TemplateField HeaderText="维修" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">                
                <ItemTemplate>
                    <span><%#Eval("ISREPAIRED").ToString().Equals("Y") ? "是" : "否"%></span>
                </ItemTemplate>
            </asp:TemplateField>      
            
            <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" SelectText="编辑">
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
