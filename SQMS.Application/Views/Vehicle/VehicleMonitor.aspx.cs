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
using SQMS.Services.Domain.Vehicle;

namespace SQMS.Application.Views.Vehicle
{
        public partial class VehicleMonitor : SQMSPage<VehicleMissionService>
        {
                private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
                private QualityControlService svcQualityControl = null;
                private VehicleMissionService svcVehicleTask = null;
                private DataTable dtVehicleTasks = null;

                protected void Page_Init(object sender, EventArgs e)
                {
                        this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
                        this.svcVehicleTask = this.svcManager.CreateService<VehicleMissionService>();
                }

                protected void Page_Load(object sender, EventArgs e)
                {
                        this.OperationBar.Visible = false;
                }
                /// <summary>
                /// 加载数据
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.dtVehicleTasks = this.svcVehicleTask.GetVehicleTaskList();
                }
                /// <summary>
                /// 绑定数据到界面
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        this.BindVehicleTaskList(this.dtVehicleTasks);
                }

                protected void BindVehicleTaskList(DataTable dt)
                {
                        this.GridViewVehicleTasks.DataSource = dt;
                        this.GridViewVehicleTasks.DataBind();
                }

                /// <summary>
                /// 绑定视频列表
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                protected void LinkBtnVehicleTaskName_Command(object sender, CommandEventArgs e)
                {
                        VehicleTask obj = this.svcVehicleTask.GetVehicleTaskObj(ConvertUtil.ToStringOrDefault(e.CommandArgument));
                        this.LabelChargeMan.Text = obj.ChargeMan;
                        this.LabelEndTime.Text = obj.EndTime.ToString();
                        this.LabelIsGasSupplied.Text = (obj.IsGasSupplied == true) ? "是" : "否";
                        this.LabelIsRepaired.Text = (obj.IsRepaired == true) ? "是" : "否";
                        this.LabelIsWaterSupplied.Text = (obj.IsWaterSupplied == true) ? "是" : "否";
                        this.LabelLicensePlateNum.Text = obj.LicensePlateNum;
                        this.LabelModel.Text = obj.Model;
                        this.LabelPublicTime.Text = obj.PublicTime.ToString();
                        this.LabelStartTime.Text = obj.StartTime.ToString();
                        this.LabelTaskName.Text = obj.TaskName;

                        this.UpdatePanelTaskInfo.Update();
                }

                protected void GridViewVehicleTasks_RowDataBound(object sender, GridViewRowEventArgs e)
                {
                        if (e.Row.RowType == DataControlRowType.DataRow)
                        {
                                DataRowView drView = (DataRowView)e.Row.DataItem;
                                DataRow dr = drView.Row;
                                string vehicleTaskId = ConvertUtil.ToStringOrDefault(dr["TASKID"]);
                                LinkButton lnkBtn = (LinkButton)e.Row.Controls[0].Controls[1];
                                lnkBtn.OnClientClick = "setToVehicleTask('" + vehicleTaskId + "');";
                        }
                }

                protected void HiddenVehicleTaskDateFilter_ValueChanged(object sender, EventArgs e)
                {
                        this.dtVehicleTasks = this.svcVehicleTask.GetVehicleTaskList(this.HiddenVehicleTaskDateFilter.Value);
                        this.BindVehicleTaskList(dtVehicleTasks);
                        this.UpdatePanelVehicleTasks.Update();
                        this.HiddenVehicleTaskDateFilter.Value = "";
                }
        }
}
