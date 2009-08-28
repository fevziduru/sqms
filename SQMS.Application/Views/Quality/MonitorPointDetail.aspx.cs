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
using EasyDev.Util;
using System.Data;
using SQMS.Services.Domain.Common;

namespace SQMS.Application.Views.Quality
{
    public partial class MonitorPointDetail : SQMSPage<QualityControlService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;
        private ProjectService svcProject = null;
        private EmployeeService svcEmployee = null;
        private RoadService svcRoad = null;

        private DataTable dtVideo = null;
        private DataTable dtNormalQc = null;
        private DataTable dtDynamicQc = null;
        private DataTable dtMonitorPoint = null;
        private int normalQcCount = 0;
        private int dynamicQcCount = 0;
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


        protected override void  OnInit(EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
            this.svcProject = this.svcManager.CreateService<ProjectService>();
            this.svcEmployee = this.svcManager.CreateService<EmployeeService>();
            this.svcRoad = this.svcManager.CreateService<RoadService>();
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnInitializeViewEventHandler(sender, e);
            if (!IsPostBack)
            {
                this.bindListQcNormal(this.dtNormalQc);
                this.binListQcDynamic(this.dtDynamicQc);
                DataRow drMP = DataSetUtil.GetFirstRowFromDataTable(this.dtMonitorPoint);
                this.bindMPDetail(drMP);
                DataRow drQc = null;
                if (this.QualityControlType == QualityControlService.QC_TYPE_DYNAMIC)
                {
                    drQc = DataSetUtil.GetFirstRowFromDataTable(this.dtDynamicQc);
                }
                else
                {
                    drQc = DataSetUtil.GetFirstRowFromDataTable(this.dtNormalQc);
                }
                this.bindQcDetail(drQc);
                this.bindVideoTable(this.dtVideo);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);
            if (!IsPostBack)
            {
                PagingParameter pagingParam = null;
                this.initQcNormalData(pagingParam);
                this.initQcDynamicData(pagingParam);
                this.dtMonitorPoint = this.svcQualityControl.GetMonitorPoint(this.MonitorPointId);
                this.dtVideo = this.svcQualityControl.GetVideoList(this.MonitorPointId);
            }
        }
        private void initQcNormalData(PagingParameter pagingParam)
        {
            this.normalQcCount = this.svcQualityControl.GetQualityControlInfoListCount(this.MonitorPointId, QualityControlService.QC_TYPE_NORMAL);
            this.dtNormalQc = this.svcQualityControl.GetQualityControlInfoList(this.MonitorPointId, QualityControlService.QC_TYPE_NORMAL, pagingParam);
        }
        private void initQcDynamicData(PagingParameter pagingParam)
        {
            this.dynamicQcCount = this.svcQualityControl.GetQualityControlInfoListCount(this.MonitorPointId, QualityControlService.QC_TYPE_DYNAMIC);
            this.dtDynamicQc = this.svcQualityControl.GetQualityControlInfoList(this.MonitorPointId, QualityControlService.QC_TYPE_DYNAMIC, pagingParam);
        }
        private void bindMPDetail(DataRow dr)
        {
            if(null != dr)
            {
                this.LabelMPCode.Text = ConvertUtil.ToStringOrDefault(dr["MPCODE"]);
                this.LabelMPCreated.Text = ConvertUtil.ToStringOrDefault(dr["CREATED"]);
                this.LabelMPCreatedBy.Text = ConvertUtil.ToStringOrDefault(dr["CREATEDBYNAME"]);
                this.LabelMPMemo.Text = ConvertUtil.ToStringOrDefault(dr["MEMO"]);
                this.LabelMPModified.Text = ConvertUtil.ToStringOrDefault(dr["MODIFIED"]);
                this.LabelMPModifiedBy.Text = ConvertUtil.ToStringOrDefault(dr["MODIFIEDBYNAME"]);
                this.LabelMPName.Text = ConvertUtil.ToStringOrDefault(dr["MPNAME"]);
                this.LabelMPRoad.Text = ConvertUtil.ToStringOrDefault(dr["ROADNAME"]);
                this.LabelMPProject.Text = ConvertUtil.ToStringOrDefault(dr["PROJECTNAME"]);
            }
        }
        private void bindListQcNormal(DataTable dt)
        {
            this.GridViewQcNormal.DataSource = dt;
            this.GridViewQcNormal.DataBind();
            //this.PagingBarQcNormal.RowsCount = this.normalQcCount;
            //this.PagingBarQcNormal.CurrentPageChanging += new CommandEventHandler(PagingBarQcNormal_CurrentPageChanging);
            //this.DataPagerQcNormal.TotalRowCount = this.normalQcCount;
        }
        private void binListQcDynamic(DataTable dt)
        {
            this.GridViewQcDynamic.DataSource = dt;
            this.GridViewQcDynamic.DataBind();
        }
        private void bindQcDetail(DataRow dr)
        {
            if (null != dr)
            {
                string url = ConvertUtil.ToStringOrDefault(dr["MATERIAL"]);
                this.LinkImageSource.ImageUrl = url;
                this.LabelDataFetchTime.Text = ConvertUtil.ToStringOrDefault(dr["CREATED"]);
                this.LabelDutyMan.Text = ConvertUtil.ToStringOrDefault(dr["CHARGEPERSONNAME"]);
                this.LabelEmergencyMan.Text = ConvertUtil.ToStringOrDefault(dr["EMERGENCYPERSONNAME"]);
                this.LabelMPName.Text = ConvertUtil.ToStringOrDefault(dr["MPNAME"]);
                this.LabelPatrolMan.Text = ConvertUtil.ToStringOrDefault(dr["CHECKPERSONNAME"]);
                this.LabelQCState.Text = ConvertUtil.ToStringOrDefault(dr["STATUSNAME"]);
                this.LabelQCType.Text = ConvertUtil.ToStringOrDefault(dr["QCTYPE"]);
            }
        }
        protected void LnkBtnQc_Command(object sender, CommandEventArgs e)
        {
            DataTable dt = this.svcQualityControl.GetQualityControlInfo(ConvertUtil.ToStringOrDefault(e.CommandArgument));
            DataRow dr = DataSetUtil.GetFirstRowFromDataTable(dt);
            this.bindQcDetail(dr);
            this.UpdatePanelQcInfo.Update();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            DateTime begin = ConvertUtil.ToDateTime(this.TextBoxBeginTime.Text);
            DateTime end = ConvertUtil.ToDateTime(this.TextBoxEndTime.Text);
            string qcType = ConvertUtil.ToStringOrDefault(this.HiddenFieldQcType.Value);
            DataTable dt = this.svcQualityControl.GetQualityControlInfoList(this.MonitorPointId, qcType, begin, end, null);
            if (QualityControlService.QC_TYPE_DYNAMIC == qcType)
            {
                this.binListQcDynamic(dt);
                this.UpdatePanelQcListDynamic.Update();
            }
            else if(QualityControlService.QC_TYPE_NORMAL == qcType)
            {
                this.bindListQcNormal(dt);
                this.UpdatePanelQcListNormal.Update();
            }
            
        }

        private void bindVideoTable(DataTable dt)
        {
            this.GridViewVideo.DataSource = dt;
            this.GridViewVideo.DataBind();
        }
    }
}
