using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SQMS.Application.Foundations.HttpHandlers
{
    public class FrontHandlerFactory : IHttpHandlerFactory
    {
        #region IHttpHandlerFactory 成员

        public IHttpHandler GetHandler(HttpContext context, string requestType, string url, string pathTranslated)
        {
            throw new NotImplementedException();
        }

        public void ReleaseHandler(IHttpHandler handler)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
