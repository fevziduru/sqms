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
        public partial class AnchorContent : SQMSPage<QualityControlService>
        {
                public QualityControlService srv = null;

                /// <summary>
                /// 常态监控时间点
                /// </summary>
                public string TimeSpot
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["TIMESPOT"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["timespot"]);
                                        ViewState.Add("TIMESPOT", tmp);
                                }

                                return tmp;
                        }
                }

                /// <summary>
                /// 巡检的起始时间段
                /// </summary>
                public string BeginTime
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["BEGINTIME"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["begintime"]);
                                        ViewState.Add("BEGINTIME", tmp);
                                }

                                return tmp;
                        }
                }

                /// <summary>
                /// 巡检的结束时间段
                /// </summary>
                public string EndTime
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["ENDTIME"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["endtime"]);
                                        ViewState.Add("ENDTIME", tmp);
                                }

                                return tmp;
                        }
                }

                /// <summary>
                /// 监控类型
                /// </summary>
                public string Type
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["TYPE"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["type"]);
                                        ViewState.Add("TYPE", tmp);
                                }

                                return tmp;
                        }
                }

                /// <summary>
                /// 历史日期
                /// </summary>
                public string HistoryDate
                {
                        get
                        {
                                string tmp = ConvertUtil.ToStringOrDefault(ViewState["HISTORYDATE"]);
                                if (tmp == null || tmp.Length == 0)
                                {
                                        tmp = ConvertUtil.ToStringOrDefault(Request.QueryString["date"]);
                                        ViewState.Add("HISTORYDATE", tmp);
                                }

                                return tmp;
                        }
                }

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
                        this.lstImage.DataSource = ViewData.Tables[srv.BOName+"_Image"];
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

                        //获取常态或巡检质量数据
                        ViewData.Merge(srv.FindQualityData(MonitorPointID, this.Type, floattime, this.HistoryDate, TimeSpot, BeginTime, EndTime, "_Image"));
                        ViewData.Merge(srv.FindQualityData(MonitorPointID, this.Type, floattime, this.HistoryDate, TimeSpot, BeginTime, EndTime, "_Video"));
                }
        }
}
