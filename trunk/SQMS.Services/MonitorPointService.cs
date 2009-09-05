using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;

namespace SQMS.Services
{
        public class MonitorPointService : GenericService
        {
                public EnumerationService EnumService { get; private set; }

                protected override void Initialize()
                {
                        BOName = "MPASSIGNMENT";
                        EnumService = ServiceManager.CreateService<EnumerationService>();

                        base.Initialize();
                }

                public void UpdateMonitorPointTimeSchema(string timeschemaId, string mpid)
                {
                        try
                        {
                                DefaultSession.ExecuteCommand(
                                        string.Format("update {0} set schemaid=:schemaid where organizationid=:orgid and mpid=:mpid", BOName), timeschemaId, CurrentUser.OrganizationID, mpid);
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                public DataSet GetListData()
                {
                        try
                        {
                                DataSet ds = DefaultSession.GetDataSetFromCommand(@"select mpa.mpid,mpa.mpname,mpa.isvoid,mpa.importance,mpa.longitude,mpa.latitude from mpassignment mpa
                                        left join enumeration e on mpa.importance=e.enumid where mpa.organizationid=:orgid", CurrentUser.OrganizationID);
                                ds.Tables[0].TableName = BOName;
                                return ds;
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }
        }
}
