using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;

namespace SQMS.Services
{
    public class OrganizationService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "ORGANIZATION";
            base.Initialize();
        }

        public DataSet GetORGViewALL()
        {
            try
            {
                DataSet ds = DefaultSession.GetDataSetFromCommand(@"select * from ORGANIZATION");
                ds.Tables[0].TableName = "ORGANIZATIONALL";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetORGViewList()
        {
            try
            {
                DataSet ds = DefaultSession.GetDataSetFromCommand(@"select ORGID,ORGNAME from ORGANIZATION");
                ds.Tables[0].TableName = "ORGANIZATIONList";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

    }

}
