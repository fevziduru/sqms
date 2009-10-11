<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="VehicleTaskView.aspx.cs" Inherits="SQMS.Application.Views.Vehicle.VehicleTaskView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
      <table style="width:100%">
        <tr>
            <td align="right"><a href="VehicleTaskList.aspx?p=vtlist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                                                &nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button5" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button2" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>车辆任务基本信息</legend>    
    <table style="width:100%">
        <tr>
            <td class="style1">任务名称：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_name" runat="server" Text=""></asp:Label>
            </td>
            <td class="style2">任务编码：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_code" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td class="style1">任务开始时间：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_st" runat="server" Text=""></asp:Label>
            </td>  
            <td class="style2">任务结束时间：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_et" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        
       <tr>
            <td class="style1">任务下达时间：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_pt" runat="server" Text=""></asp:Label>
            </td>  
            <td class="style2">车辆型号：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_vm" runat="server" Text=""></asp:Label>
            </td>
        </tr>        
        
                
       <tr>
            <td class="style1">任务类型：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_tt" runat="server" Text=""></asp:Label>
            </td>  
            <td class="style2">负责人：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_cp" runat="server" Text=""></asp:Label>
            </td>
        </tr>   
        
       <tr>
            <td class="style1">车牌号：</td>
            <td style="width:330px">
                <asp:Label ID="lbl_ln" runat="server" Text=""></asp:Label>
            </td>  
        </tr>           
        
       <tr>
            <td class="style1">&nbsp;</td>
            <td>
                <asp:Label ID="lbl_isvoid" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
                <td colspan="4">
                        <table>
                                <tr>
                                        <td>加油：</td><td><asp:Label ID="lblGased" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                        <td>加水：</td><td><asp:Label ID="lblWatered" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                        <td>维修：</td><td><asp:Label ID="lblRepaired" runat="server" Text=""></asp:Label></td>
                                </tr>
                        </table>
                </td>
        </tr>
        <tr>
            <td class="style1">备注：</td>
            <td colspan="3">
                <asp:Label ID="lbl_momo" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    </fieldset>
    <br />
      <table style="width:100%">
        <tr>
            <td align="center">
                <fieldset>
                        &nbsp;&nbsp;
                        &nbsp;<asp:Button runat="server" Width="110px" ID="Button3" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button4" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  

</asp:Content>
