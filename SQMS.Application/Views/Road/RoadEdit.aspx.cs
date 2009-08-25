using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using System.Data;
using SQMS.Services.QualityControl;
using EasyDev.Util;
using log4net;
using SQMS.Application.HtmlHelper;

namespace SQMS.Application.Views.Road
{
        public partial class RoadEdit : SQMSPage<RoadService>
        {
                private static readonly ILog log = LogManager.GetLogger(typeof(RoadEdit));

                private DataTable mRoadDataTable = null;

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
                private string roadId
                {
                        get
                        {
                                if (String.IsNullOrEmpty(ConvertUtil.ToStringOrDefault(this.ViewState["roadId"])))
                                {
                                        this.ViewState.Add("roadId", ConvertUtil.ToStringOrDefault(this.Request.QueryString["id"]));
                                }
                                return ConvertUtil.ToStringOrDefault(this.ViewState["roadId"]);
                        }
                        set
                        {
                                this.ViewState.Add("roadId", value);
                        }
                }
                private DataTable dtRoadType
                {
                        get
                        {
                                return this.ViewState["dtRoadType"] as DataTable;
                        }
                        set
                        {
                                value.TableName = "RoadType";
                                this.ViewState.Add("dtRoadType", value);
                        }
                }
                private DataRow drRoad
                {
                        get
                        {
                                DataRow dr = DataSetUtil.GetFirstRowFromDataTable(this.dtRoad);
                                if (null == dr)
                                {
                                        dr = this.dtRoad.NewRow();
                                        this.dtRoad.Rows.Add(dr);
                                }
                                return dr;
                        }
                }
                private DataTable dtRoad
                {
                        get
                        {
                                if (null == this.mRoadDataTable)
                                {
                                        this.mRoadDataTable = this.ViewState["dtRoad"] as DataTable;
                                }
                                return mRoadDataTable;
                        }
                        set
                        {
                                DataTable dt = value;
                                if (null == dt)
                                {
                                        DataSet ds = this.Service.LoadByKey(null, true);
                                        dt = ds.Tables[0];
                                }
                                dt.TableName = "ROAD";
                                this.mRoadDataTable = dt;
                                this.ViewState.Add("dtRoad", dt);
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
                                RoadService svc = (RoadService)this.Service;
                                this.dtRoadType = svc.GetRoadType();
                                this.dtRoad = svc.GetRoad(this.roadId);
                        }
                }
                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        base.OnInitializeViewEventHandler(sender, e);
                        ControlBindingHelper.BindDropDownList(this.DropDownListRoadType, this.dtRoadType, "ENUMNAME", "ENUMID");

                        //this.DropDownListRoadType.DataSource = this.dtRoadType;
                        //this.DropDownListRoadType.DataTextField = "ENUMNAME";
                        //this.DropDownListRoadType.DataValueField = "ENUMID";
                        //this.DropDownListRoadType.DataBind();

                        if (this.isEdit)
                        {
                                this.TextBoxAvgWorkAmount.Text = ConvertUtil.ToStringOrDefault(this.drRoad["AVGWORKERAMOUNT"]);
                                this.TextBoxMemo.Text = ConvertUtil.ToStringOrDefault(this.drRoad["MEMO"]);
                                this.TextBoxRoadCode.Text = ConvertUtil.ToStringOrDefault(this.drRoad["ROADCODE"]);
                                this.TextBoxRoadName.Text = ConvertUtil.ToStringOrDefault(this.drRoad["ROADNAME"]);
                                this.TextBoxWorkBeginTime.Text = ConvertUtil.ToStringOrDefault(this.drRoad["BEGINTIME"]);
                                this.TextBoxWorkEndTime.Text = ConvertUtil.ToStringOrDefault(this.drRoad["ENDTIME"]);
                                this.TextBoxWorkerNum.Text = ConvertUtil.ToStringOrDefault(this.drRoad["WORKERAMOUNT"]);
                                this.TextBoxWorkTime.Text = ConvertUtil.ToStringOrDefault(this.drRoad["WORKTIME"]);
                                this.RefProject.SelectedValue = ConvertUtil.ToStringOrDefault(this.drRoad["ProjectId"]);
                                this.RefProject.SelectedText = ConvertUtil.ToStringOrDefault(this.drRoad["ProjectName"]);
                                ListItem li = this.DropDownListRoadType.Items.FindByValue(ConvertUtil.ToStringOrDefault(this.drRoad["ROADTYPE"]));
                                if (li != null)
                                {
                                        li.Selected = true;
                                }
                                this.CheckBoxIsVoid.Checked = ConvertUtil.ToBool(this.drRoad["ISVOID"]);
                        }
                }

                protected void BtnSave_Click(object sender, EventArgs e)
                {
                        this.GetViewData();
                        DataSet ds = new DataSet();
                        DataTable dtSave = this.dtRoad.Copy();
                        dtSave.Columns.Remove("ROADTYPENAME");
                        dtSave.Columns.Remove("PROJECTNAME");
                        ds.Tables.Add(dtSave);

                        this.Service.Save(ds);
                        Response.Redirect("/Views/Road/RoadView.aspx?p=roadview&id=" + this.ID);
                        //Response.Write("<script>alert('保存成功');location.href='RoadList.aspx?p=roadlist';</script>");
                }

                protected override void GetViewData()
                {
                        base.GetViewData();
                        if (!this.isEdit)
                        {
                                this.drRoad["ROADID"] = this.Service.GetNextSequenceID();
                                this.drRoad["CREATED"] = DateTime.Now;
                                this.drRoad["CREATEDBY"] = this.CurrentUser.EmployeeID;
                                this.drRoad["ORGANIZATIONID"] = this.CurrentUser.OrganizationID;
                                this.drRoad["PROJECTID"] = DBNull.Value;
                        }

                        this.drRoad["ROADCODE"] = ConvertUtil.ToStringOrDefault(this.TextBoxRoadCode.Text);
                        this.drRoad["ROADNAME"] = ConvertUtil.ToStringOrDefault(this.TextBoxRoadName.Text);
                        this.drRoad["ROADTYPE"] = ConvertUtil.ToStringOrDefault(this.DropDownListRoadType.SelectedValue);
                        this.drRoad["BEGINTIME"] = ConvertUtil.ToDateTime(this.TextBoxWorkBeginTime.Text);
                        this.drRoad["ENDTIME"] = ConvertUtil.ToDateTime(this.TextBoxWorkEndTime.Text);
                        this.drRoad["WORKTIME"] = ConvertUtil.ToDecimal(this.TextBoxWorkTime.Text);
                        this.drRoad["WORKERAMOUNT"] = ConvertUtil.ToDecimal(this.TextBoxWorkerNum.Text);
                        this.drRoad["MEMO"] = ConvertUtil.ToStringOrDefault(this.TextBoxMemo.Text);
                        this.drRoad["AVGWORKERAMOUNT"] = ConvertUtil.ToDecimal(this.TextBoxAvgWorkAmount.Text);
                        this.drRoad["MODIFIED"] = DateTime.Now;
                        this.drRoad["MODIFIEDBY"] = this.CurrentUser.EmployeeID;
                        this.drRoad["ISVOID"] = (this.CheckBoxIsVoid.Checked) ? "Y" : "N";
                        this.drRoad["PRJECTID"] = this.RefProject.SelectedValue;


                }

                protected void BtnSaveAndNew_Click(object sender, EventArgs e)
                {
                        this.BtnSave_Click(sender, e);
                        this.Response.Redirect("RoadEdit.aspx?p=raodnew");
                }
        }
}
