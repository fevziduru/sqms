using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using SQMS.Services;
using EasyDev.Util;
using System.Data;

namespace SQMS.Application.Views.Quality
{

    public partial class TimeSchemaView : SQMSPage<TimeSchemaService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drEqu = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);

            if (drEqu != null)
            {
                //this.lblEquCode.Text = ConvertUtil.ToStringOrDefault(drEqu["EQUCODE"]);
                //this.lblEquName.Text = ConvertUtil.ToStringOrDefault(drEqu["EQUNAME"]);
                //this.lblEquIdentify.Text = ConvertUtil.ToStringOrDefault(drEqu["IDENTIFY"]);
                //this.lblIsvoid.Text = ConvertUtil.ToStringOrDefault(drEqu["ISVOID"]).Equals("Y") ? "禁用" : "启用";
                //this.lblMemo.Text = ConvertUtil.ToStringOrDefault(drEqu["MEMO"]);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Service.DeleteByKey(this.ID);

            Response.Redirect("TimeSchemaList.aspx?p=tslist");
        }

        public void btnEdit_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("TimeSchemaEdit.aspx?p=tsedit&id=" + this.ID);
        }

        public void btnNew_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("TimeSchemaEdit.aspx?p=tsnew");
        }
    }

}
