<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TimeSchemaView.aspx.cs" Inherits="SQMS.Application.Views.Quality.TimeSchemaView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    
     <table style="width:100%">
        <tr>
            <td align="right"><a href="TimeSchemaList.aspx?p=timeschemalist">返回到列表</a></td>
        </tr>
        <tr>        
            <td align="center">
                <fieldset>    
                        <asp:Button runat="server" Width="110px" ID="Button1" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button2" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button12" Text="删除" OnClick="btnDelete_OnClick"/>
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
                模板名称：<asp:Label ID="lblSCHEMANAME" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                开始时间：<asp:Label ID="lblBEGINTIME" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                结束时间：<asp:Label ID="lblENDTIME" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                浮动时间：<asp:Label ID="lblFLOATTIME" runat="server"></asp:Label>
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
                        <asp:Label ID="lblTIMESPANS" runat="server"></asp:Label>
                    </td>
                </tr>    
               
         </table>            
    
        </fieldset>         
        
        <fieldset>
        <legend>动态巡检</legend>    
        <table style="width:100%">
            <tr>
                <td>
                每隔<asp:Label ID="lblTIMESPAN" runat="server"></asp:Label>
                    <span>小时覆盖所有监控点至少一次</span>
                </td>
            </tr>           
            <tr>
                <td>
                巡检<asp:Label ID="lblTIMESPOT" runat="server"></asp:Label>
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
                        <asp:Button runat="server" Width="110px" ID="Button5" Text="新增" OnClick="btnNew_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button3" Text="编辑" OnClick="btnEdit_OnClick"/>&nbsp;&nbsp;
                        <asp:Button runat="server" Width="110px" ID="Button4" Text="删除" OnClick="btnDelete_OnClick"/>
                </fieldset>
            </td>
        </tr>
    </table>
    
    </div>  

</asp:Content>
