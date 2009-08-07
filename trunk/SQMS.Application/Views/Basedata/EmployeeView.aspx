<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeView1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
