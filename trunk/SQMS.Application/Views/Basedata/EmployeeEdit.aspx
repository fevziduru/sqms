<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeEdit.aspx.cs" Inherits="SQMS.Application.Modules.Basedata.EmployeeEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    职员名称：<asp:TextBox ID="txtEmpName" runat="server" ></asp:TextBox><br />
    职员编码：<asp:TextBox ID="txtEmpCode" runat="server" ></asp:TextBox><br />
    职员状态：<asp:TextBox ID="txtEmpStatus" runat="server" ></asp:TextBox><br />
    移动电话：<asp:TextBox ID="txtMobile" runat="server" ></asp:TextBox><br />
    职位：<asp:TextBox ID="txtJobTitile" runat="server" ></asp:TextBox><br />
    联系电话：<asp:TextBox ID="txtContactTel" runat="server" ></asp:TextBox><br />
    学历：<asp:TextBox ID="txtDegree" runat="server" ></asp:TextBox><br />
    <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/>
    </div>
    </form>
</body>
</html>
