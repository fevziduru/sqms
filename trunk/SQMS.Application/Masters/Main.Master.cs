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
using EasyDev.BL;
using SQMS.Services;
using EasyDev.Util;

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
                                                        Response.Redirect(FormsAuthentication.LoginUrl + "?status=q&p=__pub__", true);
                                                }
                                        }
                                }
                                else
                                {
                                        //TODO: UserInfo为空的处理
                                        Response.Redirect(FormsAuthentication.LoginUrl + "?status=q&p=__pub__", true);
                                }

                                return userinfo;
                        }
                }

                private MenuService srv = null;
                private DataTable dtMenu = null;

                protected void Page_Load(object sender, EventArgs e)
                {
                        NativeServiceManager sm = ServiceManagerFactory.CreateNativeServiceManager();
                        srv = sm.CreateService<MenuService>();

                        if (!Page.IsPostBack)
                        {
                                dtMenu = srv.GetMenuData();
                                ViewState.Add("MENU", dtMenu);
                                this.tvMenu.Nodes.Clear();
                                CreateMenu(tvMenu.Nodes, dtMenu, "_app");
                        }
                        else
                        {
                                dtMenu = ViewState["MENU"] as DataTable;
                        }                        
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

                /// <summary>
                /// 构造树形菜单
                /// </summary>
                /// <param name="nodes"></param>
                /// <param name="dt"></param>
                /// <param name="pid"></param>
                private void CreateMenu(TreeNodeCollection nodes, DataTable dt, string pid)
                {
                        string filter = string.Format("parentmenu='{0}'", pid);
                        DataRow[] subdrSet = dt.Select(filter);
                        TreeNode node;

                        if (CurrentUser != null)
                        {
                                foreach (DataRow item in subdrSet)
                                {
                                        DataRow[] drResult =
                                            CurrentUser.Permissions.Select("residentity='" + ConvertUtil.ToStringOrDefault(item["resourcekey"]) + "'");
                                        node = new TreeNode();
                                        if (ConvertUtil.ToStringOrDefault(item["itemorder"]).Length > 1)
                                        {
                                                if (drResult.Length > 0)
                                                {
                                                        node.Text = Convert.ToString(item["title"]);
                                                        node.Value = Convert.ToString(item["menuid"]);
                                                        node.NavigateUrl = Convert.ToString(item["url"]);
                                                        node.ToolTip = Convert.ToString(item["title"]);
                                                        nodes.Add(node);
                                                }
                                                else
                                                {

                                                }
                                        }
                                        else
                                        {
                                                node.Text = Convert.ToString(item["title"]);
                                                node.Value = Convert.ToString(item["menuid"]);
                                                node.NavigateUrl = Convert.ToString(item["url"]);
                                                node.ToolTip = Convert.ToString(item["title"]);
                                                nodes.Add(node);
                                        }

                                        CreateMenu(node.ChildNodes, dt, node.Value);

                                        if (node.ChildNodes.Count == 0 && ConvertUtil.ToStringOrDefault(item["type"]).Equals("_func"))
                                        {
                                                this.tvMenu.Nodes.Remove(node);
                                        }
                                }
                        }
                        else
                        {
                                //如果UserInfo为空则返回登录页
                                Response.Redirect(FormsAuthentication.LoginUrl + "?status=q&p=__pub__", true);
                        }
                }
        }
}