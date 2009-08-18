using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services.QualityControl;
using EasyDev.SQMS;
using EasyDev.BL.Services;
using System.Data;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

namespace SQMS.Application.Views.Road
{
    public partial class RoadList : SQMSPage<RegionService>
    {
        private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
        private RegionService svcRegion = null;
        private DataTable dtRegion
        {
            get 
            {
                return this.ViewState["dtRegion"] as DataTable;
            }
            set
            {
                value.TableName = "Region";
                this.ViewState.Add("dtRegion", value);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.svcRegion = this.svcManager.CreateService<RegionService>();
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

                this.dtRegion = this.svcRegion.GetRegionList(null);
                this.bindGridViewRoad(this.dtRegion);
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
            this.dtRegion = this.svcRegion.GetRegionList(null);
            this.GridViewRoad.DataSource = this.dtRegion.DefaultView;
            this.GridViewRoad.DataBind();
        }

        protected void GridViewRoad_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridViewRoad_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridViewRoad.PageIndex = e.NewPageIndex;
            this.GridViewRoad.DataSource = this.dtRegion.DefaultView;
            this.GridViewRoad.DataBind();
        }
    }
}
