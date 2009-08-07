using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Presentation;
using SQMS.Services;
using EasyDev.BL.Services;
using EasyDev.SQMS;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Basedata
{

    public partial class OperationView : SQMSPage<OperationService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drOP = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "OPERATION");
            if (drOP != null)
            {
                this.lblOpCode.Text = ConvertUtil.EmptyOrString(drOP["OPCODE"]);
                this.lblOpName.Text = ConvertUtil.EmptyOrString(drOP["OPNAME"]);
                this.lblOpMemo.Text = ConvertUtil.EmptyOrString(drOP["MEMO"]);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Service.DeleteByKey(this.ID);

            Response.Redirect("OperationEdit.aspx");
        }
    }
}
