using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SQMS.Application.Foundations.HttpHandlers
{
    public class FrontHandler : IHttpHandler
    {
        #region IHttpHandler 成员

        public bool IsReusable
        {
            get { throw new NotImplementedException(); }
        }

        public void ProcessRequest(HttpContext context)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
