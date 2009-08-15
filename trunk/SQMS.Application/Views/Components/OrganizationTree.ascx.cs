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
using System.Text;

namespace SQMS.Application.Views.Components
{
    public partial class OrganizationTree : UserControl
    {
        private OrganizationService srv = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CreateMenu(DataTable dtORG)
        {
            this.CreateMenu(this.TreeView1.Nodes, dtORG, ""); 
        }

        public void RefreshMenu(DataTable dtORG)
        {
            this.TreeView1.Nodes.Clear();
            this.CreateMenu(this.TreeView1.Nodes, dtORG, "");
        }

        private void CreateMenu(TreeNodeCollection nodes, DataTable dt, string pid)
        {
            string filter;

            if (pid.Trim() == "")
            {
                filter = string.Format("PARENTORG IS NULL");
            }
            else
            {
                filter = string.Format("PARENTORG = '{0}'", pid);
            }

            DataRow[] subdrSet = dt.Select(filter);
            TreeNode node;
            Array.ForEach(subdrSet, item =>
            {
                node = new TreeNode();
                node.Text =  Convert.ToString(item["ORGNAME"]);
                node.Value = Convert.ToString(item["ORGID"]);
                node.NavigateUrl = Convert.ToString(String.Format("~/Views/Basedata/OrganizationEdit.aspx?p=operationedit&id={0}", item["ORGID"]));
                node.ToolTip = Convert.ToString(item["ORGNAME"]);
                nodes.Add(node);
                CreateMenu(node.ChildNodes, dt, node.Value);
            });
        }

        protected void TreeView1_SelectedNodeChanged(Object sender, EventArgs e)
        {
            //TreeNode tr1 = sender as TreeNode;
        }





    }
}