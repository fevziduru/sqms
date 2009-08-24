using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Road
{
        public partial class RoadView : SQMSPage<RoadService>
        {
                private RoadService roadService = null;

                protected void Page_Load(object sender, EventArgs e)
                {
                        
                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        roadService = Service as RoadService;
                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        DataRow drRoad = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                        if (drRoad != null)
                        {
                                this.lblRoadName.Text = ConvertUtil.ToStringOrDefault(drRoad["ROADNAME"]);
                                this.lblRoadCode.Text = ConvertUtil.ToStringOrDefault(drRoad["ROADCODE"]);
                                this.lblProject.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("PROJECTNAME", "PROJECT", "PROJECTID", ConvertUtil.ToStringOrDefault(drRoad["PROJECTID"])));
                                this.lblRoadType.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("ENUMNAME", "ENUMERATION", "ENUMID", ConvertUtil.ToStringOrDefault(drRoad["ROADTYPE"])));
                                this.lblWorkTime.Text = ConvertUtil.ToStringOrDefault(drRoad["WORKTIME"]);
                                if (drRoad["BEGINTIME"].Equals(DBNull.Value))
                                {
                                        this.lblWorkBeginTime.Text = "";
                                }
                                else
                                {
                                        this.lblWorkBeginTime.Text = Convert.ToDateTime(drRoad["BEGINTIME"]).ToString("yyyy-MM-dd");
                                }

                                if (drRoad["ENDTIME"].Equals(DBNull.Value))
                                {
                                        this.lblWorkEndTime.Text = "";
                                }
                                else
                                {
                                        this.lblWorkEndTime.Text = Convert.ToDateTime(drRoad["ENDTIME"]).ToString("yyyy-MM-dd");
                                }
                                
                                this.lblWorkerNum.Text = ConvertUtil.ToStringOrDefault(drRoad["WORKERAMOUNT"]);
                                this.lblAvgWorkAmount.Text = ConvertUtil.ToStringOrDefault(drRoad["AVGWORKERAMOUNT"]);
                                this.lblIsvoid.Text = ConvertUtil.ToStringOrDefault(drRoad["ISVOID"]).Equals("Y") ? "禁用" : "启用";
                                this.lblMemo.Text = ConvertUtil.ToStringOrDefault(drRoad["MEMO"]);
                        }
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.ViewData = Service.LoadByKey(this.ID, true);
                }

                public void btnDelete_OnClick(object sender, EventArgs e)
                {
                        Service.DeleteByKey(this.ID);
                        Response.Redirect("RoadList.aspx?p=roadlist");
                }

                public void btnEdit_Click(object sender, EventArgs e)
                {
                        Response.Redirect("RoadEdit.aspx?p=roadedit&id=" + this.ID);
                }

                public void btnNew_Click(object sender, EventArgs e)
                {
                        Response.Redirect("RoadEdit.aspx?p=roadnew");
                }
        }
}
