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

        public DataTable GetResourceItemsView(string roleid)
        {
            try
            {
//                DataTable ds = DefaultSession.GetDataTableFromCommand(@"select distinct ri.RESTYPE, ri.RESNAME, ri.RESID 
//                from RESOURCEITEM ri
//                left join RESPERMISSION rp on ri.RESID = rp.RESID 
//                where rp.ROLEID = :roleid
//                ", roleid);
//                ds.TableName = "RESOURCEVIEW";
//                return ds;

                DataTable ds = DefaultSession.GetDataTableFromCommand(@"select RESTYPE,RESNAME,RESID from RESOURCEITEM");
                ds.TableName = "RESOURCEVIEW";
                return ds;
            }
            catch (Exception e)//            
                
            {
                throw e;
            }
        }

        public DataTable GetResourceAllView()
        {
            try
            {
                DataTable ds = DefaultSession.GetDataTableFromCommand(@"select RESTYPE,RESNAME,RESID from RESOURCEITEM");
                ds.TableName = "RESOURCEVIEWALL";
                return ds;
            }
            catch (Exception e)//            left join RESOURCEITEM
            {
                throw e;
            }
        }

    }
}
