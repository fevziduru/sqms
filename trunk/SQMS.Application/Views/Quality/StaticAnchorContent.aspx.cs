using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.Util;
using System.Data;

namespace SQMS.Application.Views.Quality
{
        public partial class StaticAnchorContent : SQMSPage<QualityControlService>
        {
                public QualityControlService srv = null;

                /// <summary>
                /// 监控点ID
                /// </summary>
                public string MonitorPointID
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["MPID"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["mpid"]);
                                        ViewState.Add("MPID", tmp);
                                }

                                return tmp;
                        }
                }

                /// <summary>
                /// 时间项ID
                /// </summary>
                public string TimeItemID
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["TIMEITEMID"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["timetitemid"]);
                                        ViewState.Add("TIMEITEMID", tmp);
                                }

                                return tmp;
                        }
                }

                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        srv = Service as QualityControlService;
                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        this.lstImage.DataSource = ViewData.Tables[srv.BOName];
                        this.lstImage.DataBind();

                        this.lstVideo.DataSource = ViewData.Tables[srv.BOName + "_Video"];
                        this.lstVideo.DataBind();
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        //获取时间点数据
                        ViewData = srv.TimeItemService.LoadByCondition("organizationid='" + CurrentUser.OrganizationID + "'");
                        DataRow drTimeItem = DataSetUtil.GetFirstRowFromDataSet(ViewData,srv.TimeItemService.BOName);
                        int floattime = 3;
                        if (drTimeItem != null)
                        {
                                floattime = Convert.ToInt32(drTimeItem["FLOATTIME"]);
                        }

                        //获取常态质量数据
                        ViewData.Merge(srv.FindQualityData(MonitorPointID, "_qc_type_normal", floattime));
                        ViewData.Merge(srv.FindQualityVideoData(MonitorPointID, "_qc_type_normal", floattime));
                }
        }
}
