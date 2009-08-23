using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;

namespace SQMS.Services
{
    public class MenuService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "MENU";

            base.Initialize();
        }

        public DataTable GetMenuData()
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand("select * from menu order by itemorder asc");
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
