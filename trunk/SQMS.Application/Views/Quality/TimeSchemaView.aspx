<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TimeSchemaView.aspx.cs" Inherits="SQMS.Application.Views.Quality.TimeSchemaView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    
     <table style="width:100%">
        <tr>
            <td align="right"><a href="EquipmentList.aspx?p=equlist">返回到列表</a></td>
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
        <legend>常态监控</legend>    
        <table style="width:100%">
            <tr>
                <td>
                模板名称：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                开始时间：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                结束时间：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                浮动时间：<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <span>分钟</span>
                </td>
            </tr>       
                             
        </table>
        
        <br />
        
        <table style="width:100%">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>    
        
         <table id="timepoint" border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>
                    关键时间点：</input> 
                     
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>    
               
         </table>            
    
        </fieldset>         
        
        <fieldset>
        <legend>动态巡检</legend>    
        <table style="width:100%">
            <tr>
                <td>
                每隔<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    <span>小时覆盖所有监控点至少一次</span>
                </td>
            </tr>           
            <tr>
                <td>
                巡检<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    <span>次</span>
                </td>
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
