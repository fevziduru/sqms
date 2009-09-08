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
        private TimeSchemaService srv;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = Service as TimeSchemaService;
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drTS = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
            if (drTS != null)
            {
                this.lblSCHEMANAME.Text = ConvertUtil.ToStringOrDefault(drTS["SCHEMANAME"]);
                this.lblBEGINTIME.Text = Convert.ToDateTime(drTimeSch["BEGINTIME"]).ToString("hh:mm:ss");
                this.lblENDTIME.Text = Convert.ToDateTime(drTimeSch["ENDTIME"]).ToString("hh:mm:ss");
                this.lblFLOATTIME.Text = ConvertUtil.ToStringOrDefault(drTS["FLOATTIME"]);
            }

            DataTable dtTSItems = DataSetUtil.GetDataTableFromDataSet(this.ViewData, srv.TimeItemService.BOName);
            foreach (DataRow drItem in dtTSItems.Rows)
            {
                switch (ConvertUtil.ToStringOrDefault(drItem["TIMEITEMTYPE"]))
                {
                    //_qc_type_normal
                    case "_qc_type_normal":
                        //todo:显示数据
                        this.lblTIMESPANS.Text += String.Format("关键时间点：{0} <br />", ConvertUtil.ToStringOrDefault(drItem["TIMESPOT"]));
                        break;
                    //_qc_type_dynamic
                    case "_qc_type_dynamic":
                        this.lblTIMESPAN.Text = ConvertUtil.ToStringOrDefault(drItem["TIMESPAN"]);
                        this.lblTIMESPOT.Text = ConvertUtil.ToStringOrDefault(drItem["TIMES"]);
                        break;

                    default: break;
                }
            }

        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = this.srv.LoadByKey(this.ID, true);
            this.ViewData.Merge(this.srv.TimeItemService.LoadByCondition("SCHEMAID = '" + this.ID + "'"));
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            try
            {

                //TIMEITEM
                srv.TimeItemService.DeleteByCondition("SCHEMAID = '" + this.ID + "'");

                //TS
                srv.DeleteByKey(this.ID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }

            Response.Redirect("TimeSchemaList.aspx?p=timeschemalist");
        }

        public void btnEdit_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("TimeSchemaEdit.aspx?p=timeschemaedit&id=" + this.ID);
        }

        public void btnNew_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("TimeSchemaEdit.aspx?p=timeschemanew");
        }
    }

}
