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
        public partial class AnchorDetail : SQMSPage<QualityControlService>
        {
                private QualityControlService srv = null;

                public DataTable dtTimeSpots = null;
                public DataTable dtTimeSpans = null;

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

                protected void Page_Load(object sender, EventArgs e)
                {

                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        srv = Service as QualityControlService;
                        dtTimeSpans = new DataTable("TIMESPAN");
                        dtTimeSpots = new DataTable("TIMESPOTS");

                }

                protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
                {
                        
                }

                protected override void OnLoadDataEventHandler(object sender, EventArgs e)
                {
                        ViewData = srv.GetTimeSchemaByMPID(this.MonitorPointID);        //时间段设置

                        DataTable dtTmp = ViewData.Tables[0];
                        if (dtTmp != null)
                        {
                                if (this.Type.Equals("_qc_type_normal"))
                                {
                                        DataRow dr = dtTimeSpots.NewRow();
                                }
                                else
                                {

                                }
                        }
                }
        }
}
