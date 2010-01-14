using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Permissions;
using EasyDev.Presentation.UI.WebControls.Design;
using System.Drawing;
using System.Collections;
using System.Data;

[assembly: WebResource("EasyDev.Presentation.UI.WebControls.DropDownTree.js", "application/x-javascript")]
[assembly: WebResource("EasyDev.Presentation.UI.WebControls.dropdown_normal.png", "image/png")]
[assembly: WebResource("EasyDev.Presentation.UI.WebControls.dropdown_pressed.png", "image/png")]
[assembly: WebResource("EasyDev.Presentation.UI.WebControls.quicknew.png", "image/jpg")]
[assembly: WebResource("EasyDev.Presentation.UI.WebControls.DropDownTree.css", "text/html")]
namespace EasyDev.Presentation.UI.WebControls
{
    /// <summary>
    /// 
    /// </summary>
    [ToolboxData("<{0}:DropDownTree runat=server></{0}:DropDownTree>")]
    [AspNetHostingPermission(SecurityAction.Demand, Level = AspNetHostingPermissionLevel.Minimal)]
    [Designer(typeof(DropDownTreeDesign))]
    [ToolboxBitmap("DropDownTree.bmp")]
    public class DropDownTree : DataBoundControl, INamingContainer
    {
        private TreeView dropdownTree = new TreeView();
        private HiddenField valueField = new HiddenField();
        private TextBox textField = new TextBox();
        private HiddenField selectedDataItem = new HiddenField();
                
        /// <summary>
        /// 
        /// </summary>
        public DropDownTree()
        {
            this.Width = new Unit(180);            
        }

        #region Properties

