using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Util;
using System.Data;
using EasyDev.SQMS;
using SQMS.Services;

namespace SQMS.Application.Views.Basedata
{
    public partial class ResourceView : SQMSPage<ResourceService>
    {
        private ResourceService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = Service as ResourceService;
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drRes = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);

            if (drRes != null)
            {
                this.lblResCode.Text = ConvertUtil.ToStringOrDefault(drRes["RESCODE"]);
                this.lblResName.Text = ConvertUtil.ToStringOrDefault(drRes["RESNAME"]);
                this.lblResIdentity.Text = ConvertUtil.ToStringOrDefault(drRes["RESIDENTITY"]);
                this.lblViewName.Text = ConvertUtil.ToStringOrDefault(drRes["VIEWNAME"]);
                this.lblIsvoid.Text = ConvertUtil.ToStringOrDefault(drRes["ISVOID"]).Equals("Y") ? "禁用" : "启用";
                this.btnActiveBottom.Visible = this.btnActiveTop.Visible =
                    ConvertUtil.ToStringOrDefault(drRes["ISVOID"]).Equals("Y");
                this.btnInactiveBottom.Visible = this.btnInactiveTop.Visible =
                    ConvertUtil.ToStringOrDefault(drRes["ISVOID"]).Equals("N");
                this.lblMemo.Text = ConvertUtil.ToStringOrDefault(drRes["MEMO"]);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Service.DeleteByKey(this.ID);

            Response.Redirect("ResourceList.aspx?p=reslist");
        }

        public void btnEdit_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ResourceEdit.aspx?p=resedit&id=" + this.ID);
        }

        public void btnActive_OnClick(object sender, EventArgs e)
        {
            srv.ActiveByKey(this.ID);
            Response.Redirect("ResourceList.aspx?p=reslist");
        }
    }
}
