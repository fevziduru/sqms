using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using EasyDev.BL;
using SQMS.Services;
using SQMS.Services.Domain.Vehicle;
using System.Data;
using System.Web.Script.Serialization;
using EasyDev.Util;

namespace SQMS.Application.Views.AjaxServices.VehicleMission
{
    public partial class VehicleMission : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger("AjaxServicesVehicleMission");
        public static readonly string URL_PARAM_TASKID = "taskid";

        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private VehicleMissionService svcVehicleMission = null;
        


        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcVehicleMission = this.svcManager.CreateService<VehicleMissionService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string taskId = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_TASKID]);
            VehicleTask obj = this.svcVehicleMission.GetVehicleTaskObj(taskId);

            string json = String.Empty;
            try
            {
                JavaScriptSerializer s = new JavaScriptSerializer();
                json = s.Serialize(obj);
            }
            catch (Exception exp)
            {
                log.Error(exp.ToString());
            }
            this.Response.Clear();
            this.Response.Write(json);
        }
    }
}
