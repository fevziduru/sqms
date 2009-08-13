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
using SQMS.Application.Views.Common;

namespace SQMS.Application.Views.Basedata
{
    public partial class RoleView : SQMSPage<RoleService>
    {
        private RoleService srv = null;
        private Common.sGridItemList sGridItemlist;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            srv = Service as RoleService;
            sGridItemlist = new Common.sGridItemList(srv, this.ID);
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            DataRow drRole = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "ROLE");
            if (drRole != null)
            {
                this.lblRoleCode.Text = ConvertUtil.ToStringOrDefault(drRole["ROLECODE"]);
                this.lblRoleName.Text = ConvertUtil.ToStringOrDefault(drRole["ROLENAME"]);
                this.lblStatus.Text = ConvertUtil.ToStringOrDefault(drRole["ISVOID"]) == "Y" ? "禁用" : "启用";
                this.lblMeno.Text = ConvertUtil.ToStringOrDefault(drRole["MEMO"]);
            }

            ////显示权限设置
            //DataTable dtResPer = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESPERMISSION");
            //foreach (DataRow dr in dtResPer.Rows)
            //{

            //}

            this.ShowGrid();
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = srv.LoadByKey(this.ID, true);
            this.ViewData.Merge(srv.ResourceService.LoadByCondition("ISVOID='N'"));
            this.ViewData.Merge(srv.OperationService.LoadByCondition("ISVOID='N'"));
            this.ViewData.Merge(srv.ResPermissionService.LoadByCondition("roleid='" + this.ID + "'"));
        }


        /// <summary>
        /// 显示权限设置界面
        /// </summary>
        private void ShowGrid()
        {

            //清空
            this.sGrid.Columns.Clear();

            //添加资源列
            BoundField bf1 = new BoundField() { DataField = "RESTYPE", HeaderText = "分类", SortExpression = "RESTYPE", Visible = true };
            bf1.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            bf1.ItemStyle.VerticalAlign = VerticalAlign.Middle;
            //bf1.ItemStyle.BorderStyle = BorderStyle.None;

            BoundField bf2 = new BoundField() { DataField = "resid", HeaderText = "功能标识", SortExpression = "resid", Visible = true };
            bf2.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;

            BoundField bf3 = new BoundField() { DataField = "RESNAME", HeaderText = "功能点", SortExpression = "RESNAME" };
            bf3.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
            this.sGrid.Columns.Add(bf1);
            this.sGrid.Columns.Add(bf2);
            this.sGrid.Columns.Add(bf3);

            //添加权限列
            DataTable dtOperation = DataSetUtil.GetDataTableFromDataSet(ViewData, "OPERATION");
            //int count_op = dtOperation.Rows.Count;
            foreach (DataRow dr in dtOperation.Rows)
            {
                TemplateField bf = new TemplateField() { HeaderText = ConvertUtil.ToStringOrDefault(dr["OPNAME"]), SortExpression = "" };
                bf.ItemTemplate =  sGridItemlist.GetsGridItem(DataControlRowType.EmptyDataRow, ConvertUtil.ToStringOrDefault(dr["OPID"]), ConvertUtil.ToStringOrDefault(dr["OPNAME"]));
                bf.HeaderTemplate = sGridItemlist.GetsGridItem(DataControlRowType.Header, ConvertUtil.ToStringOrDefault(dr["OPID"]), ConvertUtil.ToStringOrDefault(dr["OPNAME"]));
                bf.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                bf.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                this.sGrid.Columns.Add(bf);
            }

            //显示GRID
            DataTable dtRESOURCE = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESOURCEITEM");
            DataView dvRes = dtRESOURCE.DefaultView;
            dvRes.Sort = "RESTYPE";
            //int count_res = dtRESOURCE.Rows.Count;

            this.sGrid.DataSource = dvRes.Table;
            this.sGrid.DataBind();

            //显示权限设置
            DataTable dtResPer = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESPERMISSION");
            foreach (DataRow dr in dtResPer.Rows)
            {
                foreach (GridViewRow gvr in this.sGrid.Rows)
                {
                    if (gvr.Cells[1].Text == ConvertUtil.ToStringOrDefault(dr["RESID"]))
                    {
                        CheckBox cb = gvr.FindControl(ConvertUtil.ToStringOrDefault(dr["OPID"])) as CheckBox;
                        if (cb != null)
                        {
                            cb.Checked = true;
                        }
                    }
                }
            }

        }

        public void btnDelete_OnClick(object sender, EventArgs e)//删除
        {
            try
            {
                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add("ROLEID", this.ID);

                //ResPermission
                srv.ResPermissionService.DeleteByKeys(dic);

                //UserRole
                srv.UserRoleService.DeleteByKeys(dic);

                //Role
                srv.DeleteByKey(this.ID);
            }
            catch (System.Exception ex)
            {
                throw ex;
            }

            Response.Redirect("RoleList.aspx");
        }

        public void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoleEdit.aspx?p=employeeedit&id=" + this.ID);
        }

        public void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoleEdit.aspx?p=employeenew");
        }




    }
}
