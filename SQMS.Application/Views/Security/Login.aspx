<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SQMS.Application.Views.Security._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    用户登录<br />
    用户名:<asp:TextBox ID="txtPassport" runat="server" /><br />
    密码:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /><br />
    角色:<asp:DropDownList ID="ddlRole" runat="server"></asp:DropDownList>
    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_OnClick" Text="登录" /><br />
    </div>
    </form>
</body>
</html>
