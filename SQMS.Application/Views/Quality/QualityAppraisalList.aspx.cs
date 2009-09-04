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

namespace SQMS.Application.Views.Quality
{
        public partial class QualityAppraisalList : SQMSPage<QualityControlService>
        {
                private QualityControlService srv = null;

                protected void Page_Load(object sender, EventArgs e)
                {
                        if (!Page.IsPostBack)
                        {
                                this.gvList.Attributes.Add("SortExpression", "QMID");
                                this.gvList.Attributes.Add("SortDirection", "ASC");
                        }
                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        srv = Service as QualityControlService;
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        DataSet tmp = new DataSet();
                        tmp.Tables.Add(srv.FindQualityData(this.ID, "__all__"));
                        this.ViewData = tmp;
                        this.ViewData.Merge(srv.EnumService.GetEnumByType("_qc_type"));
                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        this.gvList.DataSource = this.ViewData;
                        this.gvList.DataBind();

                        ControlBindingHelper.BindDropDownList(this.ddlMonitorType, ViewData.Tables[srv.EnumService.BOName], "enumname", "enumid");
                        this.ddlMonitorType.Items.Add(new ListItem("所有", "__all__"));
                        this.ddlMonitorType.Items.FindByValue("__all__").Selected = true;
                }

                protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
                {
                        switch (e.CommandName)
                        {
                                case "Select":           //跳转到质量评估浏览页面
                                        {
                                                DataKey key = this.gvList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                                                string id = ConvertUtil.ToStringOrDefault(key.Value);
                                                Response.Redirect("QualityAppraisal.aspx?p=qualityappraisal&id=" + id + "&mpid=" + this.ID);
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

                        DataView dv = this.ViewData.Tables[Service.BOName].DefaultView;
                        dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
                        this.gvList.DataSource = dv;
                        this.gvList.DataBind();
                }

                protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
                {
                        this.gvList.PageIndex = e.NewPageIndex;

                        DataView dv = this.ViewData.Tables[Service.BOName].DefaultView;
                        string sortExpression = this.gvList.Attributes["SortExpression"].ToString();
                        string sortDirection = this.gvList.Attributes["SortDirection"].ToString();

                        dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
                        this.gvList.DataSource = dv;
                        this.gvList.DataBind();
                }

                protected void ddlMonitorType_SelectedIndexChanged(object sender, EventArgs e)
                {
                        string type = this.ddlMonitorType.SelectedValue;

                        if (this.ViewData.Tables.Contains(srv.BOName))
                        {
                                this.ViewData.Tables.Remove(srv.BOName);
                        }

                        this.ViewData.Merge(srv.FindQualityData(this.ID, type));

                        this.gvList.DataSource = ViewData.Tables[srv.BOName];
                        this.gvList.DataBind();
                }
        }
}
