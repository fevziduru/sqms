using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.BL;
using Domain = SQMS.Services.Domain.QualityControl;
using System.Data;
using EasyDev.Util;
using SQMS.Services.Domain.QualityControl;
using System.Web.Script.Serialization;
using log4net;

namespace SQMS.Application.View.AjaxServices.QualityControl
{
    public partial class MonitorPoint : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger("AjaxServicesMonitorPoint");
        public static readonly string URL_PARAM_SW_LAT = "swlat";
        public static readonly string URL_PARAM_SW_LNG = "swlng";
        public static readonly string URL_PARAM_NE_LAT = "nelat";
        public static readonly string URL_PARAM_NE_LNG = "nelng";
        public static readonly string URL_PARAM_MPID = "mpid";

        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;


        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string mpid = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_MPID]);
            decimal swlat = ConvertUtil.ToLat(this.Request.QueryString[URL_PARAM_SW_LAT]);
            decimal swlng = ConvertUtil.ToLng(this.Request.QueryString[URL_PARAM_SW_LNG]);
            decimal nelat = ConvertUtil.ToLat(this.Request.QueryString[URL_PARAM_NE_LAT]);
            decimal nelng = ConvertUtil.ToLng(this.Request.QueryString[URL_PARAM_NE_LNG]);

            LatLng sw = new LatLng(swlat, swlng);
            LatLng ne = new LatLng(nelat, nelng);

            LatLngBounds bound = new LatLngBounds(sw, ne);
            DataTable dt = this.svcQualityControl.GetMonitorPointInLatLngBounds(bound);

            IList<Domain.MonitorPoint> list = this.CreateMonitorPointList(dt);

            string json = String.Empty;
            try
            {
                JavaScriptSerializer s = new JavaScriptSerializer();
                json = s.Serialize(list);
            }
            catch (Exception exp)
            {
                log.Error(exp.ToString());
            }
            this.Response.Clear();
            this.Response.Write(json);
        }

        protected IList<Domain.MonitorPoint> CreateMonitorPointList(DataTable dt)
        {
            IList<Domain.MonitorPoint> list = new List<Domain.MonitorPoint>();
            foreach (DataRow dr in dt.Rows)
            {
                Domain.MonitorPoint mp = new Domain.MonitorPoint();
                mp.Created = ConvertUtil.ToDateTime(dr["Created"]);
                mp.CreatedBy = ConvertUtil.ToStringOrDefault(dr["CreatedBy"]);
                mp.Lat = ConvertUtil.ToLat(dr["LATITUDE"]);
                mp.Lng = ConvertUtil.ToLng(dr["LONGITUDE"]);
                mp.Memo = ConvertUtil.ToStringOrDefault(dr["MEMO"]);
                mp.Modified = ConvertUtil.ToDateTime(dr["Modified"]);
                mp.ModifiedBy = ConvertUtil.ToStringOrDefault(dr["ModifiedBy"]);
                mp.MonitorPointCode = ConvertUtil.ToStringOrDefault(dr["MPCODE"]);
                mp.MonitorPointId = ConvertUtil.ToStringOrDefault(dr["MPID"]);
                mp.MonitorPointName = ConvertUtil.ToStringOrDefault(dr["MPNAME"]);
                mp.OrganizationId = "";
                mp.RoadId = "";
                mp.Level = ConvertUtil.ToInt(dr["MPLEVEL"]);
                mp.LastestQCLevel = ConvertUtil.ToInt(dr["LATESTQCLEVEL"]);
                list.Add(mp);
            }
            return list;
        }
    }
}
