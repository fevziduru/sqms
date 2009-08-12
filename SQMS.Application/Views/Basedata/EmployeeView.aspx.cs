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
    public partial class EmployeeView1 : SQMSPage<EmployeeService>
    {
        private EmployeeService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = (EmployeeService)Service;
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "EMPLOYEE");
            if (drEmployee != null)
            {
                this.lblEmpName.Text = ConvertUtil.ToStringOrDefault(drEmployee["EMPNAME"]);
                this.lblEmpCode.Text = ConvertUtil.ToStringOrDefault(drEmployee["EMPCODE"]);
                this.lblEmpStatus.Text = ConvertUtil.ToStringOrDefault(drEmployee["EMPSTATUS"]);
                this.lblMobile.Text = ConvertUtil.ToStringOrDefault(drEmployee["MOBILE"]);
                this.lblDepartment.Text = ConvertUtil.ToStringOrDefault(
                    srv.GetReferenceValue("deptname", "department", "deptid", ConvertUtil.ToStringOrDefault(drEmployee["deptid"])));
                this.lblSex.Text = ConvertUtil.ToStringOrDefault(
                    srv.GetReferenceValue("enumname", "enumeration", "enumid", ConvertUtil.ToStringOrDefault(drEmployee["sex"])));
                this.lblEquipment.Text = ConvertUtil.ToStringOrDefault(
                    srv.GetReferenceValue("equname", "equipment", "equid", ConvertUtil.ToStringOrDefault(drEmployee["equid"])));
                this.lblJobTitile.Text = ConvertUtil.ToStringOrDefault(drEmployee["JOBTITLE"]);
                this.lblContactTel.Text = ConvertUtil.ToStringOrDefault(drEmployee["CONTACTTEL"]);
                this.lblDegree.Text = ConvertUtil.ToStringOrDefault(drEmployee["DEGREE"]);
                if (drEmployee["BIRTHDAY"].Equals(DBNull.Value))
                {
                    this.lblBirthday.Text = "";
                }
                else
                {
                    this.lblBirthday.Text = Convert.ToDateTime(drEmployee["BIRTHDAY"]).ToString("yyyy-MM-dd");
                }
            }

            DataRow drPassport = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "PASSPORT");
            if (drPassport != null)
            {
                this.lblPassport.Text = ConvertUtil.ToStringOrDefault(drPassport["PASSPORT"]);
            }
            else
            {
                this.tblPassport.Visible = false;
                this.tblRole.Visible = false;
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey(this.ID, true);
            this.ViewData.Merge(srv.GetPassportByEmployeeID(this.ID));
            this.ViewData.Merge(srv.RoleService.GetRolesView(this.ID));
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            srv.Delete(this.ViewData);
            Response.Redirect("EmployeeList.aspx?p=employeelist");
        }

        public void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeEdit.aspx?p=employeeedit&id=" + this.ID);
        }

        public void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeEdit.aspx?p=employeenew");
        }
    }
}
