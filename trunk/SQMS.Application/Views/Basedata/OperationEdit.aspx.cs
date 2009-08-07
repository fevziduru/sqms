using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Presentation;
using SQMS.Services;
using EasyDev.BL.Services;
using SQMS.Application.Foundations;
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

                drOP["OPCODE"] = this.lblOpCode.Text;
                drOP["OPNAME"] = this.lblOpName.Text;
                drOP["MEMO"] = this.lblOpMemo.Text;
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
            }
            else
            {
                //编辑
                DataRow drOP = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, "OPERATION");
                if (drOP != null)
                {
                    this.lblOpCode.Text = ConvertUtil.EmptyOrString(drOP["OPCODE"]);
                    this.lblOpName.Text = ConvertUtil.EmptyOrString(drOP["OPNAME"]);
                    this.lblOpMemo.Text = ConvertUtil.EmptyOrString(drOP["MEMO"]);
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
            this.GetViewData();
            this.srv.Save(this.ViewData);

            Response.Redirect(String.Format("OperationView.aspx?id={0}", this.ID));
        }
    }

}
