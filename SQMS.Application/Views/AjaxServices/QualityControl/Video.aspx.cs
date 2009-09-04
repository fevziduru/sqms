using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;
using EasyDev.BL;
using Domain = SQMS.Services.Domain.QualityControl;
using System.Data;
using EasyDev.Util;
using SQMS.Services.Domain.QualityControl;
using System.Web.Script.Serialization;
using log4net;

namespace SQMS.Application.Views.AjaxServices.QualityControl
{
        public partial class Video : System.Web.UI.Page
        {
                private static readonly ILog log = LogManager.GetLogger("AjaxServicesVideo");
                public static readonly string URL_PARAM_VIDEOID = "id";

                private NativeServiceManager svcManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
                private QualityControlService svcQualityControl = null;
                private JavaScriptSerializer serializer = new JavaScriptSerializer();
                protected void Page_Init(object sender, EventArgs e)
                {
                        this.svcQualityControl = this.svcManager.CreateService<QualityControlService>();
                }
                protected void Page_Load(object sender, EventArgs e)
                {
                        string videoId = ConvertUtil.ToStringOrDefault(this.Request.QueryString[URL_PARAM_VIDEOID]);
                        DataTable dt = this.svcQualityControl.GetVideo(videoId);
                        IList<Domain.Video> list = this.CreateVideoList(dt);

                        string json = String.Empty;
                        try
                        {
                                json = this.serializer.Serialize(list);
                        }
                        catch (Exception exp)
                        {
                                log.Error(exp.ToString());
                        }
                        this.Response.Clear();
                        this.Response.Write(json);
                }
                protected IList<Domain.Video> CreateVideoList(DataTable dt)
                {
                        IList<Domain.Video> list = new List<Domain.Video>();
                        foreach (DataRow dr in dt.Rows)
                        {
                                Domain.Video v = new Domain.Video();
                                v.Created = ConvertUtil.ToDateTime(dr["Created"]);
                                v.CreatedBy = ConvertUtil.ToStringOrDefault(dr["CreatedBy"]);
                                v.Memo = ConvertUtil.ToStringOrDefault(dr["MEMO"]);
                                v.Modified = ConvertUtil.ToDateTime(dr["Modified"]);
                                v.ModifiedBy = ConvertUtil.ToStringOrDefault(dr["ModifiedBy"]);
                                try
                                {
                                        v.Trace = this.serializer.Deserialize<LatLng[]>(ConvertUtil.ToStringOrDefault(dr["trace"]));
                                }
                                catch (Exception e)
                                {
                                        log.Warn(e.ToString());
                                }
                                v.VideoId = ConvertUtil.ToStringOrDefault(dr["videoId"]);
                                v.VideoName = ConvertUtil.ToStringOrDefault(dr["videoname"]);
                                v.VideoUrl = ConvertUtil.ToStringOrDefault(dr["videoUrl"]);
                                list.Add(v);
                        }
                        return list;
                }
        }
}
