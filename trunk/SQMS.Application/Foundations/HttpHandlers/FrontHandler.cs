using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SQMS.Application.Foundations.HttpHandlers
{
    public class FrontHandler : IHttpHandler
    {
        private string VirtualUrl = "";

        public FrontHandler(string url)
        {
            VirtualUrl = url;
        }

        #region IHttpHandler 成员

        public bool IsReusable
        {
            get { throw new NotImplementedException(); }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Server.Transfer(VirtualUrl);            
        }

        #endregion
    }
}
