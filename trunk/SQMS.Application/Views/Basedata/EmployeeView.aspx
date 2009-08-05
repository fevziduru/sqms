<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    职员名称：<asp:Label ID="lblEmpName" runat="server" ></asp:Label><br />
    职员编码：<asp:Label ID="lblEmpCode" runat="server" ></asp:Label><br />
    职员状态：<asp:Label ID="lblEmpStatus" runat="server" ></asp:Label><br />
    移动电话：<asp:Label ID="lblMobile" runat="server" ></asp:Label><br />
    职位：<asp:Label ID="lblJobTitile" runat="server" ></asp:Label><br />
    联系电话：<asp:Label ID="lblContactTel" runat="server" ></asp:Label><br />
    学历：<asp:Label ID="lblDegree" runat="server" ></asp:Label><br />
    <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_OnClick"/>
    
    </div>
    </form>
</body>
</html>
