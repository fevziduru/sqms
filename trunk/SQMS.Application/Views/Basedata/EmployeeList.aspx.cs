using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.SQMS;
using EasyDev.Util;
using System.Data;

namespace SQMS.Application.Views.Basedata
{
    public partial class EmployeeList : SQMSPage<EmployeeService>
    {   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.gvEmployeeList.Attributes.Add("SortExpression", "EMPID");
                this.gvEmployeeList.Attributes.Add("SortDirection", "ASC");
            }
        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
                this.ViewData = Service.LoadByCondition("ORGANIZATIONID='" + CurrentUser.OrganizationID + "'");
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            this.gvEmployeeList.DataSource = this.ViewData;
            this.gvEmployeeList.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Delete":
                    {
                        DataKey key = this.gvEmployeeList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                        string id = ConvertUtil.ToStringOrDefault(key.Value);
                        ((EmployeeService)Service).DeleteByKey(id);
                        break;
                    }
                case "Select":
                    {
                        DataKey key = this.gvEmployeeList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                        string id = ConvertUtil.ToStringOrDefault(key.Value);
                        Response.Redirect("EmployeeEdit.aspx?p=employeeedit&id=" + id);
                        break;
                    }
                case "Sort":

                default: break;
            }
        }

        protected void gvEmployeeList_Sorting(object sender, GridViewSortEventArgs e)
        {
            // 从事件参数获取排序数据列
            string sortExpression = e.SortExpression.ToString();

            // 假定为排序方向为“顺序”
            string sortDirection = "ASC";

            // “ASC”与事件参数获取到的排序方向进行比较，进行GridView排序方向参数的修改
            if (sortExpression == this.gvEmployeeList.Attributes["SortExpression"])
            {
                //获得下一次的排序状态
                sortDirection = (this.gvEmployeeList.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }

            // 重新设定GridView排序数据列及排序方向
            this.gvEmployeeList.Attributes["SortExpression"] = sortExpression;
            this.gvEmployeeList.Attributes["SortDirection"] = sortDirection;
            
            DataView dv = this.ViewData.Tables[0].DefaultView;
            dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
            this.gvEmployeeList.DataSource = dv;
            this.gvEmployeeList.DataBind();
        }

        protected void gvEmployeeList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvEmployeeList.PageIndex = e.NewPageIndex;

            DataView dv = this.ViewData.Tables[0].DefaultView;
            string sortExpression = this.gvEmployeeList.Attributes["SortExpression"].ToString();
            string sortDirection = this.gvEmployeeList.Attributes["SortDirection"].ToString();

            dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);            
            this.gvEmployeeList.DataSource = dv;
            this.gvEmployeeList.DataBind();
        }

        public void btnDelete_OnClick(object sender, EventArgs e)
        {
            try
            {
                string[] ids = Request.Params["__KeyValues__"].ToString().Split(',');
                for (int i = 0; i < ids.Length; i++)
                {
                    Service.DeleteByKey(ids[i]);
                }
            }
            catch (System.Exception)
            {
                //todo:
            }

            //删除数据后重新加载数据
            this.ViewData = Service.LoadAll();
            this.gvEmployeeList.DataSource = this.ViewData;
            this.gvEmployeeList.DataBind();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeEdit.aspx");
        }
    }
}
