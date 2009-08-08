<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table>
        <tr>
            <td><asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/></td>
            <td><asp:Button runat="server" ID="Button3" Text="保存并新增" OnClick="btnSaveAndNew_Click"/></td>
        </tr>
    </table>
    <table style="width:70%">
        <tr>
            <td style="width:110px">职员名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEmpName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEmpName" runat="server" 
                    ControlToValidate="txtEmpName" 
                    SetFocusOnError="true"
                    ErrorMessage="职员名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">职员编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEmpCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEmpCode" runat="server" 
                    ControlToValidate="txtEmpName" 
                    SetFocusOnError="true"
                    ErrorMessage="职员编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>职员状态：</td>
            <td><asp:TextBox ID="txtEmpStatus" runat="server" ></asp:TextBox></td>
            <td>移动电话：</td>
            <td><asp:TextBox ID="txtMobile" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>所属部门：</td>
            <td><asp:DropDownList ID="ddlDepartment" runat="server"></asp:DropDownList></td>            
            <td>性别：</td>
            <td><asp:DropDownList ID="ddlSex" runat="server"></asp:DropDownList></td>            
        </tr>
        <tr>
            <td>设备：</td>
            <td><asp:DropDownList ID="ddlEquipment" runat="server"></asp:DropDownList></td>            
            <td>职位：</td>
            <td><asp:TextBox ID="txtJobTitile" runat="server" ></asp:TextBox></td>            
        </tr>
        <tr>
            <td>联系电话：</td>
            <td><asp:TextBox ID="txtContactTel" runat="server" ></asp:TextBox></td>            
            <td>学历：</td>
            <td><asp:TextBox ID="txtDegree" runat="server" ></asp:TextBox></td>            
        </tr>
        <tr>
            <td>出生日期：</td>
            <td><%=SQMS.Application.HtmlHelper.HtmlExtension.Calendar("calBirthday", currdate) %></td>
        </tr> 
    </table>    
    <hr />
    <table>
        <tr>
            <td>职员账号：</td>
            <td>
            <table>
                <tr>
                    <td><asp:TextBox ID="txtPassport" runat="server"></asp:TextBox> </td>
                    <td>
                    <asp:UpdatePanel ID="upCkPassport" runat="server">
                    <ContentTemplate>
                    <asp:LinkButton ID="btnCheck" Text="检查账号" CausesValidation="false" runat="server" OnClick="btnPassportCheck_Onclick"></asp:LinkButton>
                    <asp:Label ID="lblCheckResult" runat="server"></asp:Label>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
                <asp:Label ID="lblPassport" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblPassword" runat="server" Text="******"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trConfirm">
            <td>再次输入密码：</td>
            <td><asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
    </table>
    <hr />
    <table>
        <tr>
            <td>职员角色：</td>
            <td><asp:CheckBoxList ID="cblRoles" runat="server" RepeatColumns="3" RepeatDirection="Vertical" RepeatLayout="Table"></asp:CheckBoxList></td>
        </tr>
    </table>
    <table>
        <tr>
            <td><asp:Button runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/></td>
            <td><asp:Button runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click"/></td>
        </tr>
    </table>
    
    </div>
</asp:Content>
