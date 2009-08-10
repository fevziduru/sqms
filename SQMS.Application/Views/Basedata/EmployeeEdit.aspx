<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="EmployeeEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.EmployeeEdit" %>
<%@ Register src="../Components/PopupReference/PopupReference.ascx" tagname="PopupReference" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table width="100%">
        <tr>
            <td align="right"><a href="EmployeeList.aspx">���ص��б�</a></td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button runat="server" ID="btnSave" Text="����" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                <asp:Button runat="server" ID="Button3" Text="���沢����" OnClick="btnSaveAndNew_Click"/>
            </td>
        </tr>
    </table>
    <table style="width:70%">
        <tr>
            <td style="width:110px">ְԱ���ƣ�</td>
            <td style="width:330px">
                <asp:TextBox Width="210" ID="txtEmpName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEmpName" runat="server" 
                    ControlToValidate="txtEmpName" 
                    SetFocusOnError="true"
                    ErrorMessage="ְԱ���Ʊ���"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td style="width:110px">ְԱ���룺</td>
            <td style="width:330px">
                <asp:TextBox ID="txtEmpCode"  Width="210" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvEmpCode" runat="server" 
                    ControlToValidate="txtEmpName" 
                    SetFocusOnError="true"
                    ErrorMessage="ְԱ�������"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>ְԱ״̬��</td>
            <td><asp:DropDownList Width="210px" ID="ddlStatus" runat="server"></asp:DropDownList></td>
             <td>ѧ����</td>
            <td>
                <asp:DropDownList Width="210px" ID="ddlDegree" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>�������ţ�</td>
            <td><asp:DropDownList Width="210px"  ID="ddlDepartment" runat="server"></asp:DropDownList></td>            
            <td>�Ա�</td>
            <td><asp:DropDownList Width="210px" ID="ddlSex" runat="server"></asp:DropDownList></td>            
        </tr>
        <tr>
            <td>��ϵ�绰��</td>
            <td><asp:TextBox ID="txtContactTel"  Width="210" runat="server" ></asp:TextBox></td>  
            <td>�ƶ��绰��</td>
            <td><asp:TextBox ID="txtMobile" Width="210" runat="server" ></asp:TextBox></td>
            <%--<td>ְλ��</td>
            <td><asp:TextBox Visible="false" ID="txtJobTitile" runat="server" ></asp:TextBox></td>            --%>
        </tr>
        <tr>
            <td>�豸��</td>
            <td>
                <%--<asp:DropDownList Width="210px"  ID="ddlEquipment" runat="server"></asp:DropDownList>--%>
                
                <uc1:PopupReference ID="refEquipment" Service="SQMS.Services.EquipmentRefService" AssemblyName="SQMS.Services" runat="server" />
            </td>
            <td>�������ڣ�</td>
            <td><%=SQMS.Application.HtmlHelper.HtmlExtension.Calendar("calBirthday", currdate) %></td>
        </tr>
    </table>    
    <hr />
    <table>
        <tr>
            <td>ְԱ�˺ţ�</td>
            <td>
            <table>
                <tr>
                    <td><asp:TextBox  Width="210" ID="txtPassport" runat="server"></asp:TextBox> </td>
                    <td>
                    <asp:UpdatePanel ID="upCkPassport" runat="server">
                    <ContentTemplate>
                    <asp:LinkButton ID="btnCheck" Text="����˺�" CausesValidation="false" runat="server" OnClick="btnPassportCheck_Onclick"></asp:LinkButton>
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
            <td>���룺</td>
            <td>
                <asp:TextBox ID="txtPassword"  Width="210" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="lblPassword" runat="server" Text="******"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trConfirm">
            <td>�ٴ��������룺</td>
            <td><asp:TextBox  Width="210" ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
       
    </table>
    <hr />
    <table>
        <tr>
            <td>ְԱ��ɫ��</td>
            <td><asp:CheckBoxList ID="cblRoles" runat="server" RepeatColumns="1" 
            RepeatDirection="Vertical" RepeatLayout="Table"></asp:CheckBoxList></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><a href="RoleEdit.aspx">��ɫ����</a></td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Button runat="server" ID="Button1" Text="����" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                <asp:Button runat="server" ID="Button2" Text="���沢����" OnClick="btnSaveAndNew_Click"/>
            </td>
        </tr>
    </table>
    
    </div>
</asp:Content>
