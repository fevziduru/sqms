using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using EasyDev.BL;
using SQMS.Services;

namespace SQMS.Application.Views.AjaxServices.VehicleMission
{
    public partial class VehicleMission : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger("AjaxServicesVehicleMission");
        public static readonly string URL_PARAM_SW_LAT = "swlat";
        public static readonly string URL_PARAM_SW_LNG = "swlng";
        public static readonly string URL_PARAM_NE_LAT = "nelat";
        public static readonly string URL_PARAM_NE_LNG = "nelng";
        public static readonly string URL_PARAM_MPID = "mpid";
        public static readonly string URL_PARAM_ROADID = "roadid";
        public static readonly string URL_PARAM_EVENTID = "eventid";
        public static readonly string URL_PARAM_MPTYPE = "mptype";

        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private VehicleMissionService svcVehicleMission = null;
        


        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcVehicleMission = this.svcManager.CreateService<VehicleMissionService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //string roadId = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_ROADID]);
            //string eventId = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_EVENTID]);
            //string mpType = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_MPTYPE]);
            //if (String.IsNullOrEmpty(mpType) || (!"_mp_type_road".Equals(mpType) && !"_mp_type_event".Equals(mpType)))
            //{
            //    mpType = "_mp_type_road";
            //}
            //string mpid = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_MPID]);
            //decimal swlat = ConvertUtil.ToLat(this.Request.QueryString[URL_PARAM_SW_LAT]);
            //decimal swlng = ConvertUtil.ToLng(this.Request.QueryString[URL_PARAM_SW_LNG]);
            //decimal nelat = ConvertUtil.ToLat(this.Request.QueryString[URL_PARAM_NE_LAT]);
            //decimal nelng = ConvertUtil.ToLng(this.Request.QueryString[URL_PARAM_NE_LNG]);

            //LatLng sw = new LatLng(swlat, swlng);
            //LatLng ne = new LatLng(nelat, nelng);

            //LatLngBounds bound = new LatLngBounds(sw, ne);
            //DataTable dt = null;
            //if (!String.IsNullOrEmpty(mpid))
            //{
            //    dt = this.svcQualityControl.GetMonitorPoint(mpid);
            //}
            //else if (!String.IsNullOrEmpty(roadId))
            //{
            //    dt = this.svcQualityControl.GetMonitorPointList(roadId);
            //}
            //else if (!String.IsNullOrEmpty(eventId))
            //{
            //    dt = this.svcQualityControl.GetMonitorPointList(eventId, "_mp_type_event");
            //}
            //else
            //{
            //    dt = this.svcQualityControl.GetMonitorPointInLatLngBounds(bound, mpType);
            //}

            //IList<Domain.MonitorPoint> list = this.svcQualityControl.CreateMonitorPointList(dt);

            //string json = String.Empty;
            //try
            //{
            //    JavaScriptSerializer s = new JavaScriptSerializer();
            //    json = s.Serialize(list);
            //}
            //catch (Exception exp)
            //{
            //    log.Error(exp.ToString());
            //}
            //this.Response.Clear();
            //this.Response.Write(json);
        }
    }
}
