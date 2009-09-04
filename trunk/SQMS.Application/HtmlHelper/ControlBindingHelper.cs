using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;

namespace SQMS.Application.HtmlHelper
{
        public class ControlBindingHelper
        {
                public static void BindDropDownList(ListControl ddl, DataTable data, string textfield, string valuefield)
                {
                        ddl.DataSource = data;
                        ddl.DataValueField = valuefield;
                        ddl.DataTextField = textfield;
                        ddl.DataBind();
                }

                public static void BindDropDownList(ListControl ddl, DataSet data, string textfield, string valuefield)
                {
                        BindDropDownList(ddl, data.Tables[0], textfield, valuefield);
                }

                public static void BindGridView(GridView gv, DataTable dt)
                {
                        gv.DataSource = dt;
                        gv.DataBind();
                }

                public static void BindGridView(GridView gv, DataSet ds, string tableName)
                {
                        BindGridView(gv, ds.Tables[tableName]);
                }
        }
}
