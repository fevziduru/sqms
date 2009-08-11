<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeView1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    
    <table width="100%">
        <tr>
            <td align="right"><a href="EmployeeList.aspx?p=employeelist">返回到列表</a></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <asp:Button Width="110" runat="server" ID="Button1" Text="删除" OnClick="btnDelete_OnClick"/>&nbsp;&nbsp;
                    <asp:Button Width="110" runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    <br />
    
     <fieldset style="font-weight:bold;font-size:11pt">
    <legend>职员基本信息</legend>
    <table style="width:100%" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width:110">职员名称：</td>
            <td><asp:Label ID="lblEmpName" runat="server" ></asp:Label></td>
            <td style="width:110">职员编码：</td>
            <td><asp:Label ID="lblEmpCode" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>职员状态：</td>
            <td><asp:Label ID="lblEmpStatus" runat="server" ></asp:Label></td>
            <td>移动电话：</td>
            <td><asp:Label ID="lblMobile" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>所属部门：</td>
            <td><asp:Label ID="lblDepartment" runat="server"></asp:Label></td>            
            <td>性别：</td>
            <td><asp:Label ID="lblSex" runat="server"></asp:Label></td>            
        </tr>
        <tr>
            <td>设备：</td>
            <td><asp:Label ID="lblEquipment" runat="server"></asp:Label></td>            
            <td>职位：</td>
            <td><asp:Label ID="lblJobTitile" runat="server" ></asp:Label></td>            
        </tr>
        <tr>
            <td>联系电话：</td>
            <td><asp:Label ID="lblContactTel" runat="server" ></asp:Label></td>            
            <td>学历：</td>
            <td><asp:Label ID="lblDegree" runat="server" ></asp:Label></td>            
        </tr>
        <tr>
            <td>出生日期：</td>
            <td><asp:Label ID="lblBirthday" runat="server" ></asp:Label></td>
        </tr> 
    </table>
    </fieldset>
        
    <br />
    
    <fieldset  style="font-weight:bold;font-size:11pt">
    <legend>职员账号信息</legend>
    <table runat="server" id="tblPassport">
        <tr>
            <td>职员账号：</td>
            <td>
                <asp:Label ID="lblPassport" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="******"></asp:Label>
            </td>
        </tr>
    </table>
    </fieldset>
    
    <br />
    
    <fieldset  style="font-weight:bold;font-size:11pt">
    <legend>职员角色信息</legend>
    <table runat="server" id="tblRole">
        <tr>
            <td>职员角色：</td>
            <td>
            <table>
                <%
                    System.Data.DataTable dtRoles = this.ViewData.Tables["USERROLE"];
                    if (dtRoles != null)
                    {
                        foreach (System.Data.DataRow item in dtRoles.Rows)
                        {
                        %>
                        <tr>
                            <td><%=EasyDev.Util.ConvertUtil.ToStringOrDefault(item["ROLENAME"]) %></td>
                        </tr>
                        <%    
                        }
                    }
                %>
                </table>
            </td>
        </tr>
    </table>
    </fieldset>
    
    <br />
    <fieldset>
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Button Width="110" runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_OnClick"/>&nbsp;&nbsp;
                <asp:Button Width="110" runat="server" ID="Button2" Text="编辑" OnClick="btnEdit_Click"/>
            </td>
        </tr>
    </table>
    </fieldset>
    
    </div>
</asp:Content>
