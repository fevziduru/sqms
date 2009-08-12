using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Threading;
using EasyDev.SQMS;
using System.Data;

namespace SQMS.Application.Masters
{
    public partial class Main : System.Web.UI.MasterPage
    {
        /// <summary>
        /// 
        /// </summary>
        public UserInfo CurrentUser
        {
            get
            {
                UserInfo userinfo = null;
                if (Session["USER_INFO"] != null)
                {
                    userinfo = Session["USER_INFO"] as UserInfo;
                }
                else if (Thread.CurrentPrincipal.Identity.IsAuthenticated)
                {
                    UserIdentity identity = Thread.CurrentPrincipal.Identity as UserIdentity;
                    if (identity != null)
                    {
                        if (identity.UserInfo != null)
                        {
                            userinfo = identity.UserInfo;
                        }
                        else
                        {
                            //TODO: UserInfo为空的处理
                        }
                    }
                }
                else
                {
                    //TODO: UserInfo为空的处理
                }

                return userinfo;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        public void btnLogout_OnClick(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Thread.CurrentPrincipal = null;
            Session.Remove("USER_INFO");

            HttpCookie cookie = HttpContext.Current.Response.Cookies[FormsAuthentication.FormsCookieName];            
            cookie.Value = null;
            cookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(cookie);

            Response.Redirect(FormsAuthentication.LoginUrl + "?status=q", true);
        }

        protected void appNav_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
        {
            //SiteMapNode smn = e.Node.DataItem as SiteMapNode;
            
            //if (smn != null)
            //{
            //    DataRow[] keys = CurrentUser.Permissions.Select("residentity='" + smn.ResourceKey + "'");
            //    if (keys.Length == 0)
            //    { 
            //        //TODO:没有被授权，不能访问
            //        e.Node.NavigateUrl = "javascript:void(0);";
                    
            //    }
            //}
        }

        protected void appNav_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {

        }
    }
}
