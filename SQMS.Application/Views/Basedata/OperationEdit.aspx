<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OperationEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OperationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
     <table>
        <tr>
            <td><asp:Button runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/></td>
            <td><asp:Button runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click"/></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width:110px">操作名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtOpName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvOpName" runat="server" 
                    ControlToValidate="txtOpName" 
                    SetFocusOnError="true"
                    ErrorMessage="操作名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">操作编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtOpCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvOpCode" runat="server" 
                    ControlToValidate="txtOpCode" 
                    SetFocusOnError="true"
                    ErrorMessage="操作编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>备注：</td>
            <td colspan="3"><asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" 
                    Height="181px" Width="488px" ></asp:TextBox></td>
        </tr>
    </table>
    <table>
        <tr>
            <td><asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/></td>
            <td><asp:Button runat="server" ID="Button3" Text="保存并新增" OnClick="btnSaveAndNew_Click"/></td>
        </tr>
    </table>
    
    </div>  
    
</asp:Content>
