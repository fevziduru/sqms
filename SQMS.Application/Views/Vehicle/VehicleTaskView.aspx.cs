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

        public partial class VehicleTaskView : SQMSPage<VehicleTaskService>
        {
                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        DataRow drVT = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);

                        if (drVT != null)
                        {
                                this.lbl_code.Text = ConvertUtil.ToStringOrDefault(drVT["TASKCODE"]);
                                this.lbl_name.Text = ConvertUtil.ToStringOrDefault(drVT["TASKNAME"]);

                                this.lbl_pt.Text = ConvertUtil.ToStringOrDefault(drVT["PUBLICTIME"]);
                                this.lbl_st.Text = ConvertUtil.ToStringOrDefault(drVT["STARTTIME"]);
                                this.lbl_et.Text = ConvertUtil.ToStringOrDefault(drVT["ENDTIME"]);
                                this.lbl_vm.Text = ConvertUtil.ToStringOrDefault(drVT["MODEL"]);
                                this.lbl_ln.Text = ConvertUtil.ToStringOrDefault(drVT["LICENSEPLATENUM"]);

                                this.lblGased.Text = drVT.Field<bool>("ISGASSUPPLIED") == true ? "是" : "否";
                                this.lblWatered.Text = drVT.Field<bool>("ISWATERSUPPLIED") == true ? "是" : "否";
                                this.lblRepaired.Text = drVT.Field<bool>("ISREPAIRED") == true ? "是" : "否";

                                this.lbl_cp.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID", ConvertUtil.ToStringOrDefault(drVT["CHARGEMAN"])));

                                this.lbl_tt.Text = ConvertUtil.ToStringOrDefault(drVT["TASKTYPE"]);

                                this.lbl_isvoid.Text = ConvertUtil.ToStringOrDefault(drVT["ISVOID"]).Equals("Y") ? "禁用" : "启用";
                                this.lbl_momo.Text = ConvertUtil.ToStringOrDefault(drVT["MEMO"]);
                        }
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.ViewData = Service.LoadByKey(this.ID, true);
                }

                public void btnDelete_OnClick(object sender, EventArgs e)
                {
                        Service.DeleteByKey(this.ID);

                        Response.Redirect("VehicleTaskList.aspx?p=vtlist");
                }

                public void btnEdit_OnClick(object sender, EventArgs e)
                {
                        Response.Redirect("VehicleTaskEdit.aspx?p=vtedit&id=" + this.ID);
                }

                public void btnNew_OnClick(object sender, EventArgs e)
                {
                        Response.Redirect("VehicleTaskEdit.aspx?p=vtnew");
                }

        }


}
