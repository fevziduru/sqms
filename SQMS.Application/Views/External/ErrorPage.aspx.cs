using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;

namespace SQMS.Application.External
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        private string id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"].ToString();
            string errorInfo = GlobalErrorMessages.ResourceManager.GetString(id);
            if (errorInfo.Length == 0)
            {
                this.lblError.Text = GlobalErrorMessages.ResourceManager.GetString("_default_exception");
            }
            else
            {
                this.lblError.Text = GlobalErrorMessages.ResourceManager.GetString(id);
            }
        }
    }
}
