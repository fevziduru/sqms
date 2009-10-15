using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.Domain.QualityControl;
using EasyDev.Util;

namespace SQMS.Application.Views.Components
{
    public partial class Map : System.Web.UI.UserControl
    {
        private LatLng initLatLng = new LatLng(29.5548M, 106.5483M);
        private MonitorPointType mpType = MonitorPointType.Normal;
        private bool autoFetchMarker = true;

        public MonitorPointType MPType
        {
            get
            {
                return mpType;
            }
            set
            {
                this.mpType = value;
            }

        }
        protected string MPTypeString
        {
            get
            {
                return MonitorPointTypeString.FromEnum(this.MPType,null);
            }
        }
        /// <summary>
        /// 是否自动获取地图标记（监控点）
        /// </summary>
        public bool AutoFetchMarker
        {
            get { return autoFetchMarker; }
            set { autoFetchMarker = value; }
        }
        /// <summary>
        /// 地图初始中心经纬度
        /// </summary>
        public LatLng InitLatLng
        {
            get { return initLatLng; }
            set
            {
                initLatLng = value;
            }
        }
        /// <summary>
        /// 是否启用轨迹播放器
        /// </summary>
        public bool EnableTracePlayer
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            decimal initLat = ConvertUtil.ToLat(ConvertUtil.ToStringOrDefault(Request.QueryString["lat"]));
            decimal initLng = ConvertUtil.ToLng(ConvertUtil.ToStringOrDefault(Request.QueryString["lng"]));
            if (initLat != 0 && initLng != 0)
            {
                initLatLng = new LatLng(initLat, initLng);
            }
        }
    }
}