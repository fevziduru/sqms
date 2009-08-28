<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectEdit.aspx.cs" Inherits="SQMS.Application.Views.Project.ProjectEdit"
    MasterPageFile="~/Masters/Main.Master" %>
<%@ Register src="../Components/PopupReference/PopupReference.ascx" tagname="PopupReference" tagprefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <table style="width: 100%">
            <tr>
                <td align="right">
                    <a href="ProjectList.aspx?p=projectlist">返回到列表</a>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <fieldset>
                        <asp:Button Width="110px" runat="server" ID="BtnSave" Text="保存" OnClick="BtnSave_Click" />
                        <asp:Button Width="110px" runat="server" ID="BtnSaveAndNew" Text="保存并新增" OnClick="BtnSaveAndNew_Click" />
                    </fieldset>
                </td>
            </tr>
        </table>
        <br />
        <fieldset>
            <legend>项目基本信息</legend>
            <table style="width: 100%">
                <tr>
                    <td style="width: 110px">
                        项目名称：
                    </td>
                    <td style="width: 330px">
                        <asp:TextBox ID="TextBoxProjectName" runat="server"></asp:TextBox><span style="color: Red">*</span>
                        <asp:RequiredFieldValidator ID="RFVProjectName" runat="server" ControlToValidate="TextBoxProjectName"
                            SetFocusOnError="true" ErrorMessage="项目名称必填" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td style="width: 110px">
                        项目编码：
                    </td>
                    <td style="width: 330px">
                        <asp:TextBox ID="TextBoxProjectCode" runat="server"></asp:TextBox><span style="color: Red">*</span>
                        <asp:RequiredFieldValidator ID="RFVProjectCode" runat="server" ControlToValidate="TextBoxProjectCode"
                            SetFocusOnError="true" ErrorMessage="项目编码必填" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        负责人
                    </td>
                    <td>
                        <!---TODO:修改为职员picker--->
                        <uc1:PopupReference ID="RefEmp" 
                         HeaderColumns="EMPID:职员ID,EMPNAME:职员名称,SEX:性别,JOBTITLE:职位" KeyFieldName="职员编号" TextFieldName="职员名称"
                        Service="SQMS.Services.EmployeeService" SearchColumn="EMPNAME" KeyField="EMPID" TextField="EMPNAME"
                        AssemblyName="SQMS.Services" runat="server" />
                    </td>
                    <td>
                        助理人数
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxAssistAmount" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        组长人数
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxLeaderAmount" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        副组长人数
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxViseleaderAmount" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        总工人数
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxTotalWorkerAmount" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        总作业时间
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxTotalWorkTime" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                       总规模
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxTotalScale" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBoxIsVoid" runat="server" Text="禁用" />
                    </td>
                </tr>
                <tr>
                    <td>
                        备注：
                    </td>
                    <td colspan="3">
                        <asp:TextBox TextMode="MultiLine" ID="TextBoxMemo" runat="server" Height="181px"
                            Width="488px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
</asp:Content>
