using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Permissions;

[assembly: WebResource("EasyDev.Presentation.UI.WebControls.DropDownTree.js", "application/x-javascript")]
namespace EasyDev.Presentation.UI.WebControls
{    
    /// <summary>
    /// 
    /// </summary>
    [ToolboxData("<{0}:DropDownTree runat=server></{0}:DropDownTree>")]
    [AspNetHostingPermission(SecurityAction.Demand, Level = AspNetHostingPermissionLevel.Minimal)]
    public class DropDownTree : WebControl
    {
        private TreeView dropdownTree = new TreeView();
        private HiddenField valueField = new HiddenField();

        public DropDownTree()
        {
            this.valueField.ID = this.ID + "_SelectedValue";
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
        [Bindable(true)]
        [Category("Data")]
        [DefaultValue(false)]
        public bool ShowCheckbox
        {
            get
            {
                bool s = (bool)ViewState[this.ID + "_ShowCheckbox"];
                return s;
            }
            set
            {
                ViewState[this.ID + "_ShowCheckbox"] = value;
            }
        }

        public string SelectedValue
        {
            get
            { 
                
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public object DataSource
        {
            get { return this.dropdownTree.DataSource; }
            set { this.dropdownTree.DataSource = value; }
        }

        /// <summary>
        /// 
        /// </summary>
        protected override void CreateChildControls()
        {
            Controls.Clear();
            this.Controls.Add(this.dropdownTree);
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
            sb.AppendFormat("<div id='{0}'>", this.ID);
            sb.AppendFormat("<table cellpadding='1' cellspacing='0' id='{0}_tableframe'>", this.ID);
            sb.AppendFormat("<tr style='border:solid 1px #eee'><td style='width:{0}px'>",this.Width.Value);
            sb.AppendFormat("<input style='width:100%;' type='text' id='{0}_text' />", this.ID);
            sb.Append("</td><td>&nbsp;</td><td valign='middle' align='center' style='width:20px'>");
            sb.AppendFormat("<img onclick='SwitchDropdownTree(\"{0}\")' id='{0}_dropdownbutton' src='dropdown_normal.png' alt='' style='width:18px;height:18px;vertical-align:middle;'/>", this.ID);
            sb.Append("</td><td valign='middle' align='center' style='width:20px'>");
            sb.Append("<img src='quicknew.png' alt='' style='width:18px;height:18px;vertical-align:middle;' /></td></tr>");
            sb.AppendFormat("<tr><td><div id='{0}_tree_frame' style='display:none;height:200px;width:{1}px;border:solid 1px #000;background-color:#eeeefe;overflow:auto'>", 
                this.ID, this.Width.Value - 2);
            this.dropdownTree.RenderControl(writer);
            sb.Append("</div></td></tr></table></div>");
            writer.Write(sb.ToString());

            base.Render(writer);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            this.Page.ClientScript.RegisterClientScriptResource(this.GetType(), "EasyDev.Presentation.UI.WebControls.DropDownTree.js");
        }

        public void DataBind()
        {
            this.dropdownTree.DataBind();
        }
    }
}