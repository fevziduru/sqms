using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Presentation;
using SQMS.Services;
using EasyDev.BL;
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

                protected override void OnInitializeOperationBarEventHandler(object sender, EventArgs e)
                {
                        this.OperationBar.AssignButtonEvent("edit", btnSave_Click);
                        this.OperationBar.AssignButtonEvent("saveandnew", btnSaveAndNew_Click);
                }

                protected override void GetViewData()
                {
                        DataRow drOP = DataSetUtil.GetFirstRowFromDataSet(ViewData, "OPERATION");

                        if (drOP != null)
                        {
                                if (this.ID.Length == 0)
                                {
                                        this.ID = Service.GetNextSequenceID();
                                        drOP["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                                        drOP["CREATEDBY"] = CurrentUser.PassportID;
                                }

                                drOP["OPID"] = this.ID;
                                drOP["OPCODE"] = this.txtOpCode.Text;
                                drOP["OPNAME"] = this.txtOpName.Text;
                                drOP["MEMO"] = this.txtMemo.Text;
                                drOP["ISVOID"] = this.cbIsvoid.Checked ? "Y" : "N";
                                drOP["OPIDENTITY"] = this.txtIdentity.Text;

                                drOP["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                                drOP["MODIFIEDBY"] = CurrentUser.PassportID;
                                drOP["ORGANIZATIONID"] = CurrentUser.OrganizationID;
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
                                        this.txtOpCode.Text = drOP.Field<string>("OPCODE");
                                        this.txtOpName.Text = drOP.Field<string>("OPNAME");
                                        this.txtMemo.Text = drOP.Field<string>("MEMO");
                                        this.txtIdentity.Text = drOP.Field<string>("OPIDENTITY");
                                        this.cbIsvoid.Checked = drOP.Field<bool>("ISVOID");
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

                        Response.Redirect(String.Format("OperationView.aspx?p=operationview&id={0}", this.ID));
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

                        Response.Redirect("OperationEdit.aspx?p=operationnew");
                }
        }

}
