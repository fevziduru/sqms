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
            
        }

        protected override void GetDataFromUI()
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(ViewData, "EMPLOYEE");
            if (drEmployee != null)
            {
                drEmployee["EMPID"] = Service.GetNextSequenceID();
                this.ID = ConvertUtil.EmptyOrString(drEmployee["EMPID"]);

                drEmployee["EMPNAME"] = this.txtEmpName.Text;
                drEmployee["EMPCODE"] = this.txtEmpCode.Text;
                drEmployee["EMPSTATUS"] = this.txtEmpStatus.Text;
                drEmployee["MOBILE"] = this.txtMobile.Text;
                drEmployee["JOBTITLE"] = this.txtJobTitile.Text;
                drEmployee["CONTACTTEL"] = this.txtContactTel.Text;
                drEmployee["DEGREE"] = this.txtDegree.Text;
            }
        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByKey("", true);
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            if (this.ID.Length == 0)
            {
                //新增
            }
            else
            {
                //编辑
            }
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            base.OnPreInitializeViewEventHandler(sender, e);
        }


        public void btnSave_Click(object sender, EventArgs e)
        {
            this.GetDataFromUI();
            this.Service.Save(this.ViewData);

            Response.Redirect("EmployeeView.aspx?id=" + this.ID);
        }
    }
}
