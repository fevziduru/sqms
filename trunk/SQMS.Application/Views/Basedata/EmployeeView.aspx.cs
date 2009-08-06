using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using SQMS.Application.Foundations;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Basedata
{
    public partial class EmployeeView : SQMSPage<EmployeeService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "EMPLOYEE");
            if (drEmployee != null)
            {
                this.lblEmpName.Text = ConvertUtil.EmptyOrString(drEmployee["EMPNAME"]);
                this.lblEmpCode.Text = ConvertUtil.EmptyOrString(drEmployee["EMPCODE"]);
                this.lblEmpStatus.Text = ConvertUtil.EmptyOrString(drEmployee["EMPSTATUS"]);
                this.lblDegree.Text = ConvertUtil.EmptyOrString(drEmployee["DEGREE"]);
                this.lblContactTel.Text = ConvertUtil.EmptyOrString(drEmployee["CONTACTTEL"]);
                this.lblJobTitile.Text = ConvertUtil.EmptyOrString(drEmployee["JOBTITLE"]);
                this.lblMobile.Text = ConvertUtil.EmptyOrString(drEmployee["MOBILE"]);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            Service.DeleteByKey(this.ID);

            Response.Redirect("EmployeeEdit.aspx");
        }
    }
}
