using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using EasyDev.SQMS;
using SQMS.Services;

namespace SQMS.Application.Views.Basedata
{
    public partial class RoleAssignmentEdit : SQMSPage<RoleService>
    {
        private RoleService roleService = null;

        public DataTable Resrouces
        {
            get
            {
                return this.ViewData.Tables["RESOURCEITEM"];
            }
        }

        public DataTable Operations
        {
            get
            {
                return this.ViewData.Tables["OPERATION"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            
        }

        protected override void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        {
            roleService = Service as RoleService;            
        }

        protected override void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            this.ViewData = roleService.OperationService.LoadByCondition("ISVOID='N'");
            this.ViewData.Merge(roleService.ResourceService.LoadByCondition("ISVOID='N'"));
        }
    }
}
