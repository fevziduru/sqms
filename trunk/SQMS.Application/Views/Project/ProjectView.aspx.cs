using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Project
{
        public partial class ProjectView : SQMSPage<ProjectService>
        {
                private ProjectService projService = null;

                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        
                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        DataRow drProject = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                        if (drProject != null)
                        {
                                this.lblProjectName.Text = ConvertUtil.ToStringOrDefault(drProject["PROJECTNAME"]);
                                this.lblProjectCode.Text = ConvertUtil.ToStringOrDefault(drProject["PROJECTCODE"]);
                                this.lblChargePerson.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID", ConvertUtil.ToStringOrDefault(drProject["EMPID"])));
                                this.lblAssistAmount.Text = ConvertUtil.ToStringOrDefault(drProject["ASSISTAMOUNT"]);
                                this.lblLeaderAmount.Text = ConvertUtil.ToStringOrDefault(drProject["LEADERAMOUNT"]);
                                this.lblViseleaderAmount.Text = ConvertUtil.ToStringOrDefault(drProject["VISELEADERAMOUNT"]);
                                this.lblTotalWorkerAmount.Text = ConvertUtil.ToStringOrDefault(drProject["TOTALWORKERAMOUNT"]);
                                this.lblTotalWorkTime.Text = ConvertUtil.ToStringOrDefault(drProject["TOTALWORKTIME"]);
                                this.lblTotalScale.Text = ConvertUtil.ToStringOrDefault(drProject["TOTALSCALE"]);
                                this.lblIsVoid.Text = ConvertUtil.ToStringOrDefault(drProject["ISVOID"]).Equals("Y") ? "禁用" : "启用";
                                this.lblMemo.Text = ConvertUtil.ToStringOrDefault(drProject["MEMO"]);
                        }
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.ViewData = Service.LoadByKey(this.ID, true);
                }

                public void btnDelete_OnClick(object sender, EventArgs e)
                {
                        Service.DeleteByKey(this.ID);
                        Response.Redirect("ProjectList.aspx?p=projectlist");
                }

                public void btnEdit_Click(object sender, EventArgs e)
                {
                        Response.Redirect("ProjectEdit.aspx?p=projectedit&id=" + this.ID);
                }

                public void btnNew_Click(object sender, EventArgs e)
                {
                        Response.Redirect("ProjectEdit.aspx?p=projectnew");
                }
        }
}
