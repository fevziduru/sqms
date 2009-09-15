using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using System.Data;
using EasyDev.Util;
using SQMS.Application.HtmlHelper;

namespace SQMS.Application.Views.Road
{
        public partial class RoadView : SQMSPage<RoadService>
        {
                private RoadService roadService = null;

                protected void Page_Load(object sender, EventArgs e)
                {
                        if (!Page.IsPostBack)
                        {
                                this.gvList.Attributes.Add("SortExpression", "MPID");
                                this.gvList.Attributes.Add("SortDirection", "ASC");
                        }
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
                                this.lblScale.Text = ConvertUtil.ToStringOrDefault(drRoad["SCALE"]);
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

                        DataTable dtMP = this.ViewData.Tables["MONITORPOINTS"];
                        if (dtMP != null)
                        {
                                this.gvList.DataSource = dtMP;
                                this.gvList.DataBind();
                        }

                        if (!IsPostBack)
                        {
                                ControlBindingHelper.BindDropDownList(this.ddlTimeSchema, ViewData.Tables["TIMESCHEMA"], "SCHEMANAME", "SCHEMAID");
                        }

                        hlPreview.Text = "预览时间段设置";
                }

                protected void Preview_Click(object sender, EventArgs e)
                {
                        Response.Redirect("~/Views/Quality/TimeSchemaView.aspx?p=timeschemaview&id=" + this.ddlTimeSchema.SelectedValue, true);
                }

                protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
                {
                        switch (e.CommandName)
                        {
                                case "Select":
                                        {
                                                DataKey key = this.gvList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                                                string id = ConvertUtil.ToStringOrDefault(key.Value);
                                                Response.Redirect("RoadEdit.aspx?p=roadedit&id=" + id);
                                                break;
                                        }
                                case "Sort":

                                default: break;
                        }
                }

                protected void gvList_Sorting(object sender, GridViewSortEventArgs e)
                {
                        // 从事件参数获取排序数据列
                        string sortExpression = e.SortExpression.ToString();

                        // 假定为排序方向为“顺序”
                        string sortDirection = "ASC";

                        // “ASC”与事件参数获取到的排序方向进行比较，进行GridView排序方向参数的修改
                        if (sortExpression == this.gvList.Attributes["SortExpression"])
                        {
                                //获得下一次的排序状态
                                sortDirection = (this.gvList.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
                        }

                        // 重新设定GridView排序数据列及排序方向
                        this.gvList.Attributes["SortExpression"] = sortExpression;
                        this.gvList.Attributes["SortDirection"] = sortDirection;

                        DataView dv = this.ViewData.Tables["MONITORPOINTS"].DefaultView;
                        dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
                        this.gvList.DataSource = dv;
                        this.gvList.DataBind();
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        this.ViewData = Service.LoadByKey(this.ID, true);
                        this.ViewData.Merge(roadService.GetMonitorPointsByRoad(this.ID));
                        this.ViewData.Merge(roadService.TimeSchemaService.LoadByCondition("organizationid='" + CurrentUser.OrganizationID + "'"));
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

                protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
                {
                       
                }

                protected void btnSetTimeSchema_Click(object sender, EventArgs e)
                {
                        try
                        {
                                string[] ids = ConvertUtil.ToStringOrDefault(Request.Params["__KeyValues__"]).Split(',');
                                string timeschemaid = this.ddlTimeSchema.SelectedValue;
                                if (timeschemaid != null && timeschemaid.Length > 0)
                                {
                                        for (int i = 0; i < ids.Length; i++)
                                        {
                                                roadService.mpService.UpdateMonitorPointTimeSchema(timeschemaid, ids[i]);
                                        }
                                }

                                if (this.ViewData.Tables.Contains("MONITORPOINTS"))
                                {
                                        this.ViewData.Tables.Remove("MONITORPOINTS");
                                }

                                this.ViewData.Merge(roadService.GetMonitorPointsByRoad(this.ID));

                                this.gvList.DataSource = this.ViewData.Tables["MONITORPOINTS"];
                                this.gvList.DataBind();
                        }
                        catch (Exception ex)
                        {
                                throw ex;
                        }
                }

                protected void gvList_SelectedIndexChanged(object sender, EventArgs e)
                {

                }

                protected void gvList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
                {
                        
                }

                protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
                {
                        this.gvList.PageIndex = e.NewPageIndex;
                        this.gvList.DataSource = this.ViewData.Tables["MONITORPOINTS"];
                        this.gvList.DataBind();
                }
        }
}
