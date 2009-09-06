using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using SQMS.Services;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Quality
{

    public partial class TimeSchemaEdit : SQMSPage<TimeSchemaService>
    {
        private TimeSchemaService srv;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drTimeSch = DataSetUtil.GetFirstRowFromDataSet(ViewData, Service.BOName);

            if (drTimeSch != null)
            {
                if (this.ID.Length == 0)
                {
                    this.ID = Service.GetNextSequenceID();
                    drTimeSch["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drTimeSch["CREATEDBY"] = CurrentUser.PassportID;
                    drTimeSch["ORGANIZATIONID"] = CurrentUser.OrganizationID;
                }

                drTimeSch["SCHEMAID"] = this.ID;

                drTimeSch["SCHEMANAME"] = this.tbSCHEMANAME.Text;
                drTimeSch["BEGINTIME"] = this.tbBEGINTIME.Text;
                drTimeSch["ENDTIME"] = this.tbENDTIME.Text;
                drTimeSch["FLOATTIME"] = this.tbFLOATTIME.Text;

                drTimeSch["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drTimeSch["MODIFIEDBY"] = CurrentUser.PassportID;


                //TIMEITEM
                DataTable dtTSItems = DataSetUtil.GetDataTableFromDataSet(this.ViewData, srv.TimeItemService.BOName);

                DataRow drItemD;
                bool isnewTiemItem = false;

                try
                {
                    drItemD = dtTSItems.Select("TIMEITEMTYPE = '_qc_type_dynamic'").First();
                }
                catch (System.Exception)
                {
                    //drItemD = srv.TimeItemService.Create();
                    drItemD = dtTSItems.NewRow();

                    drItemD["TIMEITEMID"] = srv.TimeItemService.GetNextSequenceID();

                    drItemD["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drItemD["CREATEDBY"] = CurrentUser.PassportID;
                    drItemD["ORGANIZATIONID"] = CurrentUser.OrganizationID;

                    drItemD["TIMEITEMTYPE"] = "_qc_type_dynamic";
                    drItemD["SCHEMAID"] = this.ID;

                    drItemD["TIMESPOT"] = "00:00";

                    drItemD["TIMESPAN"] = this.tbTIMESPAN.Text;
                    drItemD["TIMES"] = this.tbTIMESPOT.Text;

                    drItemD["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drItemD["MODIFIEDBY"] = CurrentUser.PassportID;

                    isnewTiemItem = true;
                    dtTSItems.Rows.Add(drItemD);

                }

                drItemD["TIMEITEMTYPE"] = "_qc_type_dynamic";
                drItemD["SCHEMAID"] = this.ID;

                drItemD["TIMESPOT"] = "00:00";

                drItemD["TIMESPAN"] = this.tbTIMESPAN.Text;
                drItemD["TIMES"] = this.tbTIMESPOT.Text;

                drItemD["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drItemD["MODIFIEDBY"] = CurrentUser.PassportID;


                //todo:添加数据
                string[] times =  Request.Form["time"].ToString().Split(',');
                this.srv.TimeItemService.DeleteByCondition("SCHEMAID = '" + this.ID + "' and TIMEITEMTYPE = '_qc_type_normal'");
                foreach (string time in times)
                { 
                    if (time != "" )
                    {
                        //todo:保存
                        isnewTiemItem = true;

                        DataRow drItemN = dtTSItems.NewRow();

                        drItemN["TIMEITEMID"] = srv.TimeItemService.GetNextSequenceID();
                        drItemN["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                        drItemN["CREATEDBY"] = CurrentUser.PassportID;
                        drItemN["ORGANIZATIONID"] = CurrentUser.OrganizationID;

                        drItemN["TIMEITEMTYPE"] = "_qc_type_normal";
                        drItemN["SCHEMAID"] = this.ID;

                        drItemN["TIMESPOT"] = time;

                        drItemN["TIMESPAN"] = -1;
                        drItemN["TIMES"] = -1;

                        drItemN["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                        drItemN["MODIFIEDBY"] = CurrentUser.PassportID;

                        dtTSItems.Rows.Add(drItemN);

                    }
                }


                if (isnewTiemItem)
                {                   
                    //???
                    this.ViewData.Merge(dtTSItems);
                }
                
            }
        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnLoadDataEventHandler(object sender, EventArgs e)  //2
        {
            this.ViewData = this.srv.LoadByKey(this.ID, true);
            this.ViewData.Merge(this.srv.TimeItemService.LoadByCondition("SCHEMAID = '" + this.ID + "'"));
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
                //新增
            }
            else
            {
                //编辑
                DataRow drTimeSch = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, srv.BOName);
                if (drTimeSch != null)
                {
                    this.tbSCHEMANAME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["SCHEMANAME"]);
                    this.tbBEGINTIME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["BEGINTIME"]);
                    this.tbENDTIME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["ENDTIME"]);
                    this.tbFLOATTIME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["FLOATTIME"]); 
                }

                DataTable dtTSItems = DataSetUtil.GetDataTableFromDataSet(this.ViewData, srv.TimeItemService.BOName);
                int tscount = 0;
                foreach (DataRow drItem in dtTSItems.Rows)
                {
                    switch (ConvertUtil.ToStringOrDefault(drItem["TIMEITEMTYPE"]))
                    {
                        //_qc_type_normal
                        case "_qc_type_normal":
                            //todo:显示数据
                            //drItemD["TIMESPOT"] = "00:00";
                            tscount ++;
                            this.lblTIMESPOTS.Text += "<tr><td>关键时间点：<input type='text' id='jk_time" + tscount + "' name='time' value = '" + ConvertUtil.ToStringOrDefault(drItem["TIMESPOT"])  + "' autocomplete='off'></input><div id='time" + tscount + "_picker' class=''></div></td></tr>";
                            break;
                        //_qc_type_dynamic
                        case "_qc_type_dynamic":
                            this.tbTIMESPAN.Text = ConvertUtil.ToStringOrDefault(drItem["TIMESPAN"]);
                            this.tbTIMESPOT.Text = ConvertUtil.ToStringOrDefault(drItem["TIMES"]);
                            break;

                        default: break;
                    }
                }

                this.lblTIMESPOTS.Text += "<div id='ts_count' count=" + tscount + "></div>";

            }
        }

        /// <summary>
        /// 初始化页面对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e) //1
        {
            srv = Service as TimeSchemaService;
        }


        public void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.srv.Save(this.ViewData);
                this.srv.TimeItemService.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect(String.Format("TimeSchemaView.aspx?p=timeschemaview&id={0}", this.ID));
        }

        public void btnSaveAndNew_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.srv.Save(this.ViewData);
                this.srv.TimeItemService.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("TimeSchemaEdit.aspx?p=timeschemanew");
        }
    }

}
