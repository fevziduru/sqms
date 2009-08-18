using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SQMS.Services;
using SQMS.Services.ReferenceServices;
using EasyDev.Util;
using EasyDev.SQMS;

namespace SQMS.Application
{
    public partial class PopupDialog : Page
    {
        private DataTable Data = null;
        IReferenceService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            string s = Request.QueryString["s"];
            string t = Request.QueryString["t"];

            this.gvRefList.PageIndexChanging += new GridViewPageEventHandler(gvRefList_PageIndexChanging);

            srv = Activator.CreateInstance(Type.GetType(s + "," + t)) as IReferenceService;
            
            if (!Page.IsPostBack)
            {
                if (srv != null)
                {
                    Data = srv.FetchReferenceData();
                    ViewState.Add("Data", Data);

                    gvRefList.DataSource = Data;
                    gvRefList.DataKeyNames = new string[] { "value" };

                    this.gvRefList.Columns.Clear();

                    TemplateField templateField = new TemplateField();
                    templateField.ItemTemplate = LoadTemplate("SelectTemplateField.ascx");
                    this.gvRefList.Columns.Add(templateField);

                    foreach (DataColumn col in Data.Columns)
                    {
                        if (col.ColumnName.Equals("value", StringComparison.CurrentCultureIgnoreCase) ||
                            col.ColumnName.Equals("text", StringComparison.CurrentCultureIgnoreCase))
                        {

                        }
                        else
                        {
                            BoundField field = new BoundField();
                            field.HeaderText = col.Caption;
                            field.DataField = col.ColumnName;
                            this.gvRefList.Columns.Add(field);
                        }
                    }

                    this.gvRefList.DataBind();
                }
            }
        }

        public void btnFilte_Click(object sender, EventArgs e)
        {
            string orgid = ((UserInfo)Session["USER_INFO"]).OrganizationID;
            Data = DataSetUtil.GetDataTableFromDataSet(
                ((EquipmentRefService)srv).LoadByCondition(
                    "EQUNAME LIKE '%" + this.txtCondition.Text + "%' ISVOID='N' AND ORGANIZATIONID='" + orgid + "'"), "EQUIPMENT");

            ViewState["Data"] = Data;
            gvRefList.DataSource = Data;
            gvRefList.DataKeyNames = new string[] { "value" };

            this.gvRefList.Columns.Clear();

            TemplateField templateField = new TemplateField();
            templateField.ItemTemplate = LoadTemplate("SelectTemplateField.ascx");
            this.gvRefList.Columns.Add(templateField);

            foreach (DataColumn col in Data.Columns)
            {
                if (col.ColumnName.Equals("value", StringComparison.CurrentCultureIgnoreCase) ||
                    col.ColumnName.Equals("text", StringComparison.CurrentCultureIgnoreCase))
                {

                }
                else
                {
                    BoundField field = new BoundField();
                    field.HeaderText = col.Caption;
                    field.DataField = col.ColumnName;
                    this.gvRefList.Columns.Add(field);
                }
            }

            this.gvRefList.DataBind();  
        }

        void gvRefList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvRefList.PageIndex = e.NewPageIndex;

            Data = ViewState["Data"] as DataTable;
            gvRefList.DataSource = Data;
            gvRefList.DataKeyNames = new string[] { "value" };

            this.gvRefList.Columns.Clear();

            TemplateField templateField = new TemplateField();
            templateField.ItemTemplate = LoadTemplate("SelectTemplateField.ascx");
            this.gvRefList.Columns.Add(templateField);

            foreach (DataColumn col in Data.Columns)
            {
                if (col.ColumnName.Equals("value", StringComparison.CurrentCultureIgnoreCase) ||
                    col.ColumnName.Equals("text", StringComparison.CurrentCultureIgnoreCase))
                {

                }
                else
                {
                    BoundField field = new BoundField();
                    field.HeaderText = col.Caption;
                    field.DataField = col.ColumnName;
                    this.gvRefList.Columns.Add(field);
                }
            }

            this.gvRefList.DataBind();            
        }
    }
}
