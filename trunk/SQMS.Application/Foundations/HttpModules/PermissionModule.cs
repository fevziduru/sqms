using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SQMS.Application.Foundations.HttpModules
{
    public class PermissionModule : IHttpModule
    {
        #region IHttpModule 成员

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public void Init(HttpApplication context)
        {
            context.AcquireRequestState += new EventHandler(context_AcquireRequestState);
            context.Error += new EventHandler(context_Error);
        }

        /// <summary>
        /// 引发未处理的异常时发生
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void context_Error(object sender, EventArgs e)
        {
            
        }

        void context_AcquireRequestState(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;    
        }

        #endregion
    }
}
