using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using EasyDev.BL.Services;

namespace SQMS.Services
{
    public class ResourceService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "RESOURCEITEM";

            base.Initialize();
        }

        public DataTable GetResourceClass()
        {
            try
            {
                DataTable ds = DefaultSession.GetDataTableFromCommand(@"select distinct RESTYPE from RESOURCEITEM");
                ds.TableName = "RESOURCECLASS";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable GetResourceItemsView()
        {
            try
            {
                DataTable ds = DefaultSession.GetDataTableFromCommand(@"select RESTYPE,RESNAME,RESID from RESOURCEITEM");
                ds.TableName = "RESOURCEVIEW";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

    }
}
