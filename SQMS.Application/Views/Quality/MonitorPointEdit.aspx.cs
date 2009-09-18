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
    public partial class MonitorPointEdit : SQMSPage<MonitorPointService>
    {
        private MonitorPointService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drMP = DataSetUtil.GetFirstRowFromDataSet(ViewData, Service.BOName);

            if (drMP != null)
            {
                if (this.ID.Length == 0)
                {
                    this.ID = Service.GetNextSequenceID();
                    drMP["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drMP["CREATEDBY"] = CurrentUser.PassportID;
                }

                drMP["MPID"] = this.ID;
                drMP["MPCODE"] = this.txtMPCode.Text;
                drMP["MPNAME"] = this.txtMPName.Text;
                drMP["MEMO"] = this.txtMemo.Text;
                drMP["ORDERINROAD"] = this.txtOrderInRoad.Text;
                //drMP["LONGITUDE"] = this.txtLng.Text;
                //drMP["LATITUDE"] = this.txtLat.Text;
                drMP["ROADID"] = this.refRoad.SelectedValue;
                drMP["SCHEMAID"] = this.refTimeSchema.SelectedValue;
                drMP["FLOATDIST"] = ConvertUtil.ToDecimal(this.txtFloatDist.Text);
                drMP["MPLEVEL"] = this.txtMapLevel.Text;
                drMP["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";
                drMP["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drMP["MODIFIEDBY"] = CurrentUser.PassportID;
                drMP["ORGANIZATIONID"] = CurrentUser.OrganizationID;
                drMP["IMPORTANCE"] = this.ddlImportance.SelectedValue;
            }
        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)  //2
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
            this.ViewData.Merge(srv.EnumService.GetEnumByType("_mp_importance"));
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)    //3
        {
            ControlBindingHelper.BindDropDownList(this.ddlImportance, ViewData.Tables[srv.EnumService.BOName], "enumname", "enumid");

            if (this.ID.Length == 0)
            {
                //新增
                this.txtMPCode.Text = Service.GenerateCode();
            }
            else
            {
                //编辑
                DataRow drMP = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                if (drMP != null)
                {
                    this.txtMPCode.Text = ConvertUtil.ToStringOrDefault(drMP["MPCODE"]);
                    this.txtMPName.Text = ConvertUtil.ToStringOrDefault(drMP["MPNAME"]);
                    this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drMP["MEMO"]);
                    //this.txtLng.Text = ConvertUtil.ToStringOrDefault(drMP["LONGITUDE"]);
                    //this.txtLat.Text = ConvertUtil.ToStringOrDefault(drMP["LATITUDE"]);
                    this.txtOrderInRoad.Text = ConvertUtil.ToStringOrDefault(drMP["ORDERINROAD"]);

                    this.refRoad.SelectedValue = ConvertUtil.ToStringOrDefault(drMP["ROADID"]);
                    this.refRoad.SelectedText = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("roadname", "ROAD", "ROADID",
                        ConvertUtil.ToStringOrDefault(drMP["ROADID"])));

                    this.refTimeSchema.SelectedValue = ConvertUtil.ToStringOrDefault(drMP["SCHEMAID"]);
                    this.refTimeSchema.SelectedText = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("SCHEMANAME", "TIMESCHEMA", "SCHEMAID",
                        ConvertUtil.ToStringOrDefault(drMP["SCHEMAID"])));
                    this.txtFloatDist.Text = ConvertUtil.ToStringOrDefault(drMP["FLOATDIST"]);
                    this.txtMapLevel.Text = ConvertUtil.ToStringOrDefault(drMP["MPLEVEL"]);
                    this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drMP["ISVOID"]).Equals("Y") ? true : false;
                    ListItem item = this.ddlImportance.Items.FindByValue(ConvertUtil.ToStringOrDefault(drMP["IMPORTANCE"]));
                    if (null != item)
                    {
                        item.Selected = true;
                    }
                }
            }
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
        {
            srv = Service as MonitorPointService;
        }

        public void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.Service.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw;
            }

            Response.Redirect(String.Format("MonitorPointView.aspx?p=mpview&id={0}", this.ID));
        }

        public void btnSaveAndNew_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.Service.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("MonitorPointEdit.aspx?p=mpnew");
        }
    }
}
