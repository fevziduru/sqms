using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using EasyDev.BL;
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
        private RoadService svcRoad = null;

        private DataTable dtQC = null;
        private DataTable dtMP = null;
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
            this.svcRoad = this.svcManager.CreateService<RoadService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnInitializeViewEventHandler(sender, e);

            DataRow dr = DataSetUtil.GetFirstRowFromDataTable(this.dtQC);
            DataRow drMP = DataSetUtil.GetFirstRowFromDataTable(this.dtMP);
            if (null != dr)
            {
                string meterialUrl = ConvertUtil.ToStringOrDefault(dr["MATERIAL"]);
                this.LinkImageSource.ImageUrl = meterialUrl;
                this.LabelDataFetchTime.Text = ConvertUtil.ToStringOrDefault(dr["CREATED"]);
                this.LabelDutyMan.Text = ConvertUtil.ToStringOrDefault(dr["CHARGEPERSONNAME"]);
                this.LabelEmergencyMan.Text = ConvertUtil.ToStringOrDefault(dr["EMERGENCYPERSONNAME"]);
                this.LabelPatrolMan.Text = ConvertUtil.ToStringOrDefault(dr["CHECKPERSONNAME"]);
                this.LabelQCState.Text = ConvertUtil.ToStringOrDefault(dr["STATUSNAME"]);
                this.LabelQCType.Text = ConvertUtil.ToStringOrDefault(dr["QCTYPE"]);
                string url = "/Views/Quality/AnchorContent.aspx?qcType=" + this.QualityControlType + "&mpid=" + ConvertUtil.ToStringOrDefault(dr["MPID"]);
                this.LinkMore.NavigateUrl = "javascript:openMoreInfo('" + url + "');";
            }
            if(null !=drMP)
            {
                this.LabelMPCode.Text = ConvertUtil.ToStringOrDefault(drMP["MPCODE"]);
                this.LabelMPMemo.Text = ConvertUtil.ToStringOrDefault(drMP["MPMEMO"]);
                this.LabelMPProject.Text = ConvertUtil.ToStringOrDefault(drMP["PROJECTNAME"]);
                this.LabelMPRoad.Text = ConvertUtil.ToStringOrDefault(drMP["ROADNAME"]);

                this.LabelRoadMemo.Text = ConvertUtil.ToStringOrDefault(drMP["ROADMEMO"]);
                this.LabelRoadName.Text = ConvertUtil.ToStringOrDefault(drMP["ROADNAME"]);
                this.LabelRoadType.Text = ConvertUtil.ToStringOrDefault(drMP["ROADTYPE"]);
                this.LabelRoadProject.Text = ConvertUtil.ToStringOrDefault(drMP["PROJECTNAME"]);
            }
            if (this.QualityControlType.Equals("_qc_type_normal"))
            {
                this.divMP.Visible = true;
                this.divRoad.Visible = false;
            }
            else
            {
                this.divMP.Visible = false;
                this.divRoad.Visible = true;
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
            this.dtMP = this.svcQualityControl.GetMonitorPoint(this.MonitorPointId);

        }
       
    }
}
