<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SQMS.Application.Views.Security._Default" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" valign="middle">
            <table width="300">
            <tr>
            <td>
            <fieldset>
            <legend>用户登录</legend>
            <table cellpadding="0" cellspacing="0" style="width:100%">
                <tr style="height:30">
                    <td align="right" style="width:110px">用户名：</td>
                    <td>
                        <asp:TextBox Width="180" ID="txtPassport" runat="server" /><span style="color:Red">*</span>
                        
                    </td>
                    <td></td>
                </tr>
                <tr style="height:30">
                    <td align="right">密码：</td>
                    <td>
                        <asp:TextBox Width="180" ID="txtPassword" runat="server" TextMode="Password" />                        
                    </td>
                    <td></td>
                </tr>
                <tr style="height:30">
                    <td align="right">角色：</td>
                    <td><asp:DropDownList ID="ddlRole" runat="server" Width="160"></asp:DropDownList></td>
                    <td></td>
                </tr>
                <tr style="height:30">
                    <td colspan="3" align="center"><asp:Button Width="110" ID="btnLogin" runat="server" OnClick="btnLogin_OnClick" Text="登录" /></td>
                </tr>
                <tr>
                    <td colspan="3">
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                        ControlToValidate="txtPassport" 
                        SetFocusOnError="true"
                        ErrorMessage="请输入用户名"
                        Display="Dynamic" ></asp:RequiredFieldValidator>                        
                    </td>
                </tr>
            </table>
            </fieldset>
            </td></tr>
            </table>
            
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
