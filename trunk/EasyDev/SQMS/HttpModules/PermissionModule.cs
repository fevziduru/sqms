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
using System.Configuration;

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
            context.PostAcquireRequestState += new EventHandler(context_PostAcquireRequestState);
            context.Error += new EventHandler(context_Error);
        }

        /// <summary>
        /// 出错处理机制
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void context_Error(object sender, EventArgs e)
        {
            HttpContext context = ((HttpApplication)sender).Context;
            context.Response.Redirect("~/" + 
                ConfigurationManager.AppSettings["ErrorPage"] + "?id=" + context.Error.Message);
        }

        void context_PostAcquireRequestState(object sender, EventArgs e)
        {
            HttpContext context = ((HttpApplication)sender).Context;
            HttpCookie authCookie = context.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (authCookie == null)
            {
                //if (context.Request.RawUrl.Contains(FormsAuthentication.LoginUrl) == false)
                //{
                //    FormsAuthentication.RedirectToLoginPage();
                //}
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

                //判断有没有权限访问当前页
                if (Regex.IsMatch(context.Request.RawUrl, 
                    "/Views/Security\\.*|/Views/Components\\.*|/Views/External\\.*") == false)
                {
                    CheckPermission(context);
                }
            }
        }
        #endregion

        public void CheckPermission(HttpContext context)
        {
            UserInfo ui = null;
            try
            {
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
                            //将当前请求中的页面名称与用户权限信息中的VIEWNAME字段比较
                            if (ConvertUtil.ToStringOrDefault(
                                item["viewname"]).Equals(resname, StringComparison.CurrentCultureIgnoreCase))
                            {
                                isAuthorized = true;
                                break;
                            }
                        }

                        if (isAuthorized == false)
                        {
                            throw new Exception("_no_permission");
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
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
