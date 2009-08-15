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

namespace SQMS.Application.Views.Basedata
{
    public partial class EquipmentEdit : SQMSPage<EquipmentService>
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void GetViewData()
        {
            DataRow drEqu = DataSetUtil.GetFirstRowFromDataSet(ViewData, Service.BOName);
            
            if (drEqu != null)
            {
                if (this.ID.Length == 0)
                {
                    this.ID = Service.GetNextSequenceID();
                    drEqu["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drEqu["CREATEDBY"] = CurrentUser.PassportID;
                }

                drEqu["EQUID"] = this.ID;
                drEqu["EQUCODE"] = this.txtEquCode.Text;
                drEqu["EQUNAME"] = this.txtEquName.Text;
                drEqu["MEMO"] = this.txtMemo.Text;
                drEqu["IDENTIFY"] = this.txtEquIdentity.Text;
                drEqu["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";                
                drEqu["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drEqu["MODIFIEDBY"] = CurrentUser.PassportID;
                drEqu["ORGANIZATIONID"] = CurrentUser.OrganizationID;
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
                this.txtEquCode.Text = Service.GenerateCode();
            }
            else
            {
                //编辑
                DataRow drEqu = DataSetUtil.GetFirstRowFromDataSet(this.ViewData, Service.BOName);
                if (drEqu != null)
                {
                    this.txtEquCode.Text = ConvertUtil.ToStringOrDefault(drEqu["EQUCODE"]);
                    this.txtEquName.Text = ConvertUtil.ToStringOrDefault(drEqu["EQUNAME"]);
                    this.txtEquIdentity.Text = ConvertUtil.ToStringOrDefault(drEqu["IDENTIFY"]);
                    this.cbIsvoid.Checked = ConvertUtil.ToStringOrDefault(drEqu["ISVOID"]).Equals("Y") ? true : false;
                    this.txtMemo.Text = ConvertUtil.ToStringOrDefault(drEqu["MEMO"]);
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
            //srv = Service as OperationService;
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

            Response.Redirect(String.Format("EquipmentView.aspx?p=equview&id={0}", this.ID));
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

            Response.Redirect("EquipmentEdit.aspx?p=equnew");
        }
    }
}
