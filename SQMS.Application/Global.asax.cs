using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using log4net;
using System.Configuration;
using EasyDev.Util;
using EasyDev.BL.Services;

namespace SQMS.Application
{
        public class Global : System.Web.HttpApplication
        {
                private ILog logger = LogManager.GetLogger(typeof(Global));

                protected void Application_Start(object sender, EventArgs e)
                {
                        log4net.Config.DOMConfigurator.Configure();

                        HttpRuntime.Cache.Remove("EasyDev_DATASOURCE_CONFIG");
                        HttpRuntime.Cache.Remove("DEFAULT_DATASOURCE");
                        HttpRuntime.Cache.Remove("DEFAULT_SCHEMA_DIR");

                    //加载业务服务
                        ServicePool.LoadServices();

                }

                protected void Session_Start(object sender, EventArgs e)
                {

                }

                protected void Application_BeginRequest(object sender, EventArgs e)
                {

                }

                protected void Application_AuthenticateRequest(object sender, EventArgs e)
                {

                }

                protected void Application_Error(object sender, EventArgs e)
                {
                        if (ConvertUtil.ToStringOrDefault(ConfigurationManager.AppSettings["global_exception_handler"]).Equals("true"))
                        {
                                Exception ex = Server.GetLastError();
                                HttpContext context = ((HttpApplication)sender).Context;
                                logger.DebugFormat("[YinPSoft-Debug-{0}] - {1}", DateTime.Now.ToString(), ex.Message);
                                logger.DebugFormat("[YinPSoft-Debug-{0}] - {1}", DateTime.Now.ToString(), ex.StackTrace);
                        }
                        //context.Response.Redirect("~/" +
                        //    ConfigurationManager.AppSettings["ErrorPage"] + "?id=" + context.Error.Message);
                }

                protected void Session_End(object sender, EventArgs e)
                {
                        Response.Redirect(FormsAuthentication.LoginUrl + "?status=q&p=__pub__", true);
                }

                protected void Application_End(object sender, EventArgs e)
                {

                }
        }
}