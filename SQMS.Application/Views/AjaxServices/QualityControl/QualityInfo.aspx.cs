using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using log4net;
using EasyDev.Util;
using SQMS.Services;
using EasyDev.BL;
using System.Data;
using Domain = SQMS.Services.Domain.QualityControl;
using SQMS.Services.Domain.QualityControl;
using System.Web.Script.Serialization;

namespace SQMS.Application.Views.AjaxServices.QualityControl
{
    public partial class QualityInfo : System.Web.UI.Page
    {
        private static readonly ILog log = LogManager.GetLogger("AjaxServicesQualityInfo");

        public static readonly string URL_PARAM_MP_ID = "mpid";
        public static readonly string URL_PARAM_QUALITY_TYPE = "type";
        public static readonly string URL_PARAM_BEGIN_TIME = "begin_time";
        public static readonly string URL_PARAM_END_TIME = "end_time";

        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string mpId = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_MP_ID]);
            string type = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_QUALITY_TYPE]);
            DateTime begin = ConvertUtil.ToDateTime(this.Request.QueryString[URL_PARAM_BEGIN_TIME]);
            DateTime end = ConvertUtil.ToDateTime(this.Request.QueryString[URL_PARAM_END_TIME]);

            DataTable dt = this.svcQualityControl.GetQualityControlInfoList(mpId, type, begin, end, null);
            IList<QualityControlInfo> list = this.createQualityInfo(dt);
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

        private IList<QualityControlInfo> createQualityInfo(DataTable dt)
        {
            List<QualityControlInfo> list = new List<QualityControlInfo>();
            foreach (DataRow dr in dt.Rows)
            {
                QualityControlInfo q = new QualityControlInfo();
                q.Created = ConvertUtil.ToDateTime(dr["created"]);
                q.CreatedBy = ConvertUtil.ToStringOrDefault(dr["createdby"]);
                q.Memo = ConvertUtil.ToStringOrDefault(dr["memo"]);
                q.EmergencyEmpName = ConvertUtil.ToStringOrDefault(dr["EMERGENCYPERSONNAME"]);
                q.EmployeeName = ConvertUtil.ToStringOrDefault(dr["CHARGEPERSONNAME"]);
                q.InspectEmpName = ConvertUtil.ToStringOrDefault(dr["CHECKPERSONNAME"]);
                q.ValidStateName = ConvertUtil.ToStringOrDefault(dr["STATUSNAME"]);
                q.Url = ConvertUtil.ToStringOrDefault(dr["MATERIAL"]);
                list.Add(q);
            }
            return list;
        }
    }
}
