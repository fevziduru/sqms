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

namespace SQMS.Application.Views.Basedata
{
    public partial class RoleView : SQMSPage<RoleService>
    {
        private RoleService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = Service as RoleService;
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drRole = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "ROLE");
            if (drRole != null)
            {
                this.lblRoleCode.Text = ConvertUtil.EmptyOrString(drRole["ROLECODE"]);
                this.lblRoleName.Text = ConvertUtil.EmptyOrString(drRole["ROLENAME"]);
                this.cbIsVoid.Checked = ConvertUtil.EmptyOrString(drRole["ISVOID"]) == "Y" ? true : false;
                this.tbMemo.Text = ConvertUtil.EmptyOrString(drRole["MEMO"]);
            }

            //显示权限设置
            DataTable dtResPer = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESPERMISSION");
            foreach (DataRow dr in dtResPer.Rows)
            {
                this.tbPermission.Text += String.Format("资源：{0}  \t 操作：{1} \r\n", ConvertUtil.EmptyOrString(dr["RESID"]), ConvertUtil.EmptyOrString(dr["OPID"]));
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = srv.LoadByKey(this.ID, true);

            Dictionary<string, object> d = new Dictionary<string, object>();
            d.Add("ROLEID", this.ID);
            this.ViewData.Merge(srv.ResPermissionService.LoadByKeys(d));
        }

        public void btnDelete_OnClick(object sender, EventArgs e)//删除
        {

            try
            {
                    Dictionary<string, object> dic = new Dictionary<string, object>();
                    dic.Add("ROLEID", this.ID);
                    srv.ResPermissionService.DeleteByKeys(dic);

                    srv.DeleteByKey(this.ID);
            }
            catch (System.Exception)
            {

            }

            Response.Redirect("RoleEdit.aspx");
        }

        protected void ButtonEdit_Click(object sender, EventArgs e)//编辑
        {
            Response.Redirect(String.Format("RoleEdit.aspx?id={0}", this.ID));
        }

        protected void ButtonBack2List_Click(object sender, EventArgs e)//列表
        {
            Response.Redirect("RoleList.aspx");
        }
    }
}
