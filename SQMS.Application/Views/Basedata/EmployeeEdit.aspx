<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    职员名称：<asp:TextBox ID="txtEmpName" runat="server" ></asp:TextBox><br />
    职员编码：<asp:TextBox ID="txtEmpCode" runat="server" ></asp:TextBox><br />
    职员状态：<asp:TextBox ID="txtEmpStatus" runat="server" ></asp:TextBox><br />
    移动电话：<asp:TextBox ID="txtMobile" runat="server" ></asp:TextBox><br />
    职位：<asp:TextBox ID="txtJobTitile" runat="server" ></asp:TextBox><br />
    联系电话：<asp:TextBox ID="txtContactTel" runat="server" ></asp:TextBox><br />
    学历：<asp:TextBox ID="txtDegree" runat="server" ></asp:TextBox><br />
    <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/>
    <asp:Button runat="server" ID="Button1" Text="注销" OnClick="btnSignout_Click"/>
    </div>
</asp:Content>
