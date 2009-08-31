<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TimeSchemaEdit.aspx.cs" Inherits="SQMS.Application.Views.Quality.TimeSchemaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Resources/Scripts/Controls/Timepicker/timepicker.css" type="text/css" rel="Stylesheet" />
    
	<script type="text/javascript" src="../../Resources/Scripts/Controls/jquery.js"></script>
    <script type="text/javascript" src="../../Resources/Scripts/Controls/Timepicker/timepicker.js"></script>

    <script language="javascript">

        $(document).ready(function() {

            /*
            *	Utility functions
            $.datepicker.setDefaults( settings ) - Set settings for all datepicker instances. 
            $.datepicker.formatDate( format, date, settings ) - Format a date into a string value with a specified format. 
            $.datepicker.iso8601Week( date ) - Determine the week of the year for a given date: 1 to 53. 
            $.datepicker.parseDate( format, value, settings ) - Extract a date from a string value with a specified format. 
            */

            //$.datepicker.setDefaults( { dateFormat: 'hh,D', showOn: 'button', buttonImage: 'calendar.gif', buttonImageOnly: true } );
            //#tbBEGINTIME , #tbENDTIME'

            $('#jk_time').timepicker({
                showAnim: 'slide',
                duration: 'fast',
                defaultTime: new Date(2000, 00, 00, 00, 00, 00)
            });

            var i = 1;
            $('#addTime').click(function() {
                i++;
                $('#timepoint').append('<tr><td>关键时间点：<input type="text" id="jk_time' + i + '" name="time" autocomplete="off"></input><div id="time' + i + '_picker" class="time_picker_div"></div></td></tr>');
                
                $('#jk_time' + i).timepicker({
                    showAnim: 'slide',
                    duration: 'fast',
                    defaultTime: new Date(2000, 00, 00, 00, 00, 00)
                });
            });

        });	
       
    </script> 
    
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
                模板名称：<asp:TextBox ID="tbSCHEMANAME" runat="server" ></asp:TextBox><span style="color:Red">*</span>
                </td>
            </tr>
            <tr> 
                <td>
                开始时间：<asp:TextBox ID="tbBEGINTIME" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                结束时间：<asp:TextBox ID="tbENDTIME" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                浮动时间：<asp:TextBox ID="tbFLOATTIME" runat="server" ></asp:TextBox><span>分钟</span>
                </td>
            </tr>       
                             
        </table>
        
        <br />
        
        <table style="width:100%">
            <tr>
                <td>
                    <input type="button" id="addTime" value="添加关键时间点"></input>
                </td>
            </tr>
        </table>    
        
         <table id="timepoint" border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td>
                    关键时间点：<input type="text" id="jk_time" name="time" autocomplete="off"></input>
                    <div id="time1_picker" class=""></div>
                    </td>
                </tr>    
         </table>            
    
        </fieldset>         
        
        <br />
        
        <fieldset>
        <legend>动态巡检</legend>    
        <table style="width:100%">
            <tr>
                <td>
                每隔<asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox><span>小时覆盖所有监控点至少一次</span>
                </td>
            </tr>           
            <tr>
                <td>
                巡检<asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox><span>次</span>
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
