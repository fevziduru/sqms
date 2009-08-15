﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using log4net;
using System.Configuration;

namespace SQMS.Application
{
    public class Global : System.Web.HttpApplication
    {
        private ILog logger = LogManager.GetLogger(typeof(Global));

        protected void Application_Start(object sender, EventArgs e)
        {
            log4net.Config.DOMConfigurator.Configure();
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
            Exception ex = Server.GetLastError();
            HttpContext context = ((HttpApplication)sender).Context;
            logger.DebugFormat("[YinPSoft-Debug-{0}] - {1}", DateTime.Now.ToString(), ex.Message);
            logger.DebugFormat("[YinPSoft-Debug-{0}] - {1}", DateTime.Now.ToString(), ex.StackTrace);

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