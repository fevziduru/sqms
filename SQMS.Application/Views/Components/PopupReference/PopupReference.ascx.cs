using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQMS.Application
{
    public partial class PopupReference : System.Web.UI.UserControl
    {
        public string Service
        {
            get;
            set;
        }

        public string AssemblyName
        {
            get;
            set;
        }

        public string SelectedText
        {
            get
            {
                return this.txtDisplayField.Text;
            }
            set
            {
                this.txtDisplayField.Text = value;
            }
        }

        public string SelectedValue
        {
            get
            {
                return this.txtValueField.Text;
            }
            set
            {
                this.txtValueField.Text = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}