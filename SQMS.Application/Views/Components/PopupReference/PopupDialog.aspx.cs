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
using EasyDev.BL;

namespace SQMS.Application
{
    public partial class PopupDialog : Page
    {
        private DataTable Data = null;
        GenericService srv = null;
        private string KeyField = null;
        private string TextField = null;
        private string orgid = "";
        private string[] HeaderColumns = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            orgid = ((UserInfo)Session["USER_INFO"]).OrganizationID;
            string s = Request.QueryString["s"];
            string t = Request.QueryString["t"];
            KeyField = Request.QueryString["kf"];
            TextField = Request.QueryString["tf"];
            HeaderColumns = HttpUtility.UrlDecode(Request.QueryString["hc"]).Split(new char[] { ',' });
            
            this.gvRefList.PageIndexChanging += new GridViewPageEventHandler(gvRefList_PageIndexChanging);

            srv = Activator.CreateInstance(Type.GetType(s + "," + t)) as GenericService;
            
            if (!Page.IsPostBack)
            {
                if (srv != null)
                {
                    Data = DataSetUtil.GetDataTableFromDataSet(
                        srv.LoadByCondition("ISVOID='N' AND ORGANIZATIONID='" + orgid + "'"), srv.BOName);

                    ViewState.Add("Data", Data);
                    gvRefList.DataSource = Data;
                    gvRefList.DataKeyNames = new string[] { KeyField };

                    this.gvRefList.Columns.Clear();

                    HyperLinkField hfield = new HyperLinkField();
                    hfield.DataTextField = TextField;
                    hfield.DataNavigateUrlFormatString =
                        "javascript:SelectItem({{'" + KeyField + "':'{0}','" + TextField + "':'{1}'}})";
                    hfield.DataNavigateUrlFields = new string[] { KeyField, TextField };
                    this.gvRefList.Columns.Add(hfield);

                    BoundField key = new BoundField();
                    key.DataField = KeyField;
                    this.gvRefList.Columns.Add(key);

                    BoundField text = new BoundField();
                    text.DataField = TextField;
                    this.gvRefList.Columns.Add(text);

                    if (HeaderColumns == null || HeaderColumns.Length == 0)
                    {
                        foreach (DataColumn col in Data.Columns)
                        {
                            if (col.ColumnName.Equals(KeyField, StringComparison.CurrentCultureIgnoreCase) ||
                                col.ColumnName.Equals(TextField, StringComparison.CurrentCultureIgnoreCase))
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
                    }
                    else
                    {
                        for (int i = 0; i < HeaderColumns.Length; i++)
                        {
                            string[] tmp = HeaderColumns[i].Split(new char[] { ':' });

                            if (tmp[0].Equals(KeyField, StringComparison.CurrentCultureIgnoreCase) == false &&
                                tmp[0].Equals(TextField, StringComparison.CurrentCultureIgnoreCase) == false)
                            {
                                BoundField field = new BoundField();
                                field.HeaderText = tmp[1];
                                field.DataField = tmp[0];
                                this.gvRefList.Columns.Add(field);
                            }
                        }
                    }

                    this.gvRefList.DataBind();
                }
            }
        }

        public void btnFilte_Click(object sender, EventArgs e)
        {
            string sf = Request.QueryString["sf"];
            Data = DataSetUtil.GetDataTableFromDataSet(
                ((GenericService)srv).LoadByCondition(
                    sf + " LIKE '%" + this.txtCondition.Text + "%' AND ISVOID='N' AND ORGANIZATIONID='" + orgid + "'"), srv.BOName);

            ViewState["Data"] = Data;
            gvRefList.DataSource = Data;
            gvRefList.DataKeyNames = new string[] { KeyField };

            this.gvRefList.Columns.Clear();

            //TemplateField templateField = new TemplateField();
            //templateField.ItemTemplate = LoadTemplate("SelectTemplateField.ascx");            
            //this.gvRefList.Columns.Add(templateField);

            HyperLinkField hfield = new HyperLinkField();
            hfield.DataTextField = TextField;
            hfield.NavigateUrl = "javascript:SelectItem({{'" + KeyField + "':'{0}','" + TextField + "':'{1}'}})";
            hfield.DataNavigateUrlFormatString =
                "javascript:SelectItem({{'" + KeyField + "':'{0}','" + TextField + "':'{1}'}})";
            hfield.DataNavigateUrlFields = new string[] { KeyField, TextField };
            this.gvRefList.Columns.Add(hfield);

            BoundField key = new BoundField();
            key.DataField = KeyField;
            this.gvRefList.Columns.Add(key);

            BoundField text = new BoundField();
            text.DataField = TextField;
            this.gvRefList.Columns.Add(text);

            if (HeaderColumns == null || HeaderColumns.Length == 0)
            {
                foreach (DataColumn col in Data.Columns)
                {
                    if (col.ColumnName.Equals(KeyField, StringComparison.CurrentCultureIgnoreCase) ||
                        col.ColumnName.Equals(TextField, StringComparison.CurrentCultureIgnoreCase))
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
            }
            else
            {
                for (int i = 0; i < HeaderColumns.Length; i++)
                {
                    string[] tmp = HeaderColumns[i].Split(new char[] { ':' });

                    if (tmp[0].Equals(KeyField, StringComparison.CurrentCultureIgnoreCase) == false &&
                        tmp[0].Equals(TextField, StringComparison.CurrentCultureIgnoreCase) == false)
                    {
                        BoundField field = new BoundField();
                        field.HeaderText = tmp[1];
                        field.DataField = tmp[0];
                        this.gvRefList.Columns.Add(field);
                    }
                }
            }

            this.gvRefList.DataBind();  
        }

        void gvRefList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvRefList.PageIndex = e.NewPageIndex;

            Data = ViewState["Data"] as DataTable;
            gvRefList.DataSource = Data;
            gvRefList.DataKeyNames = new string[] { KeyField };

            this.gvRefList.Columns.Clear();

            //TemplateField templateField = new TemplateField();
            //templateField.ItemTemplate = LoadTemplate("SelectTemplateField.ascx");
            //this.gvRefList.Columns.Add(templateField);

            HyperLinkField hfield = new HyperLinkField();
            hfield.DataTextField = TextField;
            hfield.DataNavigateUrlFormatString =
                "javascript:SelectItem({{'" + KeyField + "':'{0}','" + TextField + "':'{1}'}})";
            hfield.DataNavigateUrlFields = new string[] { KeyField, TextField };
            this.gvRefList.Columns.Add(hfield);

            BoundField key = new BoundField();
            key.DataField = KeyField;            
            this.gvRefList.Columns.Add(key);

            BoundField text = new BoundField();
            text.DataField = TextField;
            this.gvRefList.Columns.Add(text);

            if (HeaderColumns == null || HeaderColumns.Length == 0)
            {
                foreach (DataColumn col in Data.Columns)
                {
                    if (col.ColumnName.Equals(KeyField, StringComparison.CurrentCultureIgnoreCase) ||
                        col.ColumnName.Equals(TextField, StringComparison.CurrentCultureIgnoreCase))
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
            }
            else
            {
                for (int i = 0; i < HeaderColumns.Length; i++)
                {
                    string[] tmp = HeaderColumns[i].Split(new char[] { ':' });

                    if (tmp[0].Equals(KeyField, StringComparison.CurrentCultureIgnoreCase) == false &&
                        tmp[0].Equals(TextField, StringComparison.CurrentCultureIgnoreCase) == false)
                    {
                        BoundField field = new BoundField();
                        field.HeaderText = tmp[1];
                        field.DataField = tmp[0];
                        this.gvRefList.Columns.Add(field);
                    }
                }
            }

            this.gvRefList.DataBind();            
        }

        protected void gvRefList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Attributes.Add("onclick", "javascript:SelectItem({'" + KeyField + "':'" + e.Row.Cells[1].Text + "','" + TextField + "':'" + e.Row.Cells[2].Text + "'})");
                e.Row.Cells[0].Text = "选择";
                e.Row.Cells[0].Attributes.Add("cursor", "hand");
            }
        }
    }
}
