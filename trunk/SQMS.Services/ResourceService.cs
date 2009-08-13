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

        public DataTable GetResourceItemsView(string type)
        {
            if (type == "all")
            {
                try
                {
                    DataTable ds = DefaultSession.GetDataTableFromCommand(@"select RESTYPE,RESNAME,RESID from RESOURCEITEM ORDER BY RESTYPE");
                    ds.TableName = "RESOURCEVIEW";
                    return ds;
                }
                catch (Exception e)//            
                {
                    throw e;
                }
            }
            else
            {
                try
                {
                    DataTable ds = DefaultSession.GetDataTableFromCommand(@"select RESTYPE,RESNAME,RESID from RESOURCEITEM where RESTYPE = :type",type);
                    ds.TableName = "RESOURCEVIEW";
                    return ds;
                }
                catch (Exception e)//            
                {
                    throw e;
                }
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

        public override void DeleteByKey(object key)
        {
            try
            {
                DefaultSession.ExecuteCommand("update " + BOName + " set isvoid='Y' where resid=:resid", key.ToString());
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void ActiveByKey(object key)
        {
            try
            {
                DefaultSession.ExecuteCommand("update " + BOName + " set isvoid='N' where resid=:resid", key.ToString());
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
