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
using YYControls;
using System.Text;

namespace SQMS.Application.Views.Components
{
    public partial class OrganizationEdit : System.Web.UI.UserControl
    {
        private DataSet dsORG
        {
            get { return this.ViewState["dsORG"] as DataSet; }
            set { this.ViewState["dsORG"] = value; }
        }

        private OrganizationService srv;

        private string passportid
        {
            get { return ConvertUtil.ToStringOrDefault(this.ViewState["PASS_ID"]); }
            set { this.ViewState["PASS_ID"] = value; }
        }

        private string ID
        {
            get { return ConvertUtil.ToStringOrDefault(this.ViewState["ORG_ID"]); }
            set { this.ViewState["ORG_ID"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public void Load(string id, string passid, OrganizationService os, DataSet vd)
        {
            this.ID = id;
            this.srv = os;
            this.passportid = passid;
            this.dsORG = vd;

            this.dsORG = this.srv.LoadByKey(this.ID, true);
            this.dsORG.Merge(this.srv.GetORGViewList());

            this.InitializeView();
        }

        public void Load(OrganizationService os)
        {
            this.srv = os;
        }


        private void GetViewData()
        {

            DataRow drORG = DataSetUtil.GetFirstRowFromDataSet(this.dsORG, "ORGANIZATION");

            if (drORG != null)
            {
                if (this.ID.Length == 0)
                {
                    this.ID = srv.GetNextSequenceID();
                    drORG["CREATED"] = DateTime.Now.ToString("yyyy-MM-dd");
                    drORG["CREATEDBY"] = this.passportid;
                }

                drORG["ORGTYPE"] = this.ddlOrgClass.SelectedValue;

                drORG["ORGCODE"] = this.txtOrgCode.Text;
                drORG["ORGNAME"] = this.txtOrgName.Text;

                drORG["PARENTORG"] = this.tbOrgParent.Text == "" ? null : this.tbOrgParent.Text;
                drORG["ORGALIAS"] = this.tbAlias.Text;
                drORG["CONTACT"] = this.tbContactTel.Text;
                drORG["CONTACTTEL"] = this.tbPhone.Text;
                drORG["ZIPCODE"] = this.tbZIP.Text;
                drORG["ORGADDRESS"] = this.tbAddress.Text;
                drORG["ORGSTATUS"] = this.tbOrgStatus.Text;
                drORG["MEMO"] = this.tbMemo.Text;

                drORG["ISVOID"] = this.cbIsVoid.Checked  ? "Y" : "N";

                drORG["MODIFIED"] = DateTime.Now.ToString("yyyy-MM-dd");
                drORG["MODIFIEDBY"] = this.passportid;
            }
        }

        private void InitializeView()
        {

            //加载菜单
            DataTable dtORGClass = DataSetUtil.GetDataTableFromDataSet(this.dsORG, "ORGANIZATIONList");
            this.ddlParent.Items.Add(new ListItem("-- 清空 --", "@clear"));
            if (this.ddlParent.Items.Count == 1)
            {
                foreach (DataRow dr in dtORGClass.Rows)
                {
                    this.ddlParent.Items.Add(new ListItem(ConvertUtil.EmptyOrString(dr["ORGNAME"]), ConvertUtil.EmptyOrString(dr["ORGID"])));
                }
            }

            if (this.ddlOrgClass.Items.Count == 0)
            {
                this.ddlOrgClass.Items.Add(new ListItem("机构", "organization"));
                this.ddlOrgClass.Items.Add(new ListItem("部门", "department"));
            }

            if (this.ID.Length == 0)
            {
                //新增
                this.txtOrgCode.Text = srv.GenerateCode();
            }
            else
            {
                //编辑
                DataRow drORG = DataSetUtil.GetFirstRowFromDataSet(this.dsORG, "ORGANIZATION");

                if (drORG != null)
                {
                    this.txtOrgCode.Text = ConvertUtil.ToStringOrDefault(drORG["ORGCODE"]);
                    this.txtOrgName.Text = ConvertUtil.ToStringOrDefault(drORG["ORGNAME"]);

                    this.ddlOrgClass.SelectedValue = ConvertUtil.ToStringOrDefault(drORG["ORGTYPE"]);

                    this.tbOrgParent.Text = ConvertUtil.ToStringOrDefault(drORG["PARENTORG"]);
                    this.tbAlias.Text = ConvertUtil.ToStringOrDefault(drORG["ORGALIAS"]);
                    this.tbContactTel.Text = ConvertUtil.ToStringOrDefault(drORG["CONTACT"]);
                    this.tbPhone.Text = ConvertUtil.ToStringOrDefault(drORG["CONTACTTEL"]);
                    this.tbZIP.Text = ConvertUtil.ToStringOrDefault(drORG["ZIPCODE"]);
                    this.tbAddress.Text = ConvertUtil.ToStringOrDefault(drORG["ORGADDRESS"]);
                    this.tbOrgStatus.Text = ConvertUtil.ToStringOrDefault(drORG["ORGSTATUS"]);
                    this.tbMemo.Text = ConvertUtil.ToStringOrDefault(drORG["MEMO"]);

                    this.cbIsVoid.Checked = ConvertUtil.ToStringOrDefault(drORG["ISVOID"]).Equals("Y") ? true : false;
                }
            }

        }



        public void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.srv.Save(dsORG);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect(String.Format("~/Views/Basedata/OrganizationView.aspx?p=operationview&id={0}", this.ID));
        }

        public void btnSaveAndNew_Click(object sender, EventArgs e)
        {
            try
            {
                this.GetViewData();
                this.srv.Save(dsORG);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("~/Views/Basedata/OrganizationEdit.aspx?p=operationnew");
        }

        protected void ddlParent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlParent.SelectedValue == "@clear")
            {
                this.tbOrgParent.Text = "";
            } 
            else
            {
                this.tbOrgParent.Text = this.ddlParent.SelectedValue;
            }
        }

    }
}