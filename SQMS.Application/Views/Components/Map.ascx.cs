using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQMS.Application.Views.Components
{
    public partial class Map : System.Web.UI.UserControl
    {
        private IList<string[]> monitorPoints;
        
        public IList<string[]> MonitorPoints
        {
            get { return monitorPoints; }
            set { monitorPoints = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}