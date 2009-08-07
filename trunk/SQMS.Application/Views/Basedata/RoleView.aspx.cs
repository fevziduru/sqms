using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Presentation;
using SQMS.Services;
using EasyDev.BL.Services;
using SQMS.Application.Foundations;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Basedata
{
    public partial class RoleView : SQMSPage<RoleService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drRole = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "ROLE");
            if (drRole != null)
            {


                this.lblRoleCode.Text = ConvertUtil.EmptyOrString(drRole["ROLECODE"]);
                this.lblRoleName.Text = ConvertUtil.EmptyOrString(drRole["ROLENAME"]);
                this.cbIsVoid.Checked = ConvertUtil.EmptyOrString(drRole["ISVOID"]) == "Y" ? true : false;
                this.lblMemo.Text = ConvertUtil.EmptyOrString(drRole["MEMO"]);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Service.DeleteByKey(this.ID);

            Response.Redirect("RoleEdit.aspx");
        }
    }
}
