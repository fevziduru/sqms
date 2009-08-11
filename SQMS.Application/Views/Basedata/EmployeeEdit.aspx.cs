using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.Util;
using System.Data;
using System.Web.Security;
using EasyDev.SQMS;
using SQMS.Application.HtmlHelper;
using log4net;

namespace SQMS.Application.Views.Basedata
{
    public partial class EmployeeEdit : SQMSPage<EmployeeService>
    {
        private ILog logger = LogManager.GetLogger(typeof(EmployeeEdit));

        private EmployeeService srv = null;
        public string currdate = DateTime.Now.ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(ViewData, "EMPLOYEE");
            if (drEmployee != null)
            {
                if (this.ID.Length == 0)
                {
                    drEmployee["EMPID"] = Service.GetNextSequenceID();
                }
                drEmployee["EMPNAME"] = this.txtEmpName.Text;
                drEmployee["EMPCODE"] = this.txtEmpCode.Text;
                drEmployee["EMPSTATUS"] = this.ddlStatus.SelectedValue;
                drEmployee["MOBILE"] = this.txtMobile.Text;
                drEmployee["DEPTID"] = this.ddlDepartment.SelectedValue;
                drEmployee["SEX"] = this.ddlSex.SelectedValue;
                //drEmployee["EQUID"] = this.ddlEquipment.SelectedValue;
                drEmployee["EQUID"] = this.refEquipment.SelectedValue;
                //drEmployee["JOBTITLE"] = this.txtJobTitile.Text;
                drEmployee["ISVOID"] = "N";
                drEmployee["CONTACTTEL"] = this.txtContactTel.Text;
                drEmployee["DEGREE"] = this.ddlDegree.SelectedValue;
                drEmployee["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drEmployee["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");

                drEmployee["CREATEDBY"] = CurrentUser.Passport;
                drEmployee["MODIFIEDBY"] = CurrentUser.Passport;
            }

            DataRow drPassport = DataSetUtil.GetFirstRowFromDataSet(ViewData, "PASSPORT");
            if (drPassport != null)
            {
                if (this.ID.Length == 0)
                {
                    drPassport["EMPID"] = drEmployee["EMPID"];
                    drPassport["PASSPORT"] = this.txtPassport.Text;
                    drPassport["PASSWORD"] = this.txtPassword.Text;
                    drPassport["ISVOID"] = "N";
                    drPassport["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drPassport["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drPassport["PASSPORTID"] = srv.PassportService.GetNextSequenceID();
                    drPassport["PASSPORTCODE"] = srv.PassportService.GenerateCode();
                    drPassport["CREATEDBY"] = srv.CurrentUser.Passport;
                    drPassport["MODIFIEDBY"] = srv.CurrentUser.Passport;

                    this.ID = ConvertUtil.ToStringOrDefault(drEmployee["EMPID"]);
                }
            }

            if (ConvertUtil.ToStringOrDefault(drPassport["PASSPORT"]).Length > 0)
            {
                //从界面取得角色数据
                DataTable dtRoles = this.ViewData.Tables["USERROLE"];
                if (dtRoles != null)
                {
                    dtRoles.Rows.Clear();
                }
                foreach (ListItem item in this.cblRoles.Items)
                {
                    if (item.Selected)
                    {
                        DataRow drRole = dtRoles.NewRow();
                        drRole["passportid"] = drPassport["passportid"];
                        drRole["roleid"] = item.Value;
                        dtRoles.Rows.Add(drRole);
                    }
                }
            }
            else
            {
                this.ViewData.Tables.Remove("PASSPORT");
                this.ViewData.Tables.Remove("USERROLE");
            }

            
        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)  //2
        {
            this.ViewData = Service.LoadByKey(this.ID, true);

            if (this.ID.Length != 0)
            {
                this.ViewData.Merge(srv.GetPassportByEmployeeID(this.ID));
                this.ViewData.Merge(srv.RoleService.GetRoleByEmployeeID(this.ID));
                //this.ViewData.Merge(srv.UserRoleService.LoadByKeys(null));
            }
            else
            {
                this.ViewData.Merge(srv.LoadPassportByKey(""));
                this.ViewData.Merge(srv.UserRoleService.LoadByKeys(null));
            }
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)    //3
        {
            ControlBindingHelper.BindDropDownList(this.ddlDepartment, srv.GetDepartments(), "deptname", "deptid");
            ControlBindingHelper.BindDropDownList(this.cblRoles, srv.GetRoles(), "rolename", "roleid");
            //ControlBindingHelper.BindDropDownList(this.ddlEquipment, srv.GetEquipments(), "equname", "equid");
            ControlBindingHelper.BindDropDownList(this.ddlSex, srv.GetSex(), "enumname", "enumid");
            ControlBindingHelper.BindDropDownList(this.ddlDegree, srv.EnumService.GetDegree(), "enumname", "enumid");
            ControlBindingHelper.BindDropDownList(this.ddlStatus, srv.EnumService.GetEnumByType("_empstatus"), "enumname", "enumid");

            if (this.ID.Length == 0)
            {
                //新增
                this.txtEmpCode.Text = srv.GenerateCode();

                this.txtPassport.Visible =
                    this.txtPassword.Visible =
                    this.lblCheckResult.Visible =
                    this.btnCheck.Visible =
                    this.txtConfirmPass.Visible = true;



                this.lblPassword.Visible = false;
            }
            else
            {
                DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "EMPLOYEE");

                //编辑
                this.txtEmpName.Text = ConvertUtil.ToStringOrDefault(drEmployee["EMPNAME"]);
                this.txtEmpCode.Text = ConvertUtil.ToStringOrDefault(drEmployee["EMPCODE"]);
                this.ddlStatus.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("enumname", "ENUMERATION", "ENUMID",
                    ConvertUtil.ToStringOrDefault(drEmployee["EMPSTATUS"])));
                this.txtMobile.Text = ConvertUtil.ToStringOrDefault(drEmployee["MOBILE"]);
                this.ddlDepartment.SelectedValue = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("deptname", "DEPARTMENT", "DEPTID",
                    ConvertUtil.ToStringOrDefault(drEmployee["DEPTID"])));
                this.ddlSex.SelectedValue = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("enumname", "ENUMERATION", "ENUMID",
                    ConvertUtil.ToStringOrDefault(drEmployee["sex"])));
                //this.ddlEquipment.SelectedValue = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("equname", "EQUIPMENT", "EQUID",
                //    ConvertUtil.ToStringOrDefault(drEmployee["EQUID"])));
                this.refEquipment.SelectedValue = ConvertUtil.ToStringOrDefault(drEmployee["EQUID"]);
                this.refEquipment.SelectedText = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("equname", "EQUIPMENT", "EQUID",
                    ConvertUtil.ToStringOrDefault(drEmployee["EQUID"])));
                //this.txtJobTitile.Text = ConvertUtil.ToStringOrDefault(drEmployee["JOBTITLE"]);
                this.txtContactTel.Text = ConvertUtil.ToStringOrDefault(drEmployee["CONTACTTEL"]);
                this.ddlDegree.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("enumname", "ENUMERATION", "ENUMID",
                    ConvertUtil.ToStringOrDefault(drEmployee["DEGREE"])));
                currdate = ConvertUtil.ToStringOrDefault(drEmployee["BIRTHDAY"]);

                /////////////////////////
                this.lblPassport.Text = this.txtPassport.Text = srv.GetPassport(ConvertUtil.ToStringOrDefault(drEmployee["EMPID"]));

                this.txtPassword.Attributes["value"] = "******";
                this.trConfirm.Visible = false;

                //////////////////////////

                string tmpRole = string.Empty;
                foreach (DataRow row in this.ViewData.Tables["USERROLE"].Rows)
                {
                    tmpRole += ConvertUtil.ToStringOrDefault(row["roleid"]) + ",";
                }

                foreach (ListItem item in this.cblRoles.Items)
                {
                    if (tmpRole.IndexOf(item.Value) >= 0)
                    {
                        item.Selected = true;
                    }
                }

                this.btnCheck.Visible =
                    this.txtPassport.Visible =
                    this.txtPassword.Visible =
                    this.txtConfirmPass.Visible = false;

                    this.lblCheckResult.Visible =
                    this.lblPassword.Visible = true;
            }
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
        {
            srv = (EmployeeService)Service;
        }


        public void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.txtPassport.Visible && this.txtPassword.Text.Equals(this.txtConfirmPass.Text) == false)
                {
                    throw new Exception("两次输入的密码不一致");
                }

                if (this.txtPassport.Visible && srv.PassportService.IsPassportExist(this.txtPassport.Text))
                {
                    throw new Exception("账号已经存在");
                }

                logger.Debug("Begin to Get Employee Data From View");
                this.GetViewData();

                logger.Debug("Begin to Save Employee Data");
                this.srv.Save(this.ViewData);
                logger.Debug("Ended Save Employee Data");
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("EmployeeView.aspx?p=employeeview&id=" + this.ID);
        }

        public void btnSignout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
        }

        public void btnSaveAndNew_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.txtPassport.Visible && this.txtPassword.Text.Equals(this.txtConfirmPass.Text) == false)
                {
                    throw new Exception("两次输入的密码不一致");
                }

                if (this.txtPassport.Visible && srv.PassportService.IsPassportExist(this.txtPassport.Text))
                {
                    throw new Exception("账号已经存在");
                }

                this.GetViewData();
                this.srv.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            Response.Redirect("EmployeeEdit.aspx?p=employeenew");
        }

        public void btnPassportCheck_Onclick(object sender, EventArgs e)
        {
            try
            {
                if (srv.PassportService.IsPassportExist(this.txtPassport.Text))
                {
                    this.lblCheckResult.Text = "此账号已经被占用";
                }
                else
                {
                    this.lblCheckResult.Text = "此账号可以使用";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
