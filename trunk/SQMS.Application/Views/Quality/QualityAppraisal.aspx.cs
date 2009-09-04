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
        public partial class QualityAppraisal : SQMSPage<QualityControlService>
        {
                private QualityControlService srv = null;

                public string MPID = string.Empty;

                protected void Page_Load(object sender, EventArgs e)
                {
                        MPID = ConvertUtil.ToStringOrDefault(Request.QueryString["mpid"]);
                }

                protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
                {
                        srv = Service as QualityControlService;
                }

                protected override void GetViewData()
                {
                        DataRow drQuality = DataSetUtil.GetFirstRowFromDataSet(ViewData, "QUALITY");

                        if (drQuality != null)
                        {
                                drQuality["QUALITYLEVEL"] = this.txtQualityLevel.Text;
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

                        }
                        else
                        {
                                //编辑
                                DataRow drQuality = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "QUALITY");
                                if (drQuality != null)
                                {
                                        this.lblQMCode.Text = ConvertUtil.ToStringOrDefault(drQuality["QMCODE"]);
                                        this.lblWorkUnit.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("ORGNAME", "ORGANIZATION", "ORGID",
                                                ConvertUtil.ToStringOrDefault(drQuality["WORKUNIT"])));
                                        this.lblChargePerson.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID",
                                                ConvertUtil.ToStringOrDefault(drQuality["CHARGEPERSON"])));
                                        this.lblEmergencyPerson.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID",
                                                ConvertUtil.ToStringOrDefault(drQuality["EMERGENCYPERSON"])));
                                        this.lblCheckPerson.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("EMPNAME", "EMPLOYEE", "EMPID",
                                                ConvertUtil.ToStringOrDefault(drQuality["CHECKPERSON"])));
                                        this.lblStatus.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("ENUMNAME", "ENUMERATION", "ENUMID",
                                                ConvertUtil.ToStringOrDefault(drQuality["STATUS"])));
                                        this.lblLng.Text = ConvertUtil.ToStringOrDefault(drQuality["LONGITUDE"]);
                                        this.lblLat.Text = ConvertUtil.ToStringOrDefault(drQuality["LATITUDE"]);
                                        this.imgQuality.Attributes.Add("src", "/Views/Components/ImagePipe.aspx?filename=" + ConvertUtil.ToStringOrDefault(drQuality["MATERIAL"]));
                                        this.hlImage.NavigateUrl = ConvertUtil.ToStringOrDefault(drQuality["MATERIAL"]);
                                        this.hlImage.Text = ConvertUtil.ToStringOrDefault(drQuality["MATERIAL"]);
                                        //TODO:采集点视频
                                        this.hlVideo.Text = ConvertUtil.ToStringOrDefault(drQuality["VIDEOURL"]);
                                        this.hlVideo.Attributes.Add("onclick", "");

                                        this.txtQualityLevel.Text = ConvertUtil.ToStringOrDefault(drQuality["QUALITYLEVEL"]);
                                        this.lblType.Text = ConvertUtil.ToStringOrDefault(srv.GetReferenceValue("ENUMNAME", "ENUMERATION", "ENUMID",
                                                ConvertUtil.ToStringOrDefault(drQuality["TYPE"])));
                                        this.lblMemo.Text = ConvertUtil.ToStringOrDefault(drQuality["MEMO"]);
                                }
                        }
                }

                public void btnSave_Click(object sender, EventArgs e)
                {
                        try
                        {
                                this.GetViewData();
                                this.srv.Save(this.ViewData);
                        }
                        catch (Exception ex)
                        {
                                throw ex;
                        }

                        Response.Redirect(String.Format("QualityAppraisalList.aspx?p=qalist&id={0}", this.ID));
                }
        }
}
