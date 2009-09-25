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

        public partial class TrashEntranceView : SQMSPage<MonitorPointService>
        {
            protected void Page_Load(object sender, EventArgs e)
            {

            }

            protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
            {
                DataRow drMP = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);

                if (drMP != null)
                {
                    this.lblMPCode.Text = ConvertUtil.ToStringOrDefault(drMP["MPCODE"]);
                    this.lblMPName.Text = ConvertUtil.ToStringOrDefault(drMP["MPNAME"]);

                    this.lblImportance.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("ENUMNAME", "ENUMERATION", "ENUMID", ConvertUtil.ToStringOrDefault(drMP["IMPORTANCE"])));
                    this.lblRoad.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("roadname", "road", "roadid", ConvertUtil.ToStringOrDefault(drMP["roadid"])));
                    this.lblTimeSchema.Text = ConvertUtil.ToStringOrDefault(Service.GetReferenceValue("schemaname", "timeschema", "schemaid", ConvertUtil.ToStringOrDefault(drMP["schemaid"])));
                    //this.lblLng.Text = ConvertUtil.ToStringOrDefault(drMP["LONGITUDE"]);
                    //this.lblLat.Text = ConvertUtil.ToStringOrDefault(drMP["LATITUDE"]);
                    this.lblOrderInRoad.Text = ConvertUtil.ToStringOrDefault(drMP["ORDERINROAD"]);
                    this.lblFloatDist.Text = ConvertUtil.ToStringOrDefault(drMP["FLOATDIST"]);
                    this.lblMapLevel.Text = ConvertUtil.ToStringOrDefault(drMP["MPLEVEL"]);

                    this.lblIsvoid.Text = ConvertUtil.ToStringOrDefault(drMP["ISVOID"]).Equals("Y") ? "禁用" : "启用";
                    this.lblMemo.Text = ConvertUtil.ToStringOrDefault(drMP["MEMO"]);

                    this.btnViewMPBottom.Attributes.Add("onclick", string.Format("OpenDialog('{0}','{1}')", this.ID, ConvertUtil.ToStringOrDefault(drMP["MPNAME"])));
                    this.btnViewMPTop.Attributes.Add("onclick", string.Format("OpenDialog('{0}','{1}')", this.ID, ConvertUtil.ToStringOrDefault(drMP["MPNAME"])));
                }
            }

            protected override void OnLoadDataEventHandler(object sender, EventArgs e)
            {
                this.ViewData = Service.LoadByKey(this.ID, true);
            }

            public void btnDelete_OnClick(object sender, EventArgs e)
            {
                Service.DeleteByKey(this.ID);

                Response.Redirect("TrashEntranceList.aspx?p=trashentrancelist");
            }

            public void btnEdit_OnClick(object sender, EventArgs e)
            {
                Response.Redirect("TrashEntranceEdit.aspx?p=trashentranceedit&id=" + this.ID);
            }

            public void btnNew_OnClick(object sender, EventArgs e)
            {
                Response.Redirect("TrashEntranceEdit.aspx?p=trashentrancenew");
            }

            public void btnQuality_OnClick(object sender, EventArgs e)
            {
                Response.Redirect("QualityAppraisalList.aspx?p=qalist&id=" + this.ID);
            }
        }

}
