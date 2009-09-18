using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

namespace SQMS.PortalServices.Analysis
{
        /// <summary>
        /// DemoService 的摘要说明
        /// </summary>
        [WebService(Namespace = "http://tempuri.org/")]
        [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
        [System.ComponentModel.ToolboxItem(false)]
        // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
         [ScriptService]
        public class DemoService : System.Web.Services.WebService
        {
                [WebMethod]
                [ScriptMethod]
                public string GetData()
                {
                        return @"[
		                        { month: 'January', rent: 880.00, utilities: 894.68 },
		                        { month: 'February', rent: 880.00, utilities: 901.35 },
		                        { month: 'March', rent: 880.00, utilities: 889.32 },
		                        { month: 'April', rent: 880.00, utilities: 884.71 },
		                        { month: 'May', rent: 910.00, utilities: 879.811 },
		                        { month: 'June', rent: 910.00, utilities: 897.95 }
	                                ];";
                }
        }
}
