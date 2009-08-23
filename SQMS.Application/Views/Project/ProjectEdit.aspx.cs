using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using log4net;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Project
{
    public partial class ProjectEdit : SQMSPage<ProjectService>
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(ProjectEdit));

        private DataTable mProjectDataTable = null;

        private bool isEdit
        {
            get
            {
                if (String.IsNullOrEmpty(this.Request.QueryString["id"]))
                {
                    return false;
                }
                return true;
            }
        }
        private string ProjectId
        {
            get
            {
                if (String.IsNullOrEmpty(ConvertUtil.ToStringOrDefault(this.ViewState["ProjectId"])))
                {
                    this.ViewState.Add("ProjectId", ConvertUtil.ToStringOrDefault(this.Request.QueryString["id"]));
                }
                return ConvertUtil.ToStringOrDefault(this.ViewState["ProjectId"]);
            }
            set
            {
                this.ViewState.Add("ProjectId", value);
            }
        }
        private DataRow drProject
        {
            get
            {
                DataRow dr = DataSetUtil.GetFirstRowFromDataTable(this.dtProject);
                if (null == dr)
                {
                    dr = this.dtProject.NewRow();
                    this.dtProject.Rows.Add(dr);
                }
                return dr;
            }
        }
        private DataTable dtProject
        {
            get
            {
                if (null == this.mProjectDataTable)
                {
                    this.mProjectDataTable = this.ViewState["dtProject"] as DataTable;
                }
                return mProjectDataTable;
            }
            set
            {
                DataTable dt = value;
                if (null == dt)
                {
                    DataSet ds = this.Service.LoadByKey(null, true);
                    dt = ds.Tables[0];
                }
                dt.TableName = "Project";
                this.mProjectDataTable = dt;
                this.ViewState.Add("dtProject", dt);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);
            if (!IsPostBack)
            {
                ProjectService svc = (ProjectService)this.Service;
                
                this.dtProject = svc.GetProject(this.ProjectId);
            }
        }
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnInitializeViewEventHandler(sender, e);
           

            if (this.isEdit)
            {
                this.TextBoxAssistAmount.Text = ConvertUtil.ToStringOrDefault(this.drProject["AssistAmount"]);
                this.TextBoxMemo.Text = ConvertUtil.ToStringOrDefault(this.drProject["MEMO"]);
                this.TextBoxProjectCode.Text = ConvertUtil.ToStringOrDefault(this.drProject["ProjectCODE"]);
                this.TextBoxProjectName.Text = ConvertUtil.ToStringOrDefault(this.drProject["ProjectNAME"]);
                this.TextBoxLeaderAmount.Text = ConvertUtil.ToStringOrDefault(this.drProject["LeaderAmount"]);
                this.TextBoxViseleaderAmount.Text = ConvertUtil.ToStringOrDefault(this.drProject["VISELEADERAMOUNT"]);
                this.TextBoxTotalScale.Text = ConvertUtil.ToStringOrDefault(this.drProject["TotalScale"]);
                this.TextBoxTotalWorkerAmount.Text = ConvertUtil.ToStringOrDefault(this.drProject["TotalWorkerAmount"]);
                this.TextBoxTotalWorkTime.Text = ConvertUtil.ToStringOrDefault(this.drProject["TotalWorkTime"]);
                this.CheckBoxIsVoid.Checked = ConvertUtil.ToBool(this.drProject["ISVOID"]);
                this.RefEmp.SelectedValue = ConvertUtil.ToStringOrDefault(drProject["EMPID"]);
                this.RefEmp.SelectedText = ConvertUtil.ToStringOrDefault(drProject["EMPNAME"]);
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            this.GetViewData();
            DataSet ds = new DataSet();
            DataTable dtSave = this.dtProject.Copy();
            dtSave.Columns.Remove("EMPNAME");
            ds.Tables.Add(dtSave);

            this.Service.Save(ds);
            Response.Write("<script>alert('保存成功');location.href='ProjectList.aspx?p=projectlist';</script>");
        }

        protected override void GetViewData()
        {
            base.GetViewData();
            if (!this.isEdit)
            {
                this.drProject["ProjectID"] = this.Service.GetNextSequenceID();
                this.drProject["CREATED"] = DateTime.Now;
                this.drProject["CREATEDBY"] = this.CurrentUser.EmployeeID;
                this.drProject["ORGANIZATIONID"] = this.CurrentUser.OrganizationID;
                this.drProject["PROJECTID"] = DBNull.Value;
            }

            this.drProject["ProjectCODE"] = ConvertUtil.ToStringOrDefault(this.TextBoxProjectCode.Text);
            this.drProject["ProjectNAME"] = ConvertUtil.ToStringOrDefault(this.TextBoxProjectName.Text);

            this.drProject["AssistAmount"] = ConvertUtil.ToDecimal(this.TextBoxAssistAmount.Text);
            this.drProject["LeaderAmount"] = ConvertUtil.ToDecimal(this.TextBoxLeaderAmount.Text);
            this.drProject["TotalScale"] = ConvertUtil.ToDecimal(this.TextBoxTotalScale.Text);
            this.drProject["TotalWorkerAmount"] = ConvertUtil.ToDecimal(this.TextBoxTotalWorkerAmount.Text);
            this.drProject["MEMO"] = ConvertUtil.ToStringOrDefault(this.TextBoxMemo.Text);
            this.drProject["TotalWorkTime"] = ConvertUtil.ToDecimal(this.TextBoxTotalWorkTime.Text);
            this.drProject["VISELEADERAMOUNT"] = ConvertUtil.ToDecimal(this.TextBoxViseleaderAmount.Text);
            this.drProject["MODIFIED"] = DateTime.Now;
            this.drProject["MODIFIEDBY"] = this.CurrentUser.EmployeeID;
            this.drProject["ISVOID"] = (this.CheckBoxIsVoid.Checked) ? "Y" : "N";
            this.drProject["EMPID"] = this.RefEmp.SelectedValue;

        }

        protected void BtnSaveAndNew_Click(object sender, EventArgs e)
        {
            this.BtnSave_Click(sender, e);
            this.Response.Redirect("ProjectEdit.aspx?p=projectnew");
        }
    }
}
