using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQMS.Application.Views.Components
{
    public partial class OperationBar : System.Web.UI.UserControl
    {
        public IDictionary<string, Button> Buttons
        {
            get;
            set;
        }

        public string Title
        {
            get;
            set;
        }

        public string SubTitle
        {
            get;
            set;
        }

        public OperationBar()
        {
            Buttons = new Dictionary<string, Button>();
            Title = SubTitle = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (KeyValuePair<string, Button> item in Buttons)
            {
                this.phButtons.Controls.Add(item.Value);
            }
        }

        public void AssignButtonEvent(string opname, Action<object, EventArgs> func)
        {
            if (Buttons != null && Buttons.Keys.Contains(opname))
            {
                Button btn = Buttons[opname];
                if (btn != null)
                {
                    btn.Click += new EventHandler(func);
                }
            }
        }
    }
}