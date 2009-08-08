using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Presentation;
using SQMS.Services;
using EasyDev.BL.Services;
using EasyDev.SQMS;
using System.Data;
using EasyDev.Util;

namespace SQMS.Application.Views.Basedata
{

    public partial class OperationEdit : SQMSPage<OperationService>
    {
        private OperationService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drOP = DataSetUtil.GetFirstRowFromDataSet(ViewData, "OPERATION");

            if (this.ID.Length == 0)
            {
                this.ID = Service.GetNextSequenceID();             
            }

            if (drOP != null)
            {
                drOP["OPID"] = this.ID;
                drOP["OPCODE"] = this.txtOpCode.Text;
                drOP["OPNAME"] = this.txtOpName.Text;
                drOP["MEMO"] = this.txtMemo.Text;

                drOP["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drOP["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
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
                this.txtOpCode.Text = srv.GenerateCode();
            }
            else
            {
                //编辑
                DataRow drOP = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "OPERATION");
                if (drOP != null)
                {
                    this.txtOpCode.Text = ConvertUtil.EmptyOrString(drOP["OPCODE"]);
                    this.txtOpName.Text = ConvertUtil.EmptyOrString(drOP["OPNAME"]);
                    this.txtMemo.Text = ConvertUtil.EmptyOrString(drOP["MEMO"]);
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
            srv = Service as OperationService;
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

            Response.Redirect(String.Format("OperationView.aspx?id={0}", this.ID));
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

            Response.Redirect("OperationEdit.aspx");
        }
    }

}
