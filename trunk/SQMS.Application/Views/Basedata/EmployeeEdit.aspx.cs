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

namespace SQMS.Application.Modules.Basedata
{
    public partial class EmployeeEdit : SQMSPage<EmployeeService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.OnInitializePage += new EventHandler<EventArgs>(RoleAssignment_OnInitializePage);
            this.OnInitializeUI += new EventHandler<EventArgs>(RoleAssignment_OnInitializeUI);
            this.OnLoadData += new EventHandler<EventArgs>(RoleAssignment_OnLoadData);
        }

        protected override void GetDataFromUI()
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(ViewData, "EMPLOYEE");
            if (drEmployee != null)
            {
                drEmployee["EMPID"] = Service.GetNextSequenceID();
                drEmployee["EMPNAME"] = this.txtEmpName.Text;
                drEmployee["EMPCODE"] = this.txtEmpCode.Text;
                drEmployee["EMPSTATUS"] = this.txtEmpStatus.Text;
                drEmployee["MOBILE"] = this.txtMobile.Text;
                drEmployee["JOBTITLE"] = this.txtJobTitile.Text;
                drEmployee["CONTACTTEL"] = this.txtContactTel.Text;
                drEmployee["DEGREE"] = this.txtDegree.Text;
            }

            //DataRow drNew = DataSetUtil.GetFirstRowFromDataSet(this.UIData, "Roles");

            //if (drNew != null)
            //{
            //    drNew["RoleCode"] = this.txtRoleCode.Text;
            //    drNew["RoleName"] = this.txtRoleName.Text;
            //    drNew["IsVoid"] = this.cbIsVoid.Checked ? "Y" : "N";
            //    drNew["Memo"] = this.txtMemo.Text;
            //    drNew["Created"] = DateTime.Now.ToString();
            //    drNew["CreatedBy"] = UserSecurityManager.UserContext.UserID;
            //    drNew["Modified"] = DateTime.Now.ToString();
            //    drNew["ModifiedBy"] = UserSecurityManager.UserContext.UserID;
            //}
        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void RoleAssignment_OnLoadData(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey("", true);
            
            //this.UIData = this.action.LoadUsersByCurrentUser();
            //this.UIData.Merge(this.action.LoadRolesByCurrentUser());
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void RoleAssignment_OnInitializeUI(object sender, EventArgs e)
        {
            if (this.ID.Length == 0)
            { 
                //新增


            }
            else
            {
                //编辑
            }

            //this.ddlUsers.DataSource = DataSetUtil.GetDataTableFromDataSet(this.UIData, "Users");
            //this.ddlUsers.DataTextField = "UserName";
            //this.ddlUsers.DataValueField = "UserID";
            //this.ddlUsers.DataBind();

            //this.roles.DataSource = DataSetUtil.GetDataTableFromDataSet(this.UIData, "Roles");
            //this.roles.DataTextField = "RoleName";
            //this.roles.DataValueField = "RoleID";
            //this.roles.DataBind();

            //this.UIData.Merge(this.action.LoadRolesByUserID(this.ddlUsers.SelectedValue));

            //foreach (DataRow row in this.UIData.Tables["UserRoleSession"].Rows)
            //{
            //    ListItem item = this.roles.Items.FindByValue(row["RoleID"].ToString());
            //    if (item != null)
            //    {
            //        item.Selected = true;
            //    }
            //}
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void RoleAssignment_OnInitializePage(object sender, EventArgs e)
        {
            //action = ActionFactory.CreateAction<RoleAssignmentAction>();
        }

        public void btnSave_Click(object sender, EventArgs e)
        {
            this.GetDataFromUI();
            this.Service.Save(this.ViewData);
        }
    }
}
