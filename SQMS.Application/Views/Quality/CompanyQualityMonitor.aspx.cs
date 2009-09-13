using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using EasyDev.BL;
using System.Data;
using SQMS.Services;
using EasyDev.Util;
using EasyDev.SQMS;
using SQMS.Services.Domain.QualityControl;
using System.Web.Script.Serialization;

namespace SQMS.Application.Views.Quality
{
    public partial class CompanyQualityMonitor : SQMSPage<QualityControlService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;
        private ProjectService svcProject = null;
        private EmployeeService svcEmployee = null;
        private RoadService svcRoad = null;

        private DataTable dtProject = null;
        private DataTable dtProjectManager = null;
        private DataTable dtVideo = null;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
            this.svcProject = this.svcManager.CreateService<ProjectService>();
            this.svcEmployee = this.svcManager.CreateService<EmployeeService>();
            this.svcRoad = this.svcManager.CreateService<RoadService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.OperationBar.Visible = false;
        }
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnInitializeViewEventHandler(sender, e);

            this.bindProjectTreeView(this.dtProject);

            this.DropDownListProjectManager.DataSource = this.dtProjectManager;
            this.DropDownListProjectManager.DataTextField = "EMPNAME";
            this.DropDownListProjectManager.DataValueField = "EMPID";
            this.DropDownListProjectManager.DataBind();
            this.DropDownListProjectManager.Items.Insert(0, new ListItem("全部", String.Empty));

        }
        protected override void GetViewData()
        {
            base.GetViewData();
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);
            this.dtProject = this.svcProject.GetProjectList();
            this.dtProjectManager = this.svcProject.GetProjectManagerList();
            //this.ViewData.Tables.Add(dtProject);
            //DataSet dsEmployee = this.svcEmployee.gete

        }

        protected void TreeViewProject_SelectedNodeChanged(object sender, EventArgs e)
        {
            string[] valueArray = this.TreeViewProject.SelectedNode.Value.Split(new char[] { '&' });
            if (valueArray[1].Equals("project") && this.TreeViewProject.SelectedNode.ChildNodes.Count <= 0)
            {
                DataTable dtChildren = this.svcRoad.GetRoadListInProject(valueArray[0]);
                int i = 1;
                foreach (DataRow drChild in dtChildren.Rows)
                {
                    string raodId = ConvertUtil.ToStringOrDefault(drChild["ROADID"]);
                    string nodeValue = raodId + "&road";
                    TreeNode node = new TreeNode(ConvertUtil.ToStringOrDefault(drChild["ROADNAME"]), nodeValue);

                    DataTable dtPoint = this.svcQualityControl.GetMonitorPointList(raodId);
                    DataRow[] searched = dtPoint.Select("ISSTART='Y'");

                    DataRow drStartPoint = null;
                    if (searched.Length > 0)
                    {
                        drStartPoint = searched[0];
                    }
                    else if (dtPoint.Rows.Count > 0)
                    {
                        drStartPoint = dtPoint.Rows[0];
                    }
                    if (null != drStartPoint)
                    {
                        node.NavigateUrl = "javascript:TreeView_SelectNode("+this.TreeViewProject.ClientID + "_Data, this,'"+this.TreeViewProject.ClientID+"t"+i+"');"
                            + "__doPostBack('" + this.TreeViewProject.ClientID.Replace("_","$") + "','s" + this.TreeViewProject.SelectedNode.Value + "\\\\" + nodeValue + "');"
                            + "setToRoad('" + raodId + "','" + drStartPoint["MPID"] + "');";
                    }
                    this.TreeViewProject.SelectedNode.ChildNodes.Add(node);
                    i++;
                }
            }
            else if (valueArray[1].Equals("road"))
            {
                //读取监控点
                DataTable dtPoint = this.svcQualityControl.GetMonitorPointList(valueArray[0]);
                //DataRow[] searched = dtPoint.Select("ISSTART='Y'");

                //DataRow drStartPoint = null;
                //if (searched.Length > 0)
                //{
                //    drStartPoint = searched[0];
                //}
                //else if (dtPoint.Rows.Count > 0)
                //{
                //    drStartPoint = dtPoint.Rows[0];
                //}
                //if (null != drStartPoint)
                //{
                //    IList<MonitorPoint> mps = this.svcQualityControl.CreateMonitorPointList(dtPoint);
                //    string json = String.Empty;
                //    try
                //    {
                //        JavaScriptSerializer s = new JavaScriptSerializer();
                //        json = s.Serialize(mps);
                //    }
                //    catch
                //    {

                //    }
                //    //string js = @"fetchMarkersByRoad('" + valueArray[0] + "','" + drStartPoint["MPID"] + "');";
                //    //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "setToStart", js, true);
                //}

                this.bindMonitorPointTable(dtPoint);
            }
            this.TreeViewProject.SelectedNode.Expand();
        }

        protected void ButtonPointSearch_Click(object sender, EventArgs e)
        {
            string keyword = ConvertUtil.ToStringOrDefault(this.TextBoxPointSearch.Text);
            DataTable dt = this.svcQualityControl.SearchMonitorPoint(keyword);
            this.bindMonitorPointTable(dt);
        }

        private void bindMonitorPointTable(DataTable dtPoint)
        {
            this.GridViewMP.DataSource = dtPoint;
            this.GridViewMP.DataBind();
            this.UpdatePanelQualityPoint.Update();
        }

        protected void lnkBtnMP_Command(object sender, CommandEventArgs e)
        {
            DataTable dt = this.svcQualityControl.GetVideoList(ConvertUtil.ToStringOrDefault(e.CommandArgument));
            this.bindVideoTable(dt);
        }
        private void bindVideoTable(DataTable dt)
        {
            this.GridViewVideo.DataSource = dt;
            this.GridViewVideo.DataBind();
            this.UpdatePanelVideoList.Update();
        }
        private void bindProjectTreeView(DataTable dtProject)
        {
            this.TreeViewProject.Nodes.Clear();
            foreach (DataRow drProject in dtProject.Rows)
            {
                string nodeValue = ConvertUtil.ToStringOrDefault(drProject["PROJECTID"]) + "&project";
                TreeNode node = new TreeNode(ConvertUtil.ToStringOrDefault(drProject["PROJECTNAME"]), nodeValue);
                this.TreeViewProject.Nodes.Add(node);
            }
        }

        protected void DropDownListProjectManager_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = this.svcProject.GetProjectList(this.DropDownListProjectManager.SelectedValue);
            this.bindProjectTreeView(dt);
            this.UpdatePanelProjectTree.Update();
        }

        protected void GridViewMP_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drPointView = (DataRowView)e.Row.DataItem;
                DataRow drPoint = drPointView.Row;
                string mpName = ConvertUtil.ToStringOrDefault(drPoint["MPNAME"]);
                string mpId = ConvertUtil.ToStringOrDefault(drPoint["MPID"]);
                string lat = ConvertUtil.ToStringOrDefault(drPoint["LATITUDE"]);
                string lng = ConvertUtil.ToStringOrDefault(drPoint["LONGITUDE"]);
                string lv = ConvertUtil.ToStringOrDefault(drPoint["MPLEVEL"]);
                int qclv = ConvertUtil.ToInt(drPoint["LATESTQCLEVEL"]);
                string isStart = ConvertUtil.ToStringOrDefault(drPoint["isstart"]);
                LinkButton lnkBtn = (LinkButton)e.Row.Controls[0].Controls[1];
                lnkBtn.OnClientClick = "setToMarker('" + mpId + "','" + mpName + "'," + lat + "," + lng + "," + lv + "," + qclv + ",true,true,{isStart:'" + isStart + "'});";
            }
        }


    }
}
