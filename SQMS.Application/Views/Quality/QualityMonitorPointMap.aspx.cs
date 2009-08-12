using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using EasyDev.BL.Services;
using SQMS.Services.QualityControl;
using SQMS.Services;
using System.Data;
using EasyDev.Util;
using SQMS.Services.Domain.Common;

namespace SQMS.Application.Views.Quality
{
    public partial class QualityMonitorPointMap : SQMSPage<QualityControlService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;
        private ProjectService svcProject = null;
        private EmployeeService svcEmployee = null;
        private RegionService svcRegion = null;

        private DataTable dtQC = null;
        protected string MonitorPointId
        {
            get
            {
                return ConvertUtil.ToStringOrDefault(this.Request.QueryString["mpid"]);
            }
        }
        protected string QualityControlType
        {
            get
            {
                return ConvertUtil.ToStringOrDefault(this.Request.QueryString["qctype"]);
            }
        }


        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
            this.svcProject = this.svcManager.CreateService<ProjectService>();
            this.svcEmployee = this.svcManager.CreateService<EmployeeService>();
            this.svcRegion = this.svcManager.CreateService<RegionService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnInitializeViewEventHandler(sender, e);

            DataRow dr = DataSetUtil.GetFirstRowFromDataTable(this.dtQC);
            if (null != dr)
            {
                string meterialUrl = ConvertUtil.ToStringOrDefault(dr["MATERIAL"]);
                this.LinkImageSource.ImageUrl = meterialUrl;
                this.LabelDataFetchTime.Text = ConvertUtil.ToStringOrDefault(dr["CREATED"]);
                this.LabelDutyMan.Text = ConvertUtil.ToStringOrDefault(dr["CHARGEPERSONNAME"]);
                this.LabelEmergencyMan.Text = ConvertUtil.ToStringOrDefault(dr["EMERGENCYPERSONNAME"]);
                this.LabelMPLat.Text = ConvertUtil.ToStringOrDefault(dr["MPLAT"]);
                this.LabelMPLng.Text = ConvertUtil.ToStringOrDefault(dr["MPLNG"]);
                this.LabelMPName.Text = ConvertUtil.ToStringOrDefault(dr["MPNAME"]);
                this.LabelPatrolMan.Text = ConvertUtil.ToStringOrDefault(dr["CHECKPERSONNAME"]);
                this.LabelQCCrood.Text = ConvertUtil.ToStringOrDefault(dr["LONGITUDE"]) + "," + ConvertUtil.ToStringOrDefault(dr["LATITUDE"]);
                this.LabelQCState.Text = ConvertUtil.ToStringOrDefault(dr["STATUSNAME"]);
                this.LabelQCType.Text = ConvertUtil.ToStringOrDefault(dr["QCTYPE"]);
                string url = "/Views/Quality/MonitorPointDetail.aspx?qcType="+this.QualityControlType+"&mpid=" + ConvertUtil.ToStringOrDefault(dr["MPID"]);
                this.LinkMore.NavigateUrl = "javascript:openMoreInfo('" + url + "');";
            }
        }
        protected override void GetViewData()
        {
            base.GetViewData();
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);
            this.dtQC = this.svcQualityControl.GetLatestQualityControlInfo(this.MonitorPointId,this.QualityControlType);

        }
       
    }
}
