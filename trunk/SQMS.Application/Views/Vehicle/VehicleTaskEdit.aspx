<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="VehicleTaskEdit.aspx.cs" Inherits="SQMS.Application.Views.Vehicle.VehicleTaskEdit" %>

<%@ Register src="../Components/PopupReference/PopupReference.ascx" tagname="PopupReference" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
     <table style="width:100%">
        <tr>
            <td align="right"><a href="VehicleTaskList.aspx?p=vtlist">返回到列表</a></td>
        </tr>
        <tr>        
            <td align="center">
                <fieldset>    
                    <asp:Button Width="110px" runat="server" ID="Button1" Text="保存" OnClick="btnSave_Click"/>
                    <asp:Button Width="110px" runat="server" ID="Button2" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    <br />
    
    <fieldset>
    <legend>车辆任务基本信息</legend>    
    <table style="width:100%">
     
        <tr>
            <td class="style1">任务名称：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtVTName" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvVTName" runat="server" 
                    ControlToValidate="txtVTName" 
                    SetFocusOnError="true"
                    ErrorMessage="任务名称必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td class="style2">任务编码：</td>
            <td style="width:330px">
                <asp:TextBox ID="txtVTCode" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                <asp:RequiredFieldValidator ID="rfvVTCode" runat="server" 
                    ControlToValidate="txtVTCode" 
                    SetFocusOnError="true"
                    ErrorMessage="任务编码必填"
                    Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td class="style1">任务开始时间：</td>
            <td style="width:330px"><asp:TextBox ID="txtStartTime"  Width="210" runat="server" ></asp:TextBox></td>  
            <td class="style2">任务结束时间：</td>
            <td style="width:330px"><asp:TextBox ID="txtEndTime" Width="210" runat="server" ></asp:TextBox></td>
        </tr>
        
       <tr>
            <td class="style1">任务下达时间：</td>
            <td style="width:330px"><asp:TextBox ID="txtPubTime"  Width="210" runat="server" ></asp:TextBox></td>  
            <td class="style2">车辆型号：</td>
            <td style="width:330px"><asp:TextBox ID="txtMODEL" Width="210" runat="server" ></asp:TextBox></td>
        </tr>        
        
                
       <tr>
            <td class="style1">任务类型：</td>
            <td style="width:330px">
                <asp:DropDownList ID="ddlTASKTYPE" runat="server" Width="210px">
                </asp:DropDownList>
            </td>  
            <td class="style2">负责人：</td>
            <td style="width:330px">
                <uc1:PopupReference ID="refEMP" runat="server" AssemblyName="SQMS.Services" 
                    HeaderColumns="EMPID:员工编号,EMPNAME:员工名称,ISVOID:员工状态" KeyField="EMPID" 
                    KeyFieldName="员工编号" SearchColumn="EMPNAME" Service="SQMS.Services.EmployeeService" 
                    TextField="EMPNAME" TextFieldName="员工名称" />
            </td>
        </tr>   
        
       <tr>
            <td class="style1">车牌号：</td>
            <td style="width:330px"><asp:TextBox ID="txtLICENSEPLATENUM"  Width="210" runat="server" ></asp:TextBox></td>  
        </tr>           
        
       <tr>
            <td class="style1">&nbsp;</td>
            <td>
                <asp:CheckBox ID="cbIsvoid" runat="server" Text="禁用" />
            </td>
        </tr>
        <tr>
            <td class="style1">备注：</td>
            <td colspan="3"><asp:TextBox TextMode="MultiLine" ID="txtMemo" runat="server" 
                    Height="181px" Width="488px" ></asp:TextBox></td>
        </tr>
    </table>
    </fieldset>
    <br />
    <table style="width:100%">
        <tr>        
            <td align="center">
                <fieldset>    
                    <asp:Button Width="110px" runat="server" ID="Button3" Text="保存" OnClick="btnSave_Click"/>
                    <asp:Button Width="110px" runat="server" ID="Button4" Text="保存并新增" OnClick="btnSaveAndNew_Click"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  

</asp:Content>
