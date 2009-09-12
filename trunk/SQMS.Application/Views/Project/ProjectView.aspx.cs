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
                        if (!Page.IsPostBack)
                        {
                                this.gvRoadList.Attributes.Add("SortExpression", "ROADID");
                                this.gvRoadList.Attributes.Add("SortDirection", "ASC");
                        }
                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        projService = Service as ProjectService;
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

                        DataTable dtRoad = this.ViewData.Tables["ROADS"];
                        if (dtRoad != null)
                        {
                                this.gvRoadList.DataSource = dtRoad;
                                this.gvRoadList.DataBind();
                        }
                }

                protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
                {
                        switch (e.CommandName)
                        {
                                case "Select":
                                        {
                                                DataKey key = this.gvRoadList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                                                string id = ConvertUtil.ToStringOrDefault(key.Value);
                                                Response.Redirect("RoadEdit.aspx?p=roadedit&id=" + id);
                                                break;
                                        }
                                case "Sort":

                                default: break;
                        }
                }

                protected void gvRoadList_Sorting(object sender, GridViewSortEventArgs e)
                {
                        // 从事件参数获取排序数据列
                        string sortExpression = e.SortExpression.ToString();

                        // 假定为排序方向为“顺序”
                        string sortDirection = "ASC";

                        // “ASC”与事件参数获取到的排序方向进行比较，进行GridView排序方向参数的修改
                        if (sortExpression == this.gvRoadList.Attributes["SortExpression"])
                        {
                                //获得下一次的排序状态
                                sortDirection = (this.gvRoadList.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
                        }

                        // 重新设定GridView排序数据列及排序方向
                        this.gvRoadList.Attributes["SortExpression"] = sortExpression;
                        this.gvRoadList.Attributes["SortDirection"] = sortDirection;

                        DataView dv = this.ViewData.Tables["ROADS"].DefaultView;
                        dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
                        this.gvRoadList.DataSource = dv;
                        this.gvRoadList.DataBind();
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.ViewData = Service.LoadByKey(this.ID, true);
                        this.ViewData.Merge(projService.GetRoadsOfProject(this.ID));
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

                protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
                {
                        this.gvRoadList.PageIndex = e.NewPageIndex;
                        this.gvRoadList.DataSource = this.ViewData.Tables["ROADS"];
                        this.gvRoadList.DataBind();
                }
        }
}
