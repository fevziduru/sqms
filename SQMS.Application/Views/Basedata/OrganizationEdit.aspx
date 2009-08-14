<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OrganizationEdit.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OraganizationEdit" %>
<%@ Register assembly="YYControls" namespace="YYControls" tagprefix="yyc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 117px;
        }
        .style3
        {
            width: 583px;
        }
        .style4
        {
            width: 114px;
        }
    .style5
    {
        width: 84px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table border="0" cellspacing="0" cellpadding="0" width="100%">

    <tr>
		<td width="150px">
		
		       <h3> 
                   <yyc:SmartTreeView ID="SmartTreeView1" runat="server" Width="150px" ></yyc:SmartTreeView>
               </h3>
		        
		</td>
		
		<td width="100%">
		
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
                <legend>组织机构基本信息</legend>
                <table style="width:100%">
                    <tr>
                        <td class="style4">机构名称：</td>
                        <td class="style3">
                            <asp:TextBox Width="210" ID="txtEmpName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                            <asp:RequiredFieldValidator ID="rfvEmpName" runat="server" 
                                ControlToValidate="txtEmpName" 
                                SetFocusOnError="true"
                                ErrorMessage="机构名称必填"
                                Display="Dynamic" ></asp:RequiredFieldValidator>
                        </td>
                        <td class="style1">机构编码：</td>
                        <td style="width:330px">
                            <asp:TextBox ID="txtEmpCode"  Width="210" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                            <asp:RequiredFieldValidator ID="rfvEmpCode" runat="server" 
                                ControlToValidate="txtEmpName" 
                                SetFocusOnError="true"
                                ErrorMessage="机构编码必填"
                                Display="Dynamic" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">&nbsp;</td>
                        <td class="style3">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="是否禁用" />
                        </td>
                         <td class="style1">机构类型：</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">上级机构：</td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#3333FF">选择上级机构</asp:HyperLink>
                        </td>            
                        <td class="style1">机构简称:</td>
                        <td>
                            <asp:TextBox ID="TextBox8" runat="server" Width="208px"></asp:TextBox>
                        </td>            
                    </tr>
                    <tr>
                        <td class="style4">联系人：</td>
                        <td class="style3"><asp:TextBox ID="txtContactTel"  Width="210" runat="server" ></asp:TextBox></td>  
                        <td class="style1">联系电话：</td>
                        <td><asp:TextBox ID="txtMobile" Width="210" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="style4">邮编:</td>
                        <td class>
                            <asp:TextBox ID="TextBox3" runat="server" Width="208px"></asp:TextBox>
                            </td>
                    </tr>
                    
                    </table>
                    
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="style5">机构地址：</td>
                            <td><asp:TextBox 
                                    ID="TextBox5" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="style5">机构概况：</td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Height="122px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                            </td>
                        </tr>                
                            
                        <tr>
                         <td class="style5" >备注：</td>
                            <td>
                                <asp:TextBox  ID="TextBox6" runat="server" Height="125px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                            </td>
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
		
		</td>
    </tr>


</table>

</asp:Content>
