using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class MonitorPointService : GenericService
        {
                protected override void Initialize()
                {
                        BOName = "MPASSIGNMENT";
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
        }
}
