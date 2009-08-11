using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using EasyDev.Security;

namespace SQMS.Application.Masters
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnLogout_OnClick(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            UserAuthentication.CheckOut();
            Session.Clear();

            HttpCookie cookie = HttpContext.Current.Response.Cookies[FormsAuthentication.FormsCookieName];            
            cookie.Value = null;
            cookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(cookie);

            Response.Redirect(FormsAuthentication.LoginUrl + "?status=q", true);
        }

        protected void appNav_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
        {
            string s = e.Node.DataItem.ToString();
        }
    }
}
