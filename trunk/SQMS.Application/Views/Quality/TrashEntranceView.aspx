<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TrashEntranceView.aspx.cs" Inherits="SQMS.Application.Views.Quality.TrashEntranceView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    
    <table width="100%">
        <tr>
            <td align="right"><a href="TrashEntranceList.aspx?p=emergencylist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button4" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>    
    <br />
    
     <fieldset style="font-weight:bold;font-size:11pt">
    <legend>渣口基本信息</legend>
    <table style="width:100%">
        <tr>
            <td style="width:110px">渣口名称：</td>
            <td style="width:330px">
                
                <asp:Label ID="lbl_name" runat="server"></asp:Label>
                
            </td>
            <td style="width:110px">渣口编号：</td>
            <td style="width:330px">
                
                <asp:Label ID="lbl_code" runat="server"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td>检查单位：</td>
            <td>
            
                <asp:Label ID="lbl_cu" runat="server"></asp:Label>
            
            </td>
            <td style="width:110px">监控时间段：</td>
            <td style="width:330px">

                <asp:Label ID="lbl_time" runat="server"></asp:Label>

            </td>            
        </tr>
        
        <tr>
            <td style="width:110px">检查时间：</td>
            <td style="width:330px">
                
                <asp:Label ID="lbl_ct" runat="server"></asp:Label>
                
            </td>
            <td style="width:110px">事件负责人：</td>
            <td style="width:330px">

                <asp:Label ID="lbl_emp" runat="server"></asp:Label>

            </td>
        </tr>        
        
        <tr>
            <td>优先级：</td>
            <td>
                
                </asp:DropDownList>

                <asp:Label ID="lbl_pri" runat="server"></asp:Label>

            </td>       
        </tr>        
        

        <tr>
            <td>&nbsp;</td>
            <td colspan="3">
            
                <asp:Label ID="lbl_isvoid" runat="server"></asp:Label>
            
            </td>
        </tr>        
        <tr>
            <td>备注：</td>
            <td colspan="3">
            
                <asp:Label ID="lbl_memo" runat="server"></asp:Label>
            
            </td>
        </tr>
    </table>
    </fieldset>
    
    <br />
    <fieldset>
    <table width="100%">
        <tr>
            <td align="center">
                    <asp:Button Width="110" runat="server" ID="Button2" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button5" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
            </td>
        </tr>
    </table>
    </fieldset>
    
    </div>

</asp:Content>
