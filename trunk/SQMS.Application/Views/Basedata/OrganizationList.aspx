<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="OrganizationList.aspx.cs" Inherits="SQMS.Application.Views.Basedata.OrganizationList" %>

<%@ Register src="../Components/OrganizationTree.ascx" tagname="OrganizationTree" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table border="0" cellspacing="0" cellpadding="0" width="100%">

    <tr>
		<td width="220px">


		        
		    <uc1:OrganizationTree ID="OrganizationTree1" runat="server" />


		        
		</td>
		
		<td width="100%">
		

		
		                        <div>
                    <table style="width:100%">
                            <tr>
                                <td align="center">
                                    <fieldset>
                                        <asp:Button Width="110px" ID="Button2" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                                        <asp:Button Width="110px" ID="Button1" runat="server" Text="删除" OnClick="btnDelete_OnClick" />
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                        <br />
                        
                        <asp:GridView Width="100%" ID="gvList" runat="server" AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ORGID" OnSorting="gvList_Sorting" PageSize="25"
                            EmptyDataText="没有可显示的数据记录。" 
                            onrowcommand="gvList_RowCommand" 
                            onpageindexchanging="gvList_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="30px">
                                    <HeaderTemplate>
                                        <input name="header" onclick='SelectAll("<%=this.gvList.ClientID %>")' type="checkbox" value='<%#Eval("ORGID") %>' />
                                    </HeaderTemplate>
                                    <ItemTemplate>                
                                        <input name="__KeyValues__" type="checkbox" value='<%#Eval("ORGID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ORGID" HeaderText="ORGID" ReadOnly="True" SortExpression="ORGID" Visible="False" />
                                <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="ORGID" 
                                    DataNavigateUrlFormatString="/Views/Basedata/OrganizationView.aspx?p=organizationview&id={0}" 
                                    DataTextField="ORGNAME" HeaderText="组织机构名称" SortExpression="ORGNAME" />
                                    
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ORGCODE" HeaderText="编码" SortExpression="ORGCODE" />
                                    
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ORGTYPE" HeaderText="分类" SortExpression="ORGTYPE" />
                                
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="PARENTORG" HeaderText="父机构" SortExpression="PARENTORG" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ORGALIAS" HeaderText="别名" SortExpression="ORGALIAS" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="CONTACT" HeaderText="联系人" SortExpression="CONTACT" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="CONTACTTEL" HeaderText="联系电话" SortExpression="CONTACTTEL" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ZIPCODE" HeaderText="邮编" SortExpression="ZIPCODE" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ORGADDRESS" HeaderText="地址" SortExpression="ORGADDRESS" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="ORGSTATUS" HeaderText="概况" SortExpression="ORGSTATUS" />
                                <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="MEMO" HeaderText="备注" SortExpression="MEMO" />
                                                              
                                <asp:TemplateField HeaderText="状态" SortExpression="ISVOID" HeaderStyle-HorizontalAlign="Left">                
                                    <ItemTemplate>
                                        <span><%#Eval("ISVOID").ToString().Equals("Y")?"禁用":"启用" %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:CommandField ShowSelectButton="True" ItemStyle-HorizontalAlign="Center" SelectText="编辑">
                                    <ItemStyle Width="60px" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>
                        <br />
                       
                        <table style="width:100%">
                            <tr>
                                <td align="center">
                                    <fieldset>
                                        <asp:Button Width="110px" ID="Button3" runat="server" Text="新增" onclick="btnNew_Click" />&nbsp;&nbsp;
                                        <asp:Button Width="110px" ID="Button4" runat="server" Text="删除" OnClick="btnDelete_OnClick" />
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                         </div>
		

		
		</td>
    </tr>


</table>

</asp:Content>
