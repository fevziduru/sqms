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
    public partial class RoleList : SQMSPage<RoleService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.gvList.Attributes.Add("SortExpression", "id");
                this.gvList.Attributes.Add("SortDirection", "ASC");
            }
        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {

        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = Service.LoadByCondition("ISVOID='N'");
        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            this.gvList.DataSource = this.ViewData;
            this.gvList.DataBind();
        }

        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Delete":
                    {
                        DataKey key = this.gvList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                        string id = ConvertUtil.ToStringOrDefault(key.Value);
                        Service.DeleteByKey(id);
                        break;
                    }
                case "Select":
                    {
                        DataKey key = this.gvList.DataKeys[Convert.ToInt32(e.CommandArgument)];
                        string id = ConvertUtil.ToStringOrDefault(key.Value);
                        Response.Redirect(String.Format("RoleEdit.aspx?id={0}", id));
                        break;
                    }
                case "Sort":

                default: break;
            }
        }

        protected void gvList_Sorting(object sender, GridViewSortEventArgs e)
        {
            // 从事件参数获取排序数据列
            string sortExpression = e.SortExpression.ToString();

            // 假定为排序方向为“顺序”
            string sortDirection = "ASC";

            // “ASC”与事件参数获取到的排序方向进行比较，进行GridView排序方向参数的修改
            if (sortExpression == this.gvList.Attributes["SortExpression"])
            {
                //获得下一次的排序状态
                sortDirection = (this.gvList.Attributes["SortDirection"].ToString() == sortDirection ? "DESC" : "ASC");
            }

            // 重新设定GridView排序数据列及排序方向
            this.gvList.Attributes["SortExpression"] = sortExpression;
            this.gvList.Attributes["SortDirection"] = sortDirection;

            DataView dv = this.ViewData.Tables[0].DefaultView;
            dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
            this.gvList.DataSource = dv;
            this.gvList.DataBind();
        }

        protected void gvList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.gvList.PageIndex = e.NewPageIndex;

            DataView dv = this.ViewData.Tables[0].DefaultView;
            string sortExpression = this.gvList.Attributes["SortExpression"].ToString();
            string sortDirection = this.gvList.Attributes["SortDirection"].ToString();

            dv.Sort = string.Format("{0} {1}", sortExpression, sortDirection);
            this.gvList.DataSource = dv;
            this.gvList.DataBind();
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
            this.ViewData = Service.LoadByCondition("ISVOID='N'");
            this.gvList.DataSource = this.ViewData;
            this.gvList.DataBind();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoleEdit.aspx");
        }
    }
}
