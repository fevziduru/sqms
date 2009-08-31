<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeEdit" %>
<%@ Register src="../Components/PopupReference/PopupReference.ascx" tagname="PopupReference" tagprefix="uc1" %>
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
                    <asp:Button Width="110px" runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                    <asp:Button Width="110px" runat="server" ID="Button3" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
        
    </table>
    
    <br />
    
    <fieldset  style="font-weight:bold;font-size:11pt">
    <legend>职员基本信息</legend>
    <table style="width:100%">
        <tr>
            <td style="width:110px">职员名称：</td>
            <td style="width:330px">
                <asp:TextBox Width="210" ID="txtEmpName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEmpName" runat="server" 
                    ControlToValidate="txtEmpName" 
                    SetFocusOnError="true"
                    ErrorMessage="职员名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">职员编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEmpCode"  Width="210" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEmpCode" runat="server" 
                    ControlToValidate="txtEmpName" 
                    SetFocusOnError="true"
                    ErrorMessage="职员编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>职员状态：</td>
            <td><asp:DropDownList Width="210px" ID="ddlStatus" runat="server"></asp:DropDownList></td>
             <td>学历：</td>
            <td>
                <asp:DropDownList Width="210px" ID="ddlDegree" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>所属部门：</td>
            <td><asp:DropDownList Width="210px"  ID="ddlDepartment" runat="server"></asp:DropDownList></td>            
            <td>性别：</td>
            <td><asp:DropDownList Width="210px" ID="ddlSex" runat="server"></asp:DropDownList></td>            
        </tr>
        <tr>
            <td>联系电话：</td>
            <td><asp:TextBox ID="txtContactTel"  Width="210" runat="server" ></asp:TextBox></td>  
            <td>移动电话：</td>
            <td><asp:TextBox ID="txtMobile" Width="210" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>设备：</td>
            <td>
                <uc1:PopupReference ID="refEquipment" Service="SQMS.Services.EquipmentService" 
                HeaderColumns="EQUID:设备ID,EQUNAME:设备名称,ISVOID:设备状态" KeyFieldName="设备编号" TextFieldName="设备名称"
                KeyField="EQUID" TextField="EQUNAME" SearchColumn="EQUNAME" AssemblyName="SQMS.Services" runat="server" />
            </td>
            <td>出生日期：</td>
            <td><%=SQMS.Application.HtmlHelper.HtmlExtension.Calendar("calBirthday", currdate) %></td>
        </tr>
    </table>
    </fieldset>
    <br />
    <fieldset  style="font-weight:bold;font-size:11pt">
    <legend>职员账号信息</legend>
    <table>
        <tr>
            <td>职员账号：</td>
            <td>
            <table>
                <tr>
                    <td><asp:TextBox  Width="210" ID="txtPassport" runat="server"></asp:TextBox> </td>
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
                <asp:TextBox ID="txtPassword"  Width="210" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblPassword" runat="server"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trConfirm">
            <td>再次输入密码：</td>
            <td><asp:TextBox  Width="210" ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
       
    </table>
    </fieldset>
    <br />
    <fieldset  style="font-weight:bold;font-size:11pt">
    <legend>职员角色信息</legend>
    <table>
        <tr>
            <td>职员角色：</td>
            <td><asp:CheckBoxList ID="cblRoles" runat="server" RepeatColumns="1" 
            RepeatDirection="Vertical" RepeatLayout="Table"></asp:CheckBoxList></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><a href="RoleEdit.aspx?p=roleedit">角色管理</a></td>
        </tr>
    </table>
    </fieldset>
    <br />
    
    <fieldset>
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                <asp:Button Width="110px" runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
            </td>
        </tr>
    </table>
    </fieldset>
    
    </div>
</asp:Content>
