<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="ResourceEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.ResourceEdit" %>
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
    <legend>资源基本信息</legend>
    <table style="width:100%">
        <tr>
            <td style="width:110px">资源名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtResName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvResName" runat="server" 
                    ControlToValidate="txtResName"
                    SetFocusOnError="true"
                    ErrorMessage="资源名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">资源编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtResCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvResCode" runat="server" 
                    ControlToValidate="txtResCode" 
                    SetFocusOnError="true"
                    ErrorMessage="资源编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>资源标识</td>
            <td>
            <asp:TextBox ID="txtResIdentity" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvResIdentity" runat="server" 
                    ControlToValidate="txtResIdentity"
                    SetFocusOnError="true"
                    ErrorMessage="资源标识必填"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            
            <td>资源路径</td>
            <td>
                <asp:TextBox ID="txtViewName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvResViewName" runat="server" 
                    ControlToValidate="txtViewName"
                    SetFocusOnError="true"
                    ErrorMessage="资源路径必填"
                    Display="Dynamic"></asp:RequiredFieldValidator>
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
            <td colspan="3"><asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" Height="181px" Width="488px" ></asp:TextBox></td>
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
