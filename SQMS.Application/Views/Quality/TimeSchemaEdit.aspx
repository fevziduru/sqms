<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="TimeSchemaEdit.aspx.cs" Inherits="SQMS.Application.Views.Quality.TimeSchemaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../../Resources/Scripts/Controls/Timepicker/timepicker.css" type="text/css" rel="Stylesheet" />
    
	<script type="text/javascript" src="../../Resources/Scripts/Controls/jquery.js"></script>
    <script type="text/javascript" src="../../Resources/Scripts/Controls/TimeBox/TimeBox.js"></script>
    <script type="text/javascript" src="../../Resources/Scripts/Controls/Timepicker/timepicker.js"></script>

    <script type="text/javascript">

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

//                    $('#jk_time').timepicker({
//                            showAnim: 'slide',
//                            duration: 'fast',
//                            defaultTime: new Date(2000, 00, 00, 00, 00, 00)
//                    });

//                    var i = $("#ts_count").attr("count");
//                    $('#addTime').click(function() {
//                            i++;
//                            $('#timepoint').append('<tr><td>关键时间点：<input type="text" id="jk_time' + i + '" name="time" autocomplete="off"></input><div id="time' + i + '_picker" class="time_picker_div"></div></td></tr>');

//                            $('#jk_time' + i).timepicker({
//                                    showAnim: 'slide',
//                                    duration: 'fast',
//                                    defaultTime: new Date(2000, 00, 00, 00, 00, 00)
//                            });
            //                    });



            });
       
    </script> 
    
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
                        <div id="txt100_main">
	                    开始时间：<input type="text" id="txt100" value="<% = strBEGINTIME %>" name="tbBEGINTIME" onchange="javascript:checkTime(this)" onblur="javascript:checkTime(this)" onfocus="javascript:showHint(this)" />
	                    <div id="txt100_hint" style="z-index:1000;display:none;position:absolute;border:#6B90DA 1px solid;background-color:#F0F7F9;vertical-align:middle;text-align:center">
		                    <span style="font-size:10pt;vertical-align:absmiddle;text-align:center; padding:30">时间格式为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
	                    <div id="txt100_errinfo" style="z-index:1000;display:none;position:absolute;border:#ff0000 1px solid;background-color:#FFEDDB">
		                    <span style="font-size:10pt;vertical-align:absmiddle; padding:30;text-align:center">时间格式不对,时间格式应为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
	                    
                </td>
            </tr>
            <tr>
                <td>
                        <div id="txt101_main">
	                    结束时间：<input type="text" id="txt101" value="<% = strENDTIME %>" name="tbENDTIME" onchange="javascript:checkTime(this)" onblur="javascript:checkTime(this)" onfocus="javascript:showHint(this)" />
	                    <div id="txt101_hint" style="z-index:1000;display:none;position:absolute;border:#6B90DA 1px solid;background-color:#F0F7F9;vertical-align:middle;text-align:center">
		                    <span style="font-size:10pt;vertical-align:absmiddle;text-align:center; padding:30">时间格式为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
	                    <div id="txt101_errinfo" style="z-index:1000;display:none;position:absolute;border:#ff0000 1px solid;background-color:#FFEDDB">
		                    <span style="font-size:10pt;vertical-align:absmiddle; padding:30;text-align:center">时间格式不对,时间格式应为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
	                    
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
                
                    <span>关键时间点：</span>
                
                    <%-- <input type="button" id="addTime" value="添加关键时间点"></input>--%>
                    <!--动态添加时间控件-->
                    <input type="button" value="添加关键时间点" onclick="javascript:addTimeBox()">
          
                    <!--容纳时间控件的容器，必要-->
                    <div id="container"></div>
            
                    <%-- <div id="txt_main">
	                    <input type="text" id="txt" value="" name="time" onchange="javascript:checkTime(this)" onblur="javascript:checkTime(this)" onfocus="javascript:showHint(this)" />
	                    <div id="txt_hint" style="z-index:1000;display:none;position:absolute;border:#6B90DA 1px solid;background-color:#F0F7F9;vertical-align:middle;text-align:center">
		                    <span style="font-size:10pt;vertical-align:absmiddle;text-align:center; padding:30">时间格式为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
	                    <div id="txt_errinfo" style="z-index:1000;display:none;position:absolute;border:#ff0000 1px solid;background-color:#FFEDDB">
		                    <span style="font-size:10pt;vertical-align:absmiddle; padding:30;text-align:center">时间格式不对,时间格式应为hh24(小时):mm(分钟):ss(秒)</span>
	                    </div>
                    </div>--%>          
            
        </table>    
        
         <table id="timepoint" border="0" cellspacing="0" cellpadding="0" width="100%">
            <asp:Label ID="lblTIMESPOTS" runat="server" Text=""></asp:Label>
         </table>            
    
        </fieldset>         
        
        <br />
        
        <fieldset>
        <legend>动态巡检</legend>    
        <table style="width:100%">
            <tr>
                <td>
                每隔<asp:TextBox ID="tbTIMESPAN" runat="server" ></asp:TextBox><span>小时覆盖所有监控点至少一次</span>
                </td>
            </tr>           
            <tr>
                <td>
                巡检<asp:TextBox ID="tbTIMESPOT" runat="server" ></asp:TextBox><span>次</span>
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
