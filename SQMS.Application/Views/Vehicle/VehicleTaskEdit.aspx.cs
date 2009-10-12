using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using SQMS.Services;
using System.Data;
using EasyDev.Util;
using SQMS.Application.HtmlHelper;

namespace SQMS.Application.Views.Vehicle
{

        public partial class VehicleTaskEdit : SQMSPage<VehicleTaskService>
        {
                private VehicleTaskService srv = null;

                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void GetViewData()
                {
                        DataRow drVT = DataSetUtil.GetFirstRowFromDataSet(ViewData, Service.BOName);

                        if (drVT != null)
                        {
                                if (this.ID.Length == 0)
                                {
                                        this.ID = Service.GetNextSequenceID();
                                        drVT["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                                        drVT["CREATEDBY"] = CurrentUser.PassportID;
                                }

                                drVT["TASKID"] = this.ID;
                                drVT["TASKCODE"] = this.txtVTCode.Text;
                                drVT["TASKNAME"] = this.txtVTName.Text;

                                drVT["PUBLICTIME"] = this.txtPubTime.Text;
                                drVT["STARTTIME"] = this.txtStartTime.Text;
                                drVT["ENDTIME"] = this.txtEndTime.Text;
                                drVT["MODEL"] = this.txtMODEL.Text;
                                drVT["LICENSEPLATENUM"] = this.txtLICENSEPLATENUM.Text;

                                drVT["CHARGEMAN"] = this.refEMP.SelectedValue;
                                drVT["TASKTYPE"] = this.ddlTASKTYPE.SelectedValue;

                                drVT.SetField<string>("ISGASSUPPLIED", this.cbIsGased.Checked ? "Y" : "N");
                                drVT.SetField<string>("ISWATERSUPPLIED", this.cbIsWatered.Checked ? "Y" : "N");
                                drVT.SetField<string>("ISREPAIRED", this.cbIsRepaired.Checked ? "Y" : "N");

                                drVT["MEMO"] = this.txtMemo.Text;
                                drVT["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";
                                drVT["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                                drVT["MODIFIEDBY"] = CurrentUser.PassportID;

                        }
                }

                /// <summary>
                /// 加载视图数据
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                protected override void OnLoadDataEventHandler(object sender, EventArgs e)  //2
                {
                        this.ViewData = Service.LoadByKey(this.ID, true);
                        this.ViewData.Merge(srv.EnumService.GetEnumByType("_vt_tasktype"));
                }

                /// <summary>
                /// 初始化界面控件
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)    //3
                {
                        ControlBindingHelper.BindDropDownList(this.ddlTASKTYPE, ViewData.Tables[srv.EnumService.BOName], "enumname", "enumid");

                        if (this.ID.Length == 0)
                        {
                                //新增
                                this.txtVTCode.Text = Service.GenerateCode();
                        }
                        else
                        {
                                //编辑
                                DataRow drVT = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                                if (drVT != null)
                                {
                                        this.txtVTCode.Text = ConvertUtil.ToStringOrDefault(drVT["TASKCODE"]);
                                        this.txtVTName.Text = ConvertUtil.ToStringOrDefault(drVT["TASKNAME"]);

                                        this.txtPubTime.Text = ConvertUtil.ToStringOrDefault(drVT["PUBLICTIME"]);
                                        this.txtStartTime.Text = ConvertUtil.ToStringOrDefault(drVT["STARTTIME"]);
                                        this.txtEndTime.Text = ConvertUtil.ToStringOrDefault(drVT["ENDTIME"]);
                                        this.txtMODEL.Text = ConvertUtil.ToStringOrDefault(drVT["MODEL"]);
                                        this.txtLICENSEPLATENUM.Text = ConvertUtil.ToStringOrDefault(drVT["LICENSEPLATENUM"]);

                                        this.cbIsGased.Checked = drVT.Field<string>("ISGASSUPPLIED") == "Y";
                                        this.cbIsWatered.Checked = drVT.Field<string>("ISWATERSUPPLIED") == "Y";
                                        this.cbIsRepaired.Checked = drVT.Field<string>("ISREPAIRED") == "Y";

                                        this.refEMP.SelectedValue = ConvertUtil.ToStringOrDefault(drVT["CHARGEMAN"]);
                                        this.refEMP.SelectedText = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("EMPID", "EMPLOYEE", "EMPID",
                                            ConvertUtil.ToStringOrDefault(drVT["CHARGEMAN"])));

                                        ListItem item = this.ddlTASKTYPE.Items.FindByValue(ConvertUtil.ToStringOrDefault(drVT["TASKTYPE"]));
                                        if (null != item)
                                        {
                                                item.Selected = true;
                                        }

                                        this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drVT["ISVOID"]).Equals("Y") ? true : false;
                                        this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drVT["MEMO"]);

                                }
                        }
                }

                /// <summary>
                /// 初始化页面对象
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
                {
                        srv = Service as VehicleTaskService;
                }

                public void btnSave_Click(object sender, EventArgs e)
                {
                        try
                        {
                                this.GetViewData();
                                this.Service.Save(this.ViewData);
                        }
                        catch (Exception ex)
                        {
                                throw;
                        }

                        Response.Redirect(String.Format("VehicleTaskView.aspx?p=vtview&id={0}", this.ID));
                }

                public void btnSaveAndNew_Click(object sender, EventArgs e)
                {
                        try
                        {
                                this.GetViewData();
                                this.Service.Save(this.ViewData);
                        }
                        catch (Exception ex)
                        {
                                throw ex;
                        }

                        Response.Redirect("VehicleTaskEdit.aspx?p=vtnew");
                }
        }

}
