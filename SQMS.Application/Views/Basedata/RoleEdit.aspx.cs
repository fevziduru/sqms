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
            DataRow drRole = DataSetUtil.GetFirstRowFromDataSet(ViewData, "ROLE");

            if (this.ID.Length == 0)
            {
                this.ID = Service.GetNextSequenceID();
            }

            if (drRole != null)
            {
                drRole["ROLEID"] = this.ID;

                drRole["ROLECODE"] = this.txtRoleCode.Text;
                drRole["ROLENAME"] = this.txtRoleName.Text;
                drRole["ISVOID"] = this.cbIsVoid.Checked ? "Y" : "N";
                drRole["MEMO"] = this.txtMemo.Text;
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

            this.ViewData.Merge(srv.ResourceService.GetResourceItemsView());
            this.ViewData.Merge(srv.OperationService.LoadAll());

            Dictionary<string, object> d = new Dictionary<string, object>(); d.Add("ROLEID", this.ID);
            this.ViewData.Merge(srv.ResPermissionService.LoadByKeys(d));

            this.ViewData.Merge(srv.ResourceService.GetResourceClass());

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

                this.ShowGrid();
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

            if (IsPostBack)
            {
                OnLoadDataEventHandler(sender, e);
                ShowGrid();
            }
        }


        public void btnSave_Click(object sender, EventArgs e)
        {
            this.GetViewData();
            this.srv.Save(this.ViewData);

            Response.Redirect(String.Format("RoleView.aspx?id={0}", this.ID));
        }

        /// <summary>
        /// 显示权限设置界面
        /// </summary>
        private void ShowGrid()
        {
            //显示分类列表
            DataTable dtRESClass = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESOURCECLASS");
            this.DropDownListClass.Visible = true;
            this.DropDownListClass.Items.Clear();

            foreach (DataRow dr in dtRESClass.Rows)
            {
                this.DropDownListClass.Items.Add(new ListItem(ConvertUtil.EmptyOrString(dr["RESTYPE"]), ConvertUtil.EmptyOrString(dr["RESTYPE"])));
            }

            this.sGrid.Columns.Clear();

            //<asp:BoundField DataField="RESTYPE" HeaderText="分类" SortExpression="RESTYPE" />
            //<asp:BoundField DataField="RESNAME" HeaderText="功能点" SortExpression="RESNAME" />

            BoundField bf1 = new BoundField() { DataField="RESTYPE", HeaderText="分类", SortExpression="RESTYPE" };
            BoundField bf2 = new BoundField() { DataField = "RESID", HeaderText = "功能ID", SortExpression = "RESID" };
            BoundField bf3 = new BoundField() { DataField = "RESNAME", HeaderText = "功能点", SortExpression = "RESNAME" };
            this.sGrid.Columns.Add(bf1);
            this.sGrid.Columns.Add(bf2);
            this.sGrid.Columns.Add(bf3);

            //附加权限列
            DataTable dtOperation = DataSetUtil.GetDataTableFromDataSet(ViewData, "OPERATION");
            int count_op = dtOperation.Rows.Count;

            foreach (DataRow dr in dtOperation.Rows)
            {
                TemplateField bf = new TemplateField() { HeaderText = ConvertUtil.EmptyOrString(dr["OPNAME"]), SortExpression = "" };
                bf.ItemTemplate = new Common.sGridItemTemplate(DataControlRowType.DataRow, ConvertUtil.EmptyOrString(dr["OPNAME"]),ConvertUtil.EmptyOrString(dr["OPID"]),srv, this.ID);
                bf.HeaderTemplate = new Common.sGridItemTemplate(DataControlRowType.Header, ConvertUtil.EmptyOrString(dr["OPNAME"]), ConvertUtil.EmptyOrString(dr["OPID"]), srv, this.ID);
                this.sGrid.Columns.Add(bf);
            }

            //显示GRID
            DataTable dtRESOURCE = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESOURCEVIEW");
            int count_res = dtRESOURCE.Rows.Count;

            this.sGrid.DataSource = dtRESOURCE;
            this.sGrid.DataBind();

            //显示权限设置
            DataTable dtResPer = DataSetUtil.GetDataTableFromDataSet(ViewData, "RESPERMISSION");
            foreach (DataRow dr in dtResPer.Rows)
            {
                foreach (GridViewRow gvr in this.sGrid.Rows)
                {
                    if (gvr.Cells[1].Text == ConvertUtil.EmptyOrString(dr["RESID"]))
                    {
                        (gvr.FindControl(ConvertUtil.EmptyOrString(dr["OPID"])) as CheckBox).Checked = true;
                    }
                }
            }

        }

        protected void DropDownListClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            throw (new NotImplementedException());
        }

    }

}
