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
using SQMS.Application.HtmlHelper;
using System.Threading;

namespace SQMS.Application.Views.Security
{
    public partial class _Default : SQMSPage<PassportService>
    {
        private PassportService srv = null;
        private RoleService roleSrv = null;
        private string status = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            status = ConvertUtil.ToStringOrDefault(Request.QueryString["status"]);

            if (status == "q")
            {
                FormsAuthentication.SignOut();
                if (Session["USER_INFO"] != null)
                {
                    Session.Remove("USER_INFO");
                }
                Thread.CurrentPrincipal = null;
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, null);
                cookie.Expires = DateTime.Now.AddMinutes(-1);
                Response.Cookies.Add(cookie);

            }
        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            //this.OperationBar.Visible = false;
            srv = (PassportService)Service;
            roleSrv = ServiceManager.CreateService<RoleService>();
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ControlBindingHelper.BindDropDownList(ddlRole, roleSrv.LoadAll(), "rolename", "roleid");
            }
        }

        public void btnLogin_OnClick(object sender, EventArgs e)
        {

            string passport = this.txtPassport.Text;
            string password = this.txtPassword.Text;
            string role = this.ddlRole.SelectedValue;
            UserInfo ui = null;

            try
            {
                ui = srv.Login(passport, password, role);
            }
            catch (Exception)
            {
                throw new Exception("_login_failed");
            }

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

                if (Request.QueryString["ReturnUrl"] != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(passport, false);
                }
                else
                {
                    Response.Redirect(FormsAuthentication.DefaultUrl, true);
                }
            }
            else
            {
                Response.Redirect(FormsAuthentication.LoginUrl, true);
            }
        }
    }
}
