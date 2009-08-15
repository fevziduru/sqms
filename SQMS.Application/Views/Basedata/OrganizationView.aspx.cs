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

namespace SQMS.Application.Views.Basedata
{

    public partial class OrganizationView : SQMSPage<OrganizationService>
    {
        private OrganizationService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = Service as OrganizationService;
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "ORGANIZATION");

            if (drEmployee != null)
            {
                this.lblOrgName.Text = ConvertUtil.ToStringOrDefault(drEmployee["ORGNAME"]);
                this.lblOrgCode.Text = ConvertUtil.ToStringOrDefault(drEmployee["ORGCODE"]);

                this.lblOrgClass.Text = ConvertUtil.ToStringOrDefault(drEmployee["ORGTYPE"]);

                this.lblOrgParent.Text = ConvertUtil.ToStringOrDefault(drEmployee["PARENTORG"]);
                this.lblOrgAlias.Text = ConvertUtil.ToStringOrDefault(drEmployee["ORGALIAS"]);
                this.lblOrgContact.Text = ConvertUtil.ToStringOrDefault(drEmployee["CONTACT"]);
                this.lblOrgConatctTel.Text = ConvertUtil.ToStringOrDefault(drEmployee["CONTACTTEL"]);
                this.lblOrgZIP.Text = ConvertUtil.ToStringOrDefault(drEmployee["ZIPCODE"]);
                this.lblOrgADD.Text = ConvertUtil.ToStringOrDefault(drEmployee["ORGADDRESS"]);
                this.lblOrgStatus.Text = ConvertUtil.ToStringOrDefault(drEmployee["ORGSTATUS"]);
                this.lblOrgMemo.Text = ConvertUtil.ToStringOrDefault(drEmployee["MEMO"]);

                this.lblOrgIsVoid.Text = ConvertUtil.ToStringOrDefault(drEmployee["ISVOID"]).Equals("Y") ? "禁用" : "启用";
            }

        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }


        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            try
            {
                //设置引用到它的节点
                srv.SetParent2null(this.ID);

                //ORG
                srv.DeleteByKey(this.ID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }


            Response.Redirect("OrganizationList.aspx?p=organizationlist");
        }

        public void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrganizationEdit.aspx?p=organizationedit&id=" + this.ID);
        }

        public void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrganizationEdit.aspx?p=organizationnew");
        }
    }
}
