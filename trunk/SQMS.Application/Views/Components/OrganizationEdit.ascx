<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrganizationEdit.ascx.cs" Inherits="SQMS.Application.Views.Components.OrganizationEdit" %>

                <div>
                
                <table width="100%">
                    <tr>
                        <td align="right"><a href="OrganizationList.aspx?p=organizationlist">返回到列表</a></td>
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
                            <asp:TextBox Width="210" ID="txtOrgName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                            <asp:RequiredFieldValidator ID="rfvOrgName" runat="server" 
                                ControlToValidate="txtOrgName" 
                                SetFocusOnError="true"
                                ErrorMessage="机构名称必填"
                                Display="Dynamic" ></asp:RequiredFieldValidator>
                        </td>
                        <td class="style1">机构编码：</td>
                        <td style="width:330px">
                            <asp:TextBox ID="txtOrgCode"  Width="210" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                            <asp:RequiredFieldValidator ID="rfOrgCode" runat="server" 
                                ControlToValidate="txtOrgCode" 
                                SetFocusOnError="true"
                                ErrorMessage="机构编码必填"
                                Display="Dynamic" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">&nbsp;</td>
                        <td class="style3">
                            <asp:CheckBox ID="cbIsVoid" runat="server" Text="是否禁用" />
                        </td>
                         <td class="style1">机构类型：</td>
                        <td>
                            <asp:DropDownList ID="ddlOrgClass" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">上级机构：</td>
                        <td class="style3">
                            <asp:TextBox ID="tbOrgParent" runat="server" Enabled="False" Visible="False"></asp:TextBox>
                            <asp:DropDownList ID="ddlParent" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlParent_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>            
                        <td class="style1">机构简称:</td>
                        <td>
                            <asp:TextBox ID="tbAlias" runat="server" Width="208px"></asp:TextBox>
                        </td>            
                    </tr>
                    <tr>
                        <td class="style4">联系人：</td>
                        <td class="style3"><asp:TextBox ID="tbContactTel"  Width="210" runat="server" ></asp:TextBox></td>  
                        <td class="style1">联系电话：</td>
                        <td><asp:TextBox ID="tbPhone" Width="210" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="style4">邮编:</td>
                        <td class>
                            <asp:TextBox ID="tbZIP" runat="server" Width="208px"></asp:TextBox>
                            </td>
                    </tr>
                    
                    </table>
                    
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="100px">机构地址：</td>
                            <td><asp:TextBox ID="tbAddress" runat="server" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <td width="100px">机构概况：</td>
                            <td>
                                <asp:TextBox ID="tbOrgStatus" runat="server" Height="122px" 
                                    TextMode="MultiLine" Width="90%"></asp:TextBox>
                            </td>
                        </tr>                
                            
                        <tr>
                         <td width="100px">备注：</td>
                            <td>
                                <asp:TextBox  ID="tbMemo" runat="server" Height="125px" TextMode="MultiLine" 
                                    Width="90%"></asp:TextBox>
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