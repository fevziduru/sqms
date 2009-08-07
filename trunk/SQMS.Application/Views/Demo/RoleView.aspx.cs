using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using System.Data;
using EasyDev.Util;
using EasyDev.SQMS;

namespace SQMS.Application.Views.Demo
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
                this.CheckBoxIsVoid.Checked = false;

                this.LabelRoleCode.Text = ConvertUtil.EmptyOrString(drRole["ROLECODE"]);
                this.LabelRoleName.Text = ConvertUtil.EmptyOrString(drRole["ROLENAME"]);
                if(ConvertUtil.EmptyOrString(drRole["ISVOID"]) == "Y"){this.CheckBoxIsVoid.Checked = true;}
                this.LabelMemo.Text = ConvertUtil.EmptyOrString(drRole["MEMO"]);
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
