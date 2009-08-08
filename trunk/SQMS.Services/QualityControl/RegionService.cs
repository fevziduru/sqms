using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using System.Data.Common;
using log4net;

namespace SQMS.Services.QualityControl
{
    public class RegionService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(RegionService));

        protected override void Initialize()
        {
            this.BOName = "ROAD";
            base.Initialize();
        }
        public DataTable GetRegionListInProject(string projectId)
        {
            string sql = @"SELECT R.ROADID,
                                   R.PROJECTID,
                                   R.ROADCODE,
                                   R.ROADNAME,
                                   R.ROADTYPE,
                                   R.BEGINTIME,
                                   R.ENDTIME,
                                   R.WORKTIME,
                                   R.WORKERAMOUNT,
                                   R.MEMO,
                                   R.AVGWORKERAMOUNT,
                                   R.CREATED,
                                   R.CREATEDBY,
                                   R.MODIFIED,
                                   R.MODIFIEDBY
                              FROM ROAD R
                             WHERE R.PROJECTID = '"+projectId+"'";
            DataTable dt = null;
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
                dt.TableName = this.BOName;
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }

        public DataTable GetRegionListInParent(string parentRegionId)
        {
            throw new NotImplementedException();
        }
            
    }
}
