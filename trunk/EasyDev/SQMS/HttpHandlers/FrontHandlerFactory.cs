using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using EasyDev.Util;
using System.Data;
using System.Web.Security;

namespace EasyDev.SQMS.HttpHandlers
{
    public class FrontHandlerFactory : IHttpHandlerFactory
    {
        //private string location = "";

        #region IHttpHandlerFactory 成员

        public IHttpHandler GetHandler(HttpContext context, string requestType, string url, string pathTranslated)
        {
            #region MASK
            //if (url.Equals("/Login.aspx"))
            //{
            //    return PageParser.GetCompiledPageInstance("/Views/Security/Login.aspx",
            //        context.Request.PhysicalApplicationPath + "Views\\Security\\Login.aspx", context);
            //}
            //else
            //{
            //    string targetUrl = url;
            //    if (CheckPermission(context))
            //    {
            //        targetUrl = "/View" + location + "/" + url;
            //    }
            //    else
            //    {
            //        context.Response.Redirect(FormsAuthentication.LoginUrl);
            //    }

            //    return PageParser.GetCompiledPageInstance(targetUrl,
            //        context.Request.PhysicalApplicationPath + targetUrl.TrimStart('/').Replace("/", @"\"), context);
            //}
            #endregion

            //CheckPermission(context);
            return PageParser.GetCompiledPageInstance(url, context.Request.PhysicalPath, context);
        }

        public void ReleaseHandler(IHttpHandler handler)
        {
            
        }

        #endregion
    }
}
