﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.BL;
using EasyDev.Util;

namespace SQMS.Application.Views.Demo
{
        public partial class Demo : System.Web.UI.Page
        {
                private NativeServiceManager ServiceManager = ServiceManagerFactory.CreateNativeServiceManager();

                protected void Page_Load(object sender, EventArgs e)
                {

                }
        }
}
