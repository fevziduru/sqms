using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using System.Web.Security;
using EasyDev.Util;
using EasyDev.SQMS;

namespace SQMS.Application.Views.Security
{
    public partial class _Default : SQMSPage<PassportService>
    {
        private PassportService srv = null;
        private string status = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            status = ConvertUtil.EmptyOrString(Request.QueryString["status"]);

            if (status == "q")
            { 
                //TODO: 移除用户信息
            }
        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = (PassportService)Service;
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.ddlRole.DataSource = srv.GetRoles();
                this.ddlRole.DataTextField = "rolename";
                this.ddlRole.DataValueField = "roleid";
                this.ddlRole.DataBind();                
            }
        }

        public void btnLogin_OnClick(object sender, EventArgs e)
        {
            string passport = this.txtPassport.Text;
            string password = this.txtPassword.Text;
            string role = this.ddlRole.SelectedValue;

            UserInfo ui = srv.Login(passport, password, role);

            if (ui != null)
            {
                if (Session["USER_INFO"] == null)
                {
                    Session.Add("USER_INFO", ui);
                }
                else
                {
                    Session["USER_INFO"] = ui;
                }

                FormsAuthenticationTicket ticket = 
                    new FormsAuthenticationTicket(
                        1,
                        passport, 
                        DateTime.Now, 
                        DateTime.Now.AddMinutes(60),
                        false, passport);

                string encryptTicket = FormsAuthentication.Encrypt(ticket);
                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encryptTicket));
                Response.Redirect(FormsAuthentication.DefaultUrl, true);
            }
            else
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }
    }
}
