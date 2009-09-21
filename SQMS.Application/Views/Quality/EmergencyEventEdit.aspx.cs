using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using SQMS.Services;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Quality
{

    public partial class EmergencyEventEdit : SQMSPage<EmergencyEventService>
    {
        public string strSTIME;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drEE = DataSetUtil.GetFirstRowFromDataSet(ViewData, Service.BOName);

            if (drEE != null)
            {
                if (this.ID.Length == 0)
                {
                    this.ID = Service.GetNextSequenceID();
                    drEE["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drEE["CREATEDBY"] = CurrentUser.PassportID;
                }

                drEE["EVENTID"] = this.ID;
                drEE["EVENTCODE"] = this.txtEECode.Text;
                drEE["EVENTNAME"] = this.txtEEName.Text;
                drEE["CHECKUNIT"] = this.txtEECHECKUNIT.Text;
                drEE["CHECKTIME"] = this.strSTIME = Request.Form["tbSTIME"];

                drEE["EMERGENCYCHARGEPERSON"] = this.refEMP.SelectedValue;
                drEE["SCHEMAID"] = this.refEESCHEMAID.SelectedValue;

                drEE["PRIVILIGE"] = this.ddlPRIVILIGE.SelectedValue;

                drEE["MEMO"] = this.txtMemo.Text;
                drEE["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";
                drEE["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drEE["MODIFIEDBY"] = CurrentUser.PassportID;
                drEE["ORGANIZATIONID"] = CurrentUser.OrganizationID;
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
            this.ViewData.Merge((Service as EmergencyEventService).EnumService.GetEnumByType("_mp_importance"));
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)    //3
        {
            if (this.ID.Length == 0)
            {
                //新增
                this.txtEECode.Text = Service.GenerateCode();
            }
            else
            {
                //编辑
                DataRow drEE = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                if (drEE != null)
                {
                    this.ID =  ConvertUtil.ToStringOrDefault(drEE["EVENTID"]);
                    this.txtEECode.Text =  ConvertUtil.ToStringOrDefault(drEE["EVENTCODE"]);
                    this.txtEEName.Text =  ConvertUtil.ToStringOrDefault(drEE["EVENTNAME"]);
                    this.txtEECHECKUNIT.Text = ConvertUtil.ToStringOrDefault(drEE["CHECKUNIT"]);
                    this.strSTIME = Convert.ToDateTime(drEE["CHECKTIME"]).ToString("hh:mm:ss");

                    this.refEMP.SelectedValue = ConvertUtil.ToStringOrDefault(drEE["EMERGENCYCHARGEPERSON"]);
                    this.refEMP.SelectedText = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID", ConvertUtil.ToStringOrDefault(drEE["EMERGENCYCHARGEPERSON"])));

                    this.refEESCHEMAID.SelectedValue =  ConvertUtil.ToStringOrDefault(drEE["SCHEMAID"]);
                    this.refEESCHEMAID.SelectedText = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("SCHEMANAME", "TIMESCHEMA", "SCHEMAID", ConvertUtil.ToStringOrDefault(drEE["SCHEMAID"])));


                    this.ddlPRIVILIGE.SelectedValue =  ConvertUtil.ToStringOrDefault(drEE["PRIVILIGE"]);

                    this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drEE["ISVOID"]).Equals("Y") ? true : false;
                    this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drEE["MEMO"]);
                }
            }

            if (this.ddlPRIVILIGE.Items.Count == 0)
            {
                DataTable dtEnu = DataSetUtil.GetDataTableFromDataSet(this.ViewData, (Service as EmergencyEventService).EnumService.BOName);
                foreach (DataRow dr in dtEnu.Rows)
                {
                    this.ddlPRIVILIGE.Items.Add(new ListItem(ConvertUtil.ToStringOrDefault(dr["ENUMNAME"]), ConvertUtil.ToStringOrDefault(dr["ENUMID"])));
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
            //srv = Service as OperationService;
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
                throw ex;
            }

            Response.Redirect(String.Format("EmergencyEventView.aspx?p=eeview&id={0}", this.ID));
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

            Response.Redirect("EmergencyEventEdit.aspx?p=eenew");
        }
    }

}
