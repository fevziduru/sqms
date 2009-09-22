using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.BL;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Quality
{
    /// <summary>
    /// 应急事件监控页面
    /// </summary>
    public partial class EmergencyMonitor : SQMSPage<EmergencyEventService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;
        private EmergencyEventService svcEvent = null;
        private DataTable dtEvents = null;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
            this.svcEvent = this.svcManager.CreateService<EmergencyEventService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        /// <summary>
        /// 加载数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.dtEvents = this.svcEvent.GetEventList();
        }
        /// <summary>
        /// 绑定数据到界面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            this.BindEventList(this.dtEvents);
        }

        protected void BindEventList(DataTable dt)
        {
            this.GridViewEvents.DataSource = dt;
            this.GridViewEvents.DataBind();
        }
        /// <summary>
        /// 绑定视频列表
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LinkBtnEventName_Command(object sender, CommandEventArgs e)
        {
            DataTable dtVideo = this.svcEvent.GetEventVideoList(e.CommandArgument.ToString());
            this.GridViewVideo.DataSource = dtVideo;
            this.GridViewVideo.DataBind();
            this.UpdatePanelVideoList.Update();
        }

        protected void GridViewEvents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drView = (DataRowView)e.Row.DataItem;
                DataRow dr = drView.Row;
                string eventId = ConvertUtil.ToStringOrDefault(dr["EVENTID"]);
                string mpId = ConvertUtil.ToStringOrDefault(dr["STARTMPID"]);
                LinkButton lnkBtn = (LinkButton)e.Row.Controls[0].Controls[1];
                lnkBtn.OnClientClick = "setToEvent('"+eventId+"','"+mpId+"');";
            }
        }

        protected void HiddenEventDateFilter_ValueChanged(object sender, EventArgs e)
        {
            this.dtEvents = this.svcEvent.GetEventList(this.HiddenEventDateFilter.Value);
            this.BindEventList(dtEvents);
            this.UpdatePanelEvents.Update();
            this.HiddenEventDateFilter.Value = "";
        }
    }
}
