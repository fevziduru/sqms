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

namespace SQMS.Application.Views.Common
{

    public class sGridItemTemplate : ITemplate
    {
        private DataControlRowType templateType;
        private string columnName;
        private string idName;
        private string roleid; 
        private RoleService roleservice;

        public sGridItemTemplate(DataControlRowType type, string colname,string id, RoleService srv, string roleid)
        {
            this.templateType = type;
            this.columnName = colname;
            this.idName = id;
            this.roleservice = srv;
            this.roleid = roleid;
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
                    CheckBox check = new CheckBox();
                    check.ID = idName;
                    check.AutoPostBack = true;
                    check.CheckedChanged += new EventHandler(check_CheckedChanged);
                    container.Controls.Add(check);
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
            
            if (roleid != "")
            {
                roleservice.ResPermissionService.SetPermission(resid, opid, roleid, cb.Checked);
            }
           
        }

    }
}
