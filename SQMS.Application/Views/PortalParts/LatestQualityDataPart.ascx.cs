using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Application.Foundation;
using SQMS.Services;

namespace SQMS.Application.Views.PortalParts
{
        public partial class LatestQualityDataPart : SQMSUserControl<QualityControlService>
        {
                private QualityControlService srv = null;

                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        srv = Service as QualityControlService;
                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        ViewData = srv.GetPortalPartData();
                }
        }
}