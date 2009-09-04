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

        private bool autoFetchMarker = true;
        /// <summary>
        /// 是否自动获取地图标记（监控点）
        /// </summary>
        public bool AutoFetchMarker
        {
            get { return autoFetchMarker; }
            set { autoFetchMarker = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}