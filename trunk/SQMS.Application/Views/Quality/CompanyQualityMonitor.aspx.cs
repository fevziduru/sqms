using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using EasyDev.BL.Services;
using System.Data;
using SQMS.Services;
using EasyDev.Util;
using EasyDev.SQMS;

namespace SQMS.Application.Views.Quality
{
    public partial class CompanyQualityMonitor : SQMSPage<QualityControlService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private QualityControlService svcQualityControl = null;
        private ProjectService svcProject = null;
        private EmployeeService svcEmployee = null;
        private RegionService svcRegion = null;

        private DataTable dtProject = null;

        protected void Page_Init(object sender, EventArgs e)
        {
            this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
            this.svcProject = this.svcManager.CreateService<ProjectService>();
            this.svcEmployee = this.svcManager.CreateService<EmployeeService>();
            this.svcRegion = this.svcManager.CreateService<RegionService>();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnInitializeViewEventHandler(sender, e);
            //DataTable dtProject = this.ViewData.Tables[ProjectService.PROJECT_TABLENAME];
            foreach (DataRow drProject in this.dtProject.Rows)
            {
                string nodeValue = ConvertUtil.ToStringOrDefault(drProject["PROJECTID"]) + "&project";
                TreeNode node = new TreeNode(ConvertUtil.ToStringOrDefault(drProject["PROJECTNAME"]), nodeValue);
                this.TreeViewProject.Nodes.Add(node);
            }

        }
        protected override void GetViewData()
        {
            base.GetViewData();
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);
            this.dtProject = this.svcProject.GetProjectList();
            //this.ViewData.Tables.Add(dtProject);
            //DataSet dsEmployee = this.svcEmployee.gete

        }

        protected void TreeViewProject_SelectedNodeChanged(object sender, EventArgs e)
        {
            string[] valueArray = this.TreeViewProject.SelectedNode.Value.Split(new char[] { '&' });
            if(valueArray[1].Equals("project") && this.TreeViewProject.SelectedNode.ChildNodes.Count <= 0)
            {
                DataTable dtChildren = this.svcRegion.GetRegionListInProject(valueArray[0]);
                foreach (DataRow drChild in dtChildren.Rows)
                {
                    string nodeValue = ConvertUtil.ToStringOrDefault(drChild["ROADID"]) + "&region";
                    TreeNode node = new TreeNode(ConvertUtil.ToStringOrDefault(drChild["ROADNAME"]),nodeValue);
                    this.TreeViewProject.SelectedNode.ChildNodes.Add(node);
                }
            }
            else if (valueArray[1].Equals("region"))
            {
                //读取监控点
                DataTable dtPoint = this.svcQualityControl.GetMonitorPointList(valueArray[0]);
                this.fillMonitorPointTable(dtPoint);
            }
        }

        protected void ButtonPointSearch_Click(object sender, EventArgs e)
        {
            string keyword = ConvertUtil.ToStringOrDefault(this.TextBoxPointSearch.Text);
            DataTable dt = this.svcQualityControl.SearchMonitorPoint(keyword);
            this.fillMonitorPointTable(dt);
        }

        private void fillMonitorPointTable(DataTable dtPoint)
        {
            this.TableQualityPoint.Rows.Clear();
            TableHeaderCell headerCell1 = new TableHeaderCell();
            headerCell1.Text = "片区监控点";
            TableHeaderCell headerCell2 = new TableHeaderCell();
            headerCell2.Text = "负责人";
            TableHeaderRow headerRow = new TableHeaderRow();
            headerRow.Cells.Add(headerCell1);
            headerRow.Cells.Add(headerCell2);
            this.TableQualityPoint.Rows.Add(headerRow);
            foreach (DataRow drPoint in dtPoint.Rows)
            {
                TableCell cell1 = new TableCell();
                string mpName = ConvertUtil.ToStringOrDefault(drPoint["MPNAME"]);
                string mpId = ConvertUtil.ToStringOrDefault(drPoint["MPID"]);
                string lat = ConvertUtil.ToStringOrDefault(drPoint["LATITUDE"]);
                string lng = ConvertUtil.ToStringOrDefault(drPoint["LONGITUDE"]);
                cell1.Text =
                    "<a href='javascript:setToMarker(&quot;" + mpId + "&quot;,&quot;" + mpName + "&quot;," + lat + "," + lng + ",true);'>" + mpName + "</a>";

                TableCell cell2 = new TableCell();
                cell2.Text = "-";
                TableRow row = new TableRow();
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                this.TableQualityPoint.Rows.Add(row);
            }

            this.UpdatePanelQualityPoint.Update();
        }


    }
}
