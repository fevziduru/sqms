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
using YYControls;
using System.Text;

namespace SQMS.Application.Views.Basedata
{

    public partial class OrganizationEdit : SQMSPage<OrganizationService>
    {
        private OrganizationService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUser == null)
            {
                Response.Redirect("~/Views/Security/Login.aspx");
            }
        }

        protected override void GetViewData()
        {


        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)  //2
        {
            this.ViewData = srv.GetORGViewALL();
        }

        /// <summary>
        /// 初始化界面控件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)    //3
        {
            DataTable dt = DataSetUtil.GetDataTableFromDataSet(this.ViewData, "ORGANIZATIONALL");
            //this.OrganizationTree1.CreateMenu(dt);

            if (this.ID.Length == 0)
            {
                //新增
                this.OrganizationEdit1.Load(null, CurrentUser.PassportID, srv, this.ViewData);
            }
            else
            {
                //编辑
                DataRow subdrSet = dt.Select(String.Format("ORGID = '{0}'", this.ID))[0];

                this.OrganizationEdit1.Load(this.ID, CurrentUser.PassportID, srv, this.ViewData);
            }
            
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
        {
            srv = Service as OrganizationService;

            this.OrganizationEdit1.Load(this.srv);
        }

    }

}
