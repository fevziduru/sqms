<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OrganizationView.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OrganizationView" %>

<%@ Register src="../Components/OrganizationTree.ascx" tagname="OrganizationTree" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table border="0" cellspacing="0" cellpadding="0" width="100%">

    <tr>
    
<%--		<td width="220px">	        
		    <uc1:OrganizationTree ID="OrganizationTree1" runat="server" />
		</td>--%>
		
		<td width="100%">
		

		
                            <div>
                            
                            <table width="100%">
                                <tr>
                                    <td align="right"><a href="OrganizationList.aspx?p=organizationlist">返回到列表</a></td>
                                </tr>
                                
                                <tr>
                                    <td align="center">
                                        <fieldset>
                                            <asp:Button Width="110" runat="server" ID="Button4" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                                            <asp:Button Width="110" runat="server" ID="Button3" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                                            <asp:Button Width="110" runat="server" ID="Button7" Text="删除" OnClick="btnDelete_OnClick"/>
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
                                        <asp:Label ID="lblOrgName" runat="server"></asp:Label>
                                    </td>
                                    <td class="style1">机构编码：</td>
                                    <td style="width:330px">
                                        <asp:Label ID="lblOrgCode" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">&nbsp;</td>
                                    <td class="style3">
                                        <asp:Label ID="lblOrgIsVoid" runat="server"></asp:Label>
                                    </td>
                                     <td class="style1">机构类型：</td>
                                    <td>
                                        <asp:Label ID="lblOrgClass" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">上级机构：</td>
                                    <td class="style3">
                                        <asp:Label ID="lblOrgParent" runat="server"></asp:Label>
                                    </td>            
                                    <td class="style1">机构简称:</td>
                                    <td>
                                        <asp:Label ID="lblOrgAlias" runat="server"></asp:Label>
                                    </td>            
                                </tr>
                                <tr>
                                    <td class="style4">联系人：</td>
                                    <td class="style3">
                                        <asp:Label ID="lblOrgContact" runat="server"></asp:Label>
                                    </td>  
                                    <td class="style1">联系电话：</td>
                                    <td>
                                        <asp:Label ID="lblOrgConatctTel" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4">邮编:</td>
                                    <td class>
                                        <asp:Label ID="lblOrgZIP" runat="server"></asp:Label>
                                        </td>
                                </tr>
                                
                                </table>
                                
                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <td width="100px">机构地址：</td>
                                        <td>
                                            <asp:Label ID="lblOrgADD" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td width="100px">机构概况：</td>
                                        <td>
                                            <asp:Label ID="lblOrgStatus" runat="server"></asp:Label>
                                        </td>
                                    </tr>                
                                        
                                    <tr>
                                     <td width="100px">备注：</td>
                                        <td>
                                            <asp:Label ID="lblOrgMemo" runat="server"></asp:Label>
                                        </td>
                                    </tr>   
                                </table>
                               
                            </fieldset>
                            <br />
                            
                            <fieldset>
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <asp:Button Width="110" runat="server" ID="Button2" Text="新增" OnClick="btnNew_Click"/>&nbsp;&nbsp;
                                            <asp:Button Width="110" runat="server" ID="Button5" Text="编辑" OnClick="btnEdit_Click"/>&nbsp;&nbsp;
                                            <asp:Button Width="110" runat="server" ID="Button6" Text="删除" OnClick="btnDelete_OnClick"/>
                                    </td>
                                </tr>
                            </table>
                            </fieldset>
                            
                            </div>		    
		

		
		</td>
    </tr>


</table>

</asp:Content>
