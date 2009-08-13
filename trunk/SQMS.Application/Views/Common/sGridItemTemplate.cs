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
using YYControls;
using System.Web.UI.HtmlControls;

namespace SQMS.Application.Views.Common
{

    public class sGridItemTemplate : ITemplate
    {
        private DataControlRowType templateType;
        private string columnName;
        private string idName;
        private string roleid; 
        private RoleService roleservice;
        private List<sGridItemCB> cblist;

        public sGridItemTemplate(DataControlRowType type, string colname,string id, RoleService srv, string roleid,List<sGridItemCB> cblist)
        {
            this.templateType = type;
            this.columnName = colname;
            this.idName = id;
            this.roleservice = srv;
            this.roleid = roleid;
            this.cblist = cblist;
        }

        public void InstantiateIn(Control container)
        {
            switch (templateType)
            {
                case DataControlRowType.Header:
                    Label lbl = new Label();
                    lbl.Text = columnName;
                    container.Controls.Add(lbl);
                    break;
                case DataControlRowType.DataRow:
                    CheckBox check1 = new CheckBox();
                    check1.ID = idName;
                    check1.AutoPostBack = false;//false
                    check1.CheckedChanged += new EventHandler(check_CheckedChanged);
                    container.Controls.Add(check1);
                    break;
                case DataControlRowType.Separator:
                    CheckBox check2 = new CheckBox();
                    check2.ID = idName;
                    check2.AutoPostBack = false;//false
                    container.Controls.Add(check2);
                    break;
                case DataControlRowType.EmptyDataRow:
                    Label lbl1 = new Label();
                    lbl1.Text = "hresname";
                    lbl1.Text = "";
                    HiddenField hid = new HiddenField();
                    hid.ID = "hresid";
                    hid.Value = "";
                    container.Controls.Add(lbl1);
                    container.Controls.Add(hid);
                    break;
                default:
                    break;
            }

        }

        private void check_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = sender as CheckBox;
            GridViewRow gvr = cb.Parent.Parent as GridViewRow;
            string opid = cb.ID;
            string resid = gvr.Cells[1].Text;

            cblist.Add(new sGridItemCB() { resid = resid, opid = opid, chked = cb.Checked });
        }


    }
}
