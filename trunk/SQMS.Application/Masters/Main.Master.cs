﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using EasyDev.Security;

namespace SQMS.Application.Masters
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnLogout_OnClick(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            UserAuthentication.CheckOut();
            Session.Clear();

            Response.Redirect(FormsAuthentication.LoginUrl + "?status=q", true);
        }
    }
}