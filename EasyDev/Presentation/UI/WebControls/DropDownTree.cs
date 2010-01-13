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

[assembly: WebResource("EasyDev.Presentation.UI.WebControls.DropDownTree.js", "application/x-javascript")]
namespace EasyDev.Presentation.UI.WebControls
{
    /// <summary>
    /// 
    /// </summary>
    [ToolboxData("<{0}:DropDownTree runat=server></{0}:DropDownTree>")]
    [AspNetHostingPermission(SecurityAction.Demand, Level = AspNetHostingPermissionLevel.Minimal)]
    [Designer(typeof(DropDownTreeDesign))]
    [ToolboxBitmap("dropdowntree_icon.bmp")]
    public class DropDownTree : HierarchicalDataBoundControl, INamingContainer
    {
        private TreeView dropdownTree = new TreeView();
        private HiddenField valueField = new HiddenField();
        private TextBox textField = new TextBox();
        
        /// <summary>
        /// 
        /// </summary>
        public DropDownTree()
        {
            this.Width = new Unit(180);
        }

        #region Properties
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
        public string SelectedValue
        {
            get
            {
                EnsureChildControls();
                return this.valueField.Value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string SelectedText
        {
            get
            {
                EnsureChildControls();
                return this.textField.Text;
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
        /// 
        /// </summary>
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue("")]
        [Localizable(true)]
        public string KeyField
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
        public string TextField
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
        public string ValueField
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
        public string ParentField
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
            Controls.Clear();
            this.Controls.Add(this.dropdownTree);
            this.Controls.Add(this.valueField);
            this.Controls.Add(this.textField);
            ClearChildViewState();
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
                this.ClientID,this.ID);
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.Append("<img src='quicknew.png' alt='' style='width:18px;height:18px;vertical-align:middle;' /></td></tr>");
            sb.AppendFormat("<tr><td colspan='4'><div id='{0}_tree_frame' style='display:none;position:absolute;height:200px;width:{1}px;border:solid 1px #000;background-color:#eeeefe;overflow:auto'>",
                this.ID, this.Width.Value - 2);
            writer.Write(sb.ToString());
            
            this.dropdownTree.RenderControl(writer);
            this.valueField.RenderControl(writer);

            sb = new StringBuilder();
            sb.Append("</div></td></tr></table></div>");
            writer.Write(sb.ToString());

            //base.Render(writer);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string DesignerSupport()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("<div id='{0}'>", this.ClientID);
            sb.AppendFormat("<table cellpadding='1' cellspacing='0' id='{0}_tableframe'>", this.ClientID);
            sb.AppendFormat("<tr style='border:solid 1px #eee'><td style='width:{0}px'>", this.Width.Value);
            sb.AppendFormat("<input type='text' value='{0}' style='width:{1}'>", this.textField.Text,this.Width.Value);
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.AppendFormat("<img onclick='{1}.switchDropdownTree(\"{0}\")' id='{0}_dropdownbutton' src='dropdown_normal.png' alt='' style='width:18px;height:18px;vertical-align:middle;'/>", 
                this.ClientID,this.ID);
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
        public void AddTreeNode(TreeNode node)
        {
            node.NavigateUrl = "javascript:" +
                string.Format("{3}.selectNode('{0}','{1}','{2}')", this.ID, node.Text, node.Value, this.ID);

            this.dropdownTree.Nodes.Add(node);
        }

        protected override void PerformDataBinding()
        {
            base.PerformDataBinding();
        }
    }
}