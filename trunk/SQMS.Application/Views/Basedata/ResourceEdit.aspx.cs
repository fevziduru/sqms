using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.SQMS;
using SQMS.Services;
using EasyDev.Util;
using System.Data;

namespace SQMS.Application.Views.Basedata
{
    public partial class ResourceEdit : SQMSPage<ResourceService>
    {
        private ResourceService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drRes = DataSetUtil.GetFirstRowFromDataSet(ViewData, Service.BOName);
                        

            if (drRes != null)
            {
                if (this.ID.Length == 0)    //新增
                {
                    this.ID = Service.GetNextSequenceID();
                    drRes["CREATED"] = DateTime.Now;
                    drRes["CREATEDBY"] = CurrentUser.PassportID;
                }

                drRes["RESID"] = this.ID;
                drRes["RESCODE"] = this.txtResCode.Text;
                drRes["RESNAME"] = this.txtResName.Text;
                drRes["VIEWNAME"] = this.txtViewName.Text;
                drRes["MEMO"] = this.txtMemo.Text;
                drRes["RESIDENTITY"] = this.txtResIdentity.Text;
                drRes["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";
                drRes["MODIFIED"] = DateTime.Now;
                drRes["MODIFIEDBY"] = CurrentUser.PassportID;
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
                //新增
                this.txtResCode.Text = Service.GenerateCode();
            }
            else
            {
                //编辑
                DataRow drRes = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                if (drRes != null)
                {
                    this.txtResCode.Text = ConvertUtil.ToStringOrDefault(drRes["RESCODE"]);
                    this.txtResName.Text = ConvertUtil.ToStringOrDefault(drRes["RESNAME"]);
                    this.txtResIdentity.Text = ConvertUtil.ToStringOrDefault(drRes["RESIDENTITY"]);
                    this.txtViewName.Text = ConvertUtil.ToStringOrDefault(drRes["VIEWNAME"]);
                    this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drRes["ISVOID"]).Equals("Y") ? true : false;
                    this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drRes["MEMO"]);
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
            srv = Service as ResourceService;
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

            Response.Redirect(String.Format("ResourceView.aspx?p=resview&id={0}", this.ID));
        }

        public void btnSaveAndNew_Click(object sender, EventArgs e)
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

            Response.Redirect("ResourceEdit.aspx?p=resnew");
        }
    }
}
