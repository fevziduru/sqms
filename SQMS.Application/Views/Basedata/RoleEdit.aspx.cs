using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Presentation;
using SQMS.Services;
using EasyDev.BL;
using EasyDev.SQMS;
using System.Data;
using EasyDev.Util;
using YYControls;
using System.Text;

namespace SQMS.Application.Views.Basedata
{
    public partial class RoleEdit : SQMSPage<RoleService>
    {
        private RoleService srv = null;
        private PassportService passportService = null;
        private Common.sGridItemList sGridItemlist;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drRole = DataSetUtil.GetFirstRowFromDataSet(ViewData, "ROLE");

            

            if (drRole != null)
            {
                if (this.ID.Length == 0)
                {
                    this.ID = Service.GetNextSequenceID();
                    drRole["CREATED"] = DateTime.Now.ToString();
                    drRole["CREATEDBY"] = CurrentUser.PassportID;
                }

                drRole["ROLEID"] = this.ID;
                drRole["ROLECODE"] = this.txtRoleCode.Text;
                drRole["ROLENAME"] = this.txtRoleName.Text;
                drRole["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";
                drRole["MEMO"] = this.txtMemo.Text;
                drRole["MODIFIED"] = DateTime.Now.ToString();
                drRole["MODIFIEDBY"] = CurrentUser.PassportID;
                drRole["ORGANIZATIONID"] = CurrentUser.OrganizationID;
            }

        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)  //2
        {
            this.ViewData = srv.LoadByKey(this.ID, true);

            this.ViewData.Merge(srv.ResourceService.LoadByCondition("ISVOID='N'"));

            //this.ViewData.Merge(srv.ResourceService.GetResourceClass());

            this.ViewData.Merge(srv.OperationService.LoadByCondition("ISVOID='N'"));

            //Dictionary<string, object> d = new Dictionary<string, object>(); 
            //d.Add("ROLEID", this.ID);
            this.ViewData.Merge(srv.ResPermissionService.LoadByCondition("roleid='"+this.ID+"'"));
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
                    this.txtRoleCode.Text = ConvertUtil.ToStringOrDefault(drRole["ROLECODE"]);
                    this.txtRoleName.Text = ConvertUtil.ToStringOrDefault(drRole["ROLENAME"]);
                    this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drRole["MEMO"]);
                    this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drRole["ISVOID"]).Equals("Y") ? true : false;
                }
            }

            this.ShowGrid();
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
        {
            srv = Service as RoleService;
            passportService = EasyDev.BL.ServiceManagerFactory.CreateNativeServiceManager().CreateService<PassportService>();

            sGridItemlist = new Common.sGridItemList(srv, this.ID);

            if (IsPostBack)
            {
                OnLoadDataEventHandler(sender, e);
                ShowGrid();
            }
        }

        /// <summary>
        /// 显示权限设置界面
        /// </summary>
        private void ShowGrid()
        {
            //显示列表
            //DataTable dtRESClass = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESOURCECLASS");

            //if (this.DropDownListClass.Items.Count == 1)
            //{
            //    foreach (DataRow dr in dtRESClass.Rows)
            //    {
            //        this.DropDownListClass.Items.Add(new ListItem(ConvertUtil.EmptyOrString(dr["RESTYPE"]), ConvertUtil.EmptyOrString(dr["RESTYPE"])));
            //    }
            //}


            //清空
            this.sGrid.Columns.Clear();

            //添加选框列
            //TemplateField bfd = new TemplateField() ;
            //bfd.ItemTemplate = sGridItemlist.GetsGridItem(DataControlRowType.Separator,"item","item");
            //bfd.HeaderTemplate = sGridItemlist.GetsGridItem(DataControlRowType.Separator, "all", "all");
            //this.sGrid.Columns.Add(bfd);

            //添加资源列
            BoundField bf1 = new BoundField() { DataField = "RESTYPE", HeaderText = "分类", SortExpression = "RESTYPE", Visible = true };
            bf1.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            bf1.ItemStyle.VerticalAlign = VerticalAlign.Middle;
            //bf1.ItemStyle.BorderStyle = BorderStyle.None;

            BoundField bf2 = new BoundField() { DataField = "resid", HeaderText = "功能标识", SortExpression = "resid", Visible = true};
            bf2.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
            //TemplateField bf4 = new TemplateField() { HeaderText = "RESID", SortExpression = "RESID" };
            //bf4.ItemTemplate = sGridItemlist.GetsGridItem(DataControlRowType.EmptyDataRow, "", "");
            //bf4.HeaderTemplate = sGridItemlist.GetsGridItem(DataControlRowType.Header, "", "资源名称");
            //bf4.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            //bf4.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            //this.sGrid.Columns.Add(bf4);

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
                bf.ItemTemplate = sGridItemlist.GetsGridItem(DataControlRowType.DataRow, ConvertUtil.ToStringOrDefault(dr["OPID"]), ConvertUtil.ToStringOrDefault(dr["OPNAME"]));
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
                        CheckBox cb = gvr.FindControl(ConvertUtil.EmptyOrString(dr["OPID"])) as CheckBox;
                        if (cb != null)
                        {
                            cb.Checked = true;
                        }
                    }
                }
            }

        }

        protected void btnSA_Click(object sender, EventArgs e)//Save&New
        {
            try
            {
                this.GetViewData();
                this.srv.Save(this.ViewData);
                this.SaveRolePermission();

                //如果当前登录用户的角色与修改的角色相同时要更新当前登录用户的授权信息
                if (CurrentUser.RoleID.Equals(this.ID))
                {
                    CurrentUser.Permissions = passportService.GetUserPermission(CurrentUser.Passport, this.ID);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("RoleEdit.aspx?p=roleedit");
        }

        public void btnSave_Click(object sender, EventArgs e)//Save
        {
            try
            {
                this.GetViewData();
                this.srv.Save(this.ViewData);
                this.SaveRolePermission();

                //如果当前登录用户的角色与修改的角色相同时要更新当前登录用户的授权信息
                if (CurrentUser.RoleID.Equals(this.ID))
                {
                    CurrentUser.Permissions = passportService.GetUserPermission(CurrentUser.Passport, this.ID);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect(String.Format("RoleView.aspx?p=roleview&id={0}", this.ID));
        }

        private void SaveRolePermission()
        {
            this.sGridItemlist.SaveOthers(this.ID);
        }

        protected void btnBack2List_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoleList.aspx?p=rolelist");
        }

        protected void lbPerSelect_Click(object sender, EventArgs e)
        {
            //todo:
        }

        protected void btnDelPermission_Click(object sender, EventArgs e)
        {

            // Select the checkboxes from the GridView control
            for (int i = 0; i < this.sGrid.Rows.Count; i++)
            {
                GridViewRow row = this.sGrid.Rows[i];
                bool isChecked = ((CheckBox)row.FindControl("item")).Checked;

                if (isChecked)
                {
                    Dictionary<string, object> dic = new Dictionary<string, object>();

                    dic.Add("RESID", this.sGrid.Rows[i].Cells[1].Text);//RESID
                    dic.Add("ROLEID", this.ID);//ROLEID
                    srv.ResPermissionService.DeleteByKeys(dic);

                }
            }

        }

        protected void DropDownListClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }

}
