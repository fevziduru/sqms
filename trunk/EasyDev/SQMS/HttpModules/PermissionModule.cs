using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Data;
using EasyDev.Util;
using System.Threading;
using System.Text.RegularExpressions;

namespace EasyDev.SQMS.HttpModules
{
    public class PermissionModule : IHttpModule
    {
        #region IHttpModule 成员

        public void Dispose()
        {
            
        }

        public void Init(HttpApplication context)
        {
            context.Error += new EventHandler(context_Error);
            context.AuthenticateRequest += new EventHandler(context_AuthenticateRequest);
            context.PostAcquireRequestState += new EventHandler(context_PostAcquireRequestState);
        }

        void context_PostAcquireRequestState(object sender, EventArgs e)
        {
            HttpContext context = ((HttpApplication)sender).Context;

            HttpCookie authCookie = context.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (authCookie == null)
            {
                if (context.Request.RawUrl.Contains(FormsAuthentication.LoginUrl) == false)
                {
                    FormsAuthentication.RedirectToLoginPage("status=q");
                }
            }
            else
            {
                FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value);
                UserIdentity uid = new UserIdentity(context.User.Identity.Name);
                if (context.Session != null)
                {
                    uid.UserInfo = context.Session["USER_INFO"] as UserInfo;
                }
                Thread.CurrentPrincipal = new PassportPrincipal(uid);
            }

            if (Regex.IsMatch(context.Request.RawUrl, "/Views/Components\\.*") == false)
            {
                CheckPermission(context);
            }
        }
                
        void context_AuthenticateRequest(object sender, EventArgs e)
        {
            //HttpContext context = ((HttpApplication)sender).Context;
            
        }

        /// <summary>
        /// 引发未处理的异常时发生
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void context_Error(object sender, EventArgs e)
        {
            
        }
        #endregion

        public void CheckPermission(HttpContext context)
        {
            UserInfo ui = null;
            if (context.Session != null)
            {
                ui = context.Session["USER_INFO"] as UserInfo;

                if (ui != null)
                {
                    //查看UserInfo.UserPermission中有没有对当前资源的访问权限
                    string urlname = context.Request.RawUrl.Replace(".aspx", "");
                    string resname = urlname.Substring(urlname.LastIndexOf('/') + 1);
                    if (resname.Contains("?"))
                    {
                        resname = resname.Remove(resname.IndexOf('?'));
                    }
                    bool isAuthorized = false;

                    foreach (DataRow item in ui.Permissions.Rows)
                    {
                        //大小写敏感的比较
                        if (ConvertUtil.EmptyOrString(item["resid"]).Equals(resname))
                        {
                            isAuthorized = true;
                            break;
                        }
                    }

                    if (isAuthorized == false)
                    {
                        throw new Exception("用户没有权限访问此资源");
                    }
                }
                else
                {
                    //UserInfo失效，强制退出
                }
            }
            else
            {

            }
        }
    }
}
