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

                public string KeyField
                {
                        get;
                        set;
                }

                public string TextField
                {
                        get;
                        set;
                }

                public string AssemblyName
                {
                        get;
                        set;
                }

                public string SearchColumn
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

                //private string _keyFieldName;
                public string KeyFieldName
                {
                        get;
                        set;
                }

                //private string _textFieldName;
                public string TextFieldName
                {
                        get;
                        set;
                }

                //private string hc = "";
                public string HeaderColumns
                {
                        get;
                        set;
                }

                protected void Page_Load(object sender, EventArgs e)
                {
                        this.lbPop.HRef = string.Format(@"javascript:popup('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}')", this.txtDisplayField.ClientID, this.txtValueField.ClientID, TextFieldName, KeyFieldName,
                                HeaderColumns, TextField, KeyField, SearchColumn, Service, AssemblyName);
                }
        }
}