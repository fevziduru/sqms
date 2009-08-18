using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using EasyDev.SQMS;
using EasyDev.BL.Services;
using System.Data;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

namespace SQMS.Application.Views.Project
{
    public partial class ProjectList : SQMSPage<ProjectService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private ProjectService svcProject = null;
        private DataTable dtProject
        {
            get
            {
                return this.ViewState["dtProject"] as DataTable;
            }
            set
            {
                value.TableName = "Project";
                this.ViewState.Add("dtProject", value);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.svcProject = this.svcManager.CreateService<ProjectService>();
        }


        private void bindGridViewProject(DataTable dt)
        {
            this.GridViewProject.DataSource = dt;
            this.GridViewProject.DataBind();
            this.UpdatePanelGridViewProject.Update();
        }
        protected override void OnLoad(EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GridViewProject.Attributes.Add("SortExpression", "id");
                this.GridViewProject.Attributes.Add("SortDirection", "ASC");

                this.dtProject = this.svcProject.GetProjectList(null);
                this.bindGridViewProject(this.dtProject);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);

        }
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string[] ids = Request.Params["__KeyValues__"].ToString().Split(',');
                for (int i = 0; i < ids.Length; i++)
                {
                    Service.DeleteByKey(ids[i]);
                }
            }
            catch
            {

            }

            //删除数据后重新加载数据
            this.dtProject = this.svcProject.GetProjectList(null);
            this.GridViewProject.DataSource = this.dtProject.DefaultView;
            this.GridViewProject.DataBind();
        }

        protected void GridViewProject_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridViewProject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridViewProject.PageIndex = e.NewPageIndex;
            this.GridViewProject.DataSource = this.dtProject.DefaultView;
            this.GridViewProject.DataBind();
        }
    }
}
