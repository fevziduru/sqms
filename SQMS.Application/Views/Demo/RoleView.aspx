<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleView.aspx.cs" Inherits="SQMS.Application.Views.Demo.RoleView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    ROLECODE：<asp:Label ID="LabelRoleCode" runat="server" Text=""></asp:Label><br />
    ROLENAME：<asp:Label ID="LabelRoleName" runat="server" Text=""></asp:Label><br />
    ISVOID：<asp:CheckBox ID="CheckBoxIsVoid" runat="server" Enabled="False" /><br />
    MEMO：<asp:Label ID="LabelMemo" runat="server" Text=""></asp:Label><br />    
    <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_OnClick"/>
    </div>
    </form>
</body>
</html>
