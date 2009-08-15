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

        private DataTable dtRegion = null;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.svcRegion = this.svcManager.CreateService<RegionService>();
            if (!IsPostBack)
            {
                this.Pagingbar1.CurrentPageChanging += new CommandEventHandler(Pagingbar1_CurrentPageChanging);
                this.Pagingbar1.AlternatelyMode = SQMS.Application.Views.Components.List.PagingBar.AlternatelyModeEnum.PostBack;
                this.Pagingbar1.PageSize = 1;
                this.Pagingbar1.RowsCount = this.svcRegion.GetRegionListCount(this.CurrentUser.OrganizationID);
                this.Pagingbar1.Init();
            }
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

                this.dtRegion = this.svcRegion.GetRegionList(new PagingParameter(1, 1));
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
        protected void Pagingbar1_CurrentPageChanging(object sender, CommandEventArgs e)
        {
            int clickedPageNo = ConvertUtil.ToInt(e.CommandArgument);
            PagingParameter p = new PagingParameter(clickedPageNo, this.Pagingbar1.PageSize);
            this.dtRegion = this.svcRegion.GetRegionList(p);
            this.bindGridViewRoad(this.dtRegion);
            this.Pagingbar1.CurrentPage = clickedPageNo;
           
        }
        protected void ButtonNew_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewRoad_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void GridViewRoad_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}
