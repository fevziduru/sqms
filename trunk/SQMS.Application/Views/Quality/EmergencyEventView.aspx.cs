using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.Util;
using System.Data;
using EasyDev.SQMS;

namespace SQMS.Application.Views.Quality
{

    public partial class EmergencyEventView : SQMSPage<EmergencyEventService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drEE = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
            if (drEE != null)
            {
                this.ID = ConvertUtil.ToStringOrDefault(drEE["EVENTID"]);
                this.lbl_code.Text = ConvertUtil.ToStringOrDefault(drEE["EVENTCODE"]);
                this.lbl_name.Text = ConvertUtil.ToStringOrDefault(drEE["EVENTNAME"]);
                this.lbl_cu.Text = ConvertUtil.ToStringOrDefault(drEE["CHECKUNIT"]);
                this.lbl_ct.Text = ConvertUtil.ToStringOrDefault(drEE["CHECKTIME"]);

                this.lbl_emp.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID", ConvertUtil.ToStringOrDefault(drEE["EMERGENCYCHARGEPERSON"])));
                this.lbl_time.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("SCHEMANAME", "TIMESCHEMA", "SCHEMAID", ConvertUtil.ToStringOrDefault(drEE["SCHEMAID"])));

                this.lbl_pri.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("ENUMNAME", "ENUMERATION", "ENUMID", ConvertUtil.ToStringOrDefault(drEE["PRIVILIGE"])));

                this.lbl_isvoid.Text = ConvertUtil.ToStringOrDefault(drEE["ISVOID"]).Equals("Y") ? "禁用" : "禁用";
                this.lbl_memo.Text = ConvertUtil.ToStringOrDefault(drEE["MEMO"]);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Service.DeleteByKey(this.ID);

            Response.Redirect("EmergencyEventList.aspx?p=eelist");
        }

        public void btnEdit_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EmergencyEventEdit.aspx?p=eeedit&id=" + this.ID);
        }

        public void btnNew_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EmergencyEventEdit.aspx?p=eenew");
        }
    }

}
