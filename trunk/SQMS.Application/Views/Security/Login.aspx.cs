using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Application.Foundations;
using SQMS.Services;
using System.Web.Security;

namespace SQMS.Application.Views.Security
{
    public partial class Login : SQMSPage<PassportService>
    {
        private PassportService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = (PassportService)Service;
        }

        public void btnLogin_OnClick(object sender, EventArgs e)
        {
            string name = this.txtPassport.Text;
            string password = this.txtPassword.Text;

            if (srv.Authenticate(name, password))
            {
                FormsAuthentication.SetAuthCookie(name, false);

                Response.Redirect(FormsAuthentication.DefaultUrl, true);                
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage("status=failed");
            }
        }
    }
}
