using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using EasyDev.SQMS;
using EasyDev.BL;
using System.Data;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

namespace SQMS.Application.Views.Road
{
    public partial class RoadList : SQMSPage<RoadService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private RoadService svcRoad = null;
        private DataTable dtRoad
        {
            get 
            {
                return this.ViewState["dtRoad"] as DataTable;
            }
            set
            {
                value.TableName = "Road";
                this.ViewState.Add("dtRoad", value);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.svcRoad = this.svcManager.CreateService<RoadService>();
        }


        private void bindGridViewRoad(DataTable dt)
        {
            this.GridViewRoad.DataSource = dt;
            this.GridViewRoad.DataBind();
            this.UpdatePanelGridViewRoad.Update();
        }
        protected override void OnLoad(EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GridViewRoad.Attributes.Add("SortExpression", "id");
                this.GridViewRoad.Attributes.Add("SortDirection", "ASC");

                this.dtRoad = this.svcRoad.GetRoadList(null);
                this.bindGridViewRoad(this.dtRoad);
            }
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            base.OnLoadDataEventHandler(sender, e);
            
        }
        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string[] ids = Request.Params["__KeyValues__"].ToString().Split(',');
                for (int i = 0; i < ids.Length; i++)
                {
                    Service.DeleteByKey(ids[i]);
                }
            }
            catch
            {
                
            }

            //删除数据后重新加载数据
            this.dtRoad = this.svcRoad.GetRoadList(null);
            this.GridViewRoad.DataSource = this.dtRoad.DefaultView;
            this.GridViewRoad.DataBind();
        }

        protected void GridViewRoad_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridViewRoad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridViewRoad.PageIndex = e.NewPageIndex;
            this.GridViewRoad.DataSource = this.dtRoad.DefaultView;
            this.GridViewRoad.DataBind();
        }
    }
}
