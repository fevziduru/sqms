<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EquipmentEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EquipmentEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    
     <table style="width:100%">
        <tr>
            <td align="right"><a href="EquipmentList.aspx?p=equlist">返回到列表</a></td>
        </tr>
        <tr>        
            <td align="center">
                <fieldset>    
                    <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/>
                    <asp:Button Width="110px" runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    <fieldset>
    <legend>设备基本信息</legend>    
    <table style="width:100%">
        <tr>
            <td style="width:110px">设备名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEquName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEquName" runat="server" 
                    ControlToValidate="txtEquName" 
                    SetFocusOnError="true"
                    ErrorMessage="设备名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">设备编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEquCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEquCode" runat="server" 
                    ControlToValidate="txtEquCode" 
                    SetFocusOnError="true"
                    ErrorMessage="设备编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td>设备标识</td>
            <td>
            <asp:TextBox ID="txtEquIdentity" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEquIdentity" runat="server" 
                    ControlToValidate="txtEquIdentity"
                    SetFocusOnError="true"
                    ErrorMessage="设备标识必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:CheckBox ID="cbIsvoid" runat="server" Text="禁用" />
            </td>
        </tr>
        <tr>
            <td>备注：</td>
            <td colspan="3"><asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" 
                    Height="181px" Width="488px" ></asp:TextBox></td>
        </tr>
    </table>
    </fieldset>
    <br />
    <table style="width:100%">
        <tr>        
            <td align="center">
                <fieldset>    
                    <asp:Button Width="110px" runat="server" ID="Button3" Text="保存" OnClick="btnSave_Click"/>
                    <asp:Button Width="110px" runat="server" ID="Button4" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  
</asp:Content>
