using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;

namespace SQMS.Services
{
    public class EnumerationService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "ENUMERATION";
            base.Initialize();
        }

        public DataTable GetSex()
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand(@"select enumid, enumname from enumeration where enumtype='_sex'");
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable GetDegree()
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand(@"select enumid, enumname from enumeration where enumtype='_degree'");
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable GetEnumByType(string type)
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand
                    (@"select enumid, enumname from enumeration where enumtype=:type", type);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
