﻿using System;
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
    public partial class RoleEdit : SQMSPage<RoleService>
    {

        private RoleService srv = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(ViewData, "ROLE");

            if (this.ID.Length == 0)
            {
                this.ID = Service.GetNextSequenceID();
            }

            if (drEmployee != null)
            {
                drEmployee["ROLEID"] = this.ID;

                drEmployee["ROLECODE"] = this.txtRoleCode.Text;
                drEmployee["ROLENAME"] = this.txtRoleName.Text;
                drEmployee["ISVOID"] = this.cbIsVoid.Checked ? "Y" : "N";
                drEmployee["MEMO"] = this.txtMemo.Text;
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
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)    //3
        {
            if (this.ID.Length == 0)
            {
                //新增
            }
            else
            {
                //编辑
                DataRow drRole = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "ROLE");
                if (drRole != null)
                {
                    this.txtRoleCode.Text = ConvertUtil.EmptyOrString(drRole["ROLECODE"]);
                    this.txtRoleName.Text = ConvertUtil.EmptyOrString(drRole["ROLENAME"]);
                    this.txtMemo.Text = ConvertUtil.EmptyOrString(drRole["MEMO"]);
                    this.cbIsVoid.Checked = ConvertUtil.EmptyOrString(drRole["ISVOID"]).Equals("Y") ? true : false;
                }
            }
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
        {
            srv = Service as RoleService;
        }


        public void btnSave_Click(object sender, EventArgs e)
        {
            this.GetViewData();
            this.srv.Save(this.ViewData);

            Response.Redirect(String.Format("RoleView.aspx?id={0}", this.ID));
        }
    }
}