        /// <summary>
        /// All columns that was bound to this control
        /// </summary>
        [Browsable(true)]
        [Category("Data")]
        [Bindable(true)]
        [Localizable(true)]
        public string[] Columns
        {
            get;
            set;
        }

        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string QuickNewUrl
        {
            get
            {
                String s = (String)ViewState[this.ID + "_QuickNewUrl"];
                return ((s == null) ? String.Empty : s);
            }
            set
            {
                ViewState[this.ID + "_QuickNewUrl"] = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [Browsable(false)]
        public string SelectedValue
        {
            get
            {
                EnsureChildControls();
                return this.valueField.Value;
            }
            set
            {
                EnsureChildControls();
                this.valueField.Value = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [Browsable(false)]
        public string SelectedText
        {
            get
            {
                EnsureChildControls();
                return this.textField.Text;
            }
            set
            {
                EnsureChildControls();
                this.textField.Text = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public TreeView Tree
        {
            get
            {
                return this.dropdownTree;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public TextBox Text
        {
            get
            {
                return this.textField;
            }
        }

        /// <summary>
        /// Specific the parent value of root node in the tree
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string RootParentValue
        {
            get
            {
                String s = (String)ViewState[this.ID + "_RootParentValue"];
                return ((s == null) ? String.Empty : s);
            }
            set
            {
                ViewState[this.ID + "_RootParentValue"] = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string DataKeyField
        {
            get
            {
                String s = (String)ViewState[this.ID + "_KeyField"];
                return ((s == null) ? String.Empty : s);
            }
            set
            {
                ViewState[this.ID + "_KeyField"] = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string DataTextField
        {
            get
            {
                String s = (String)ViewState[this.ID + "_TextField"];
                return ((s == null) ? String.Empty : s);
            }
            set
            {
                ViewState[this.ID + "_TextField"] = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string DataValueField
        {
            get
            {
                String s = (String)ViewState[this.ID + "_ValueField"];
                return ((s == null) ? String.Empty : s);
            }
            set
            {
                ViewState[this.ID + "_ValueField"] = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string DataParentField
        {
            get
            {
                String s = (String)ViewState[this.ID + "_ParentField"];
                return ((s == null) ? String.Empty : s);
            }
            set
            {
                ViewState[this.ID + "_ParentField"] = value;
            }
        }

        #endregion

        #region Events

        private static object _textChanged = new object();

        /// <summary>
        /// 
        /// </summary>
        [Browsable(true)]
        public event EventHandler TextChanged
        {
            add
            {
                Events.AddHandler(_textChanged, value);
            }
            remove
            {
                Events.RemoveHandler(_textChanged, value);
            }
        }


        #endregion

        /// <summary>
        /// 
        /// </summary>
        protected override void CreateChildControls()
        {
            if (ChildControlsCreated == false)
            {
                Controls.Clear();

                this.Controls.Add(this.dropdownTree);
                this.Controls.Add(this.valueField);
                this.Controls.Add(this.textField);
                this.Controls.Add(this.selectedDataItem);
                ClearChildViewState();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="output"></param>
        protected override void RenderContents(HtmlTextWriter output)
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("<div id='{0}'>", this.ClientID);
            sb.AppendFormat("<table cellpadding='1' cellspacing='0' id='{0}_tableframe'>", this.ClientID);
            sb.AppendFormat("<tr style='border:solid 1px #eee'><td style='width:{0}px'>", this.Width.Value);
            writer.Write(sb.ToString());
            this.textField.RenderControl(writer);
            sb = new StringBuilder();
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.AppendFormat("<img onclick='{1}.switchDropdownTree(\"{0}\")' id='{0}_dropdownbutton' src='dropdown_normal.png' alt='' style='width:18px;height:18px;vertical-align:middle;'/>",
                this.ClientID, this.ID);
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.Append("<img src='quicknew.png' alt='' style='width:18px;height:18px;vertical-align:middle;' /></td></tr>");
            sb.AppendFormat("<tr><td colspan='4'><div id='{0}_tree_frame' style='display:none;position:absolute;height:200px;width:{1}px;border:solid 1px #000;background-color:#eeeefe;overflow:auto'>",
                this.ID, this.Width.Value - 2);
            writer.Write(sb.ToString());

            this.dropdownTree.RenderControl(writer);
            this.valueField.RenderControl(writer);
            this.selectedDataItem.RenderControl(writer);
            sb = new StringBuilder();
            sb.Append("</div></td></tr></table></div>");
            writer.Write(sb.ToString());
        }

        /// <summary>
        /// Display in designer
        /// </summary>
        /// <returns></returns>
        public string DesignerSupport()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("<div id='{0}'>", this.ClientID);
            sb.AppendFormat("<table cellpadding='1' cellspacing='0' id='{0}_tableframe'>", this.ClientID);
            sb.AppendFormat("<tr style='border:solid 1px #eee'><td style='width:{0}px'>", this.Width.Value);
            sb.AppendFormat("<input type='text' value='{0}' style='width:{1}'>", this.textField.Text, this.Width.Value);
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.AppendFormat("<img onclick='{1}.switchDropdownTree(\"{0}\")' id='{0}_dropdownbutton' src='dropdown_normal.png' alt='' style='width:18px;height:18px;vertical-align:middle;'/>",
                this.ClientID, this.ID);
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.Append("<img src='quicknew.png' alt='' style='width:18px;height:18px;vertical-align:middle;' /></td></tr>");
            sb.AppendFormat("<tr><td colspan='4'><div id='{0}_tree_frame' style='display:none;position:absolute;height:200px;width:{1}px;border:solid 1px #000;background-color:#eeeefe;overflow:auto'>",
                this.ID, this.Width.Value - 2);
            sb.Append("</div></td></tr></table></div>");

            return sb.ToString();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            this.valueField.ID = "_SelectedValue";
            this.textField.ID = "_SelectedText";
            this.selectedDataItem.ID = "_SelectedDataItem";
            
            this.dropdownTree.ShowLines = true;
            this.dropdownTree.CssClass = "tree";

            this.textField.Width = this.Width;
            this.Page.ClientScript.RegisterClientScriptResource(this.GetType(), "EasyDev.Presentation.UI.WebControls.DropDownTree.js");

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Init_DropDownTree_Object",
                string.Format("var {0}=new DropDownTree('{1}');", this.ID, this.ClientID), true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="node"></param>
        [Obsolete]
        public void AddTreeNode(TreeNode node)
        {
            node.NavigateUrl = "javascript:" +
                string.Format("{3}.selectNode('{0}','{1}','{2}')", this.ID, node.Text, node.Value, this.ID);

            this.dropdownTree.Nodes.Add(node);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        protected override void PerformDataBinding(System.Collections.IEnumerable data)
        {
            base.PerformDataBinding(data);

            //Build Tree Data Table
            DataTable dtTree = new DataTable("TreeData");
            foreach (string col in Columns)
            {
                dtTree.Columns.Add(col);
            }

            //Retrieve Data
            IEnumerator itr = data.GetEnumerator();
            while (itr.MoveNext())
            {
                DataRow drNew = dtTree.NewRow();
                foreach (string col in Columns)
                {
                    drNew[col] = DataBinder.GetPropertyValue(itr.Current, col, null);
                }
                dtTree.Rows.Add(drNew);
            }
            
            //Build Tree
            this.Tree.Nodes.Clear();
            BuildTree(this.dropdownTree.Nodes, dtTree, this.RootParentValue);
        }

        /// <summary>
        /// build treeview
        /// </summary>
        /// <param name="nodes"></param>
        /// <param name="treeData"></param>
        /// <param name="pid"></param>
        private void BuildTree(TreeNodeCollection nodes, DataTable treeData, object pid)
        {
            //Select child rows
            DataRow[] childRows = treeData.Select(string.Format("[{0}]='{1}'", DataParentField, pid.ToString()));
            TreeNode node = null;

            foreach (DataRow row in childRows)
            {
                //Build datarow json string for client side model
                StringBuilder dataItemRow = new StringBuilder();
                dataItemRow.Append("{");
                foreach (string item in Columns)
                {
                    dataItemRow.AppendFormat("\"{0}\":\"{1}\",", item, row.Field<string>(item));
                }
                dataItemRow.Remove(dataItemRow.Length - 1, 1);
                dataItemRow.Append("}");

                node = new TreeNode();
                node.ToolTip = node.Text = row.Field<string>(this.DataTextField);
                node.Value = row.Field<string>(this.DataValueField);
                node.NavigateUrl = "javascript:" +
                    string.Format("{3}.selectNode('{0}','{1}','{2}','{4}')", this.ID, node.Text, node.Value, this.ID, dataItemRow.ToString());
                
                nodes.Add(node);
                BuildTree(node.ChildNodes, treeData, row.Field<object>(this.DataKeyField));
            }
        }
    }
}