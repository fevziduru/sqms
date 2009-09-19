using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using SQMS.Application.Foundation;

namespace SQMS.Application.Views.PortalParts
{
        public partial class MonitorPointScoreKPIPart : SQMSUserControl<MonitorPointService>
        {
                private MonitorPointService srv = null;

                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        srv = Service as MonitorPointService;
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.ViewData = srv.GetPortalPartData();
                }
        }
}