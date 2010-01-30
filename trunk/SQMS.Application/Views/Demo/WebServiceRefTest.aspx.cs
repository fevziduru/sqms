using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Application.sqms_mobileinterfaces;
using SQMS.Application.sqms_filejoiner;

namespace SQMS.Application.Views.Demo
{
        public partial class WebServiceRefTest : System.Web.UI.Page
        {
                protected void Page_Load(object sender, EventArgs e)
                {
                        MobileInterfaces mobile = new MobileInterfaces();

                        FileJoinService fj = new FileJoinService();

                        
                }
        }
}
