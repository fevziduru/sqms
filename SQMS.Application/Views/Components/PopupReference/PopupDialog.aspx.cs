using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SQMS.Services;
using SQMS.Services.ReferenceServices;

namespace SQMS.Application
{
    public partial class PopupDialog : System.Web.UI.Page
    {
        private DataTable Data = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            string s = Request.QueryString["s"];
            string t = Request.QueryString["t"];

            this.gvRefList.PageIndexChanging += new GridViewPageEventHandler(gvRefList_PageIndexChanging);
            this.gvRefList.RowDataBound += new GridViewRowEventHandler(gvRefList_RowDataBound);
            this.gvRefList.PreRender += new EventHandler(gvRefList_PreRender);

            IReferenceService srv = Activator.CreateInstance(Type.GetType(s + "," + t)) as IReferenceService;

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

        protected override void Render(HtmlTextWriter writer)
        {
            //foreach (GridViewRow row in this.gvRefList.Rows)
            //{
            //    LinkButton lb = row.FindControl("lbSelect") as LinkButton;
            //    if (lb != null)
            //    {
            //        lb.Attributes.Remove("href");
            //    }
            //}

            base.Render(writer);
        }

        void gvRefList_PreRender(object sender, EventArgs e)
        {

            //for (int i = 0; i < this.gvRefList.Columns.Count; i++)
            //{
            //    if (this.gvRefList.Columns[i].HeaderText.Equals("value", StringComparison.CurrentCultureIgnoreCase) ||
            //        this.gvRefList.Columns[i].HeaderText.Equals("text", StringComparison.CurrentCultureIgnoreCase))
            //    {
            //        this.gvRefList.Columns[i].Visible = false;
            //    }
            //}

        }

        void gvRefList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    HiddenField hf = e.Row.FindControl("hidValue") as HiddenField;
            //    HiddenField hf2 = e.Row.FindControl("hidText") as HiddenField;
            //    LinkButton lb = e.Row.FindControl("lbSelect") as LinkButton;
            //    if (lb != null)
            //    {
            //        lb.Attributes.Add("onclick", "SelectItem({'value':'" + hf.Value + "','text':'" + hf2.Value + "'})");
            //    }
            //}
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
