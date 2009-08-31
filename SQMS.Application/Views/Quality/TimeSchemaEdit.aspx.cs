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
                }

                drTimeSch["SCHEMAID"] = this.ID;

                drTimeSch["SCHEMANAME"] = this.tbSCHEMANAME.Text;
                drTimeSch["BEGINTIME"] = this.tbBEGINTIME.Text;
                drTimeSch["ENDTIME"] = this.tbENDTIME.Text;
                drTimeSch["FLOATTIME"] = this.tbFLOATTIME.Text;

                drTimeSch["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drTimeSch["MODIFIEDBY"] = CurrentUser.PassportID;
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
            this.ViewData.Merge(this.srv.TimeItemService.LoadByCondition("SCHEMAID = " + this.ID));
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
                DataRow drTimeSch = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                if (drTimeSch != null)
                {
                    //this.txtEquCode.Text = ConvertUtil.ToStringOrDefault(drEqu["EQUCODE"]);
                    //this.txtEquName.Text = ConvertUtil.ToStringOrDefault(drEqu["EQUNAME"]);
                    //this.txtEquIdentity.Text = ConvertUtil.ToStringOrDefault(drEqu["IDENTIFY"]);
                    //this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drEqu["ISVOID"]).Equals("Y") ? true : false;
                    //this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drEqu["MEMO"]);

                    this.tbSCHEMANAME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["SCHEMANAME"]);
                    this.tbBEGINTIME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["BEGINTIME"]);
                    this.tbENDTIME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["ENDTIME"]);
                    this.tbFLOATTIME.Text = ConvertUtil.ToStringOrDefault(drTimeSch["FLOATTIME"]); 


                }
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
                this.Service.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect(String.Format("TimeSchemaView.aspx?p=tsview&id={0}", this.ID));
        }

        public void btnSaveAndNew_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.Service.Save(this.ViewData);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("TimeSchemaEdit.aspx?p=tsnew");
        }
    }

}
