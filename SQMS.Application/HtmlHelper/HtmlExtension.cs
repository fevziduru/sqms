using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace SQMS.Application.HtmlHelper
{        
    public class HtmlExtension
    {
        #region Calendar
        /// <summary>
        /// 创建日历
        /// </summary>
        /// <param name="name">日历控件的唯一标识</param>
        /// <returns></returns>
        public static string Calendar(string name, string value, string title, string dateFormat, string imgsrc, string overcolor, string outcolor, bool isReadonly)
        {
            StringBuilder script = new StringBuilder();
            if (dateFormat == null || dateFormat.Length == 0)
            {
                dateFormat = "%Y-%m-%d";
            }

            script.AppendFormat(@"<table cellspacing='0' cellpadding='0'>
                <tr>
                    <td><input type='text' name='{0}' id='{0}' value='{1}' readonly='{1}' /></td>
                    <td><img src='{3}' width='22' height='22' id='{0}_button' style='cursor: pointer; border: 0px solid red;' title='{2}'
                    onmouseover='this.style.background='{4}';' onmouseout='this.style.background='{5}'' /></td>
            </table><br/>", name, value, title, imgsrc, overcolor, outcolor);

            script.Append(@"<script type='text/javascript'>Calendar.setup({
                    inputField     :    '" + name + @"',     // id of the input field
                    ifFormat       :    '" + dateFormat + @"',      // format of the input field
                    button         :    '" + name + @"_button',  // trigger for the calendar (button ID)
                    align          :    'Tl',           // alignment (defaults to 'Bl')
                    singleClick    :    true,
                    timeFormat     :    '24'
                });</script>");

            return script.ToString();
        }

        public static string Calendar(string name)
        {
            return Calendar(name, DateTime.Now.ToString(), "日历", null, "../../Resources/Images/Controls/Calendar/calendar.gif", "#efefef", "", false);
        }

        public static string Calendar(string name, string currdate)
        {
            return Calendar(name, currdate, "日历", null, "../../Resources/Images/Controls/Calendar/calendar.gif", "#efefef", "", false);
        }

        public static string Calendar(string name, string currdate, string dateFormat)
        {
            return Calendar(name, currdate, "日历", dateFormat, "../../Resources/Images/Controls/Calendar/calendar.gif", "#efefef", "", false);
        }

        public static string Calendar(string name, string currdate, string title, string imgsrc)
        {
            return Calendar(name, currdate, title, null, imgsrc, "#efefef", "", false);
        }

        public static string Calendar(string name, string currdate, string title, string imgsrc, bool isReadonly)
        {
            return Calendar(name, currdate, title, null, imgsrc, "#efefef", "", isReadonly);
        } 
        #endregion        
    }
}
