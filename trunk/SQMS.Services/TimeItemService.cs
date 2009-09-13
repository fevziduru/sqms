using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using log4net;

namespace SQMS.Services
{
        public class TimeItemService : GenericService
        {
            private static readonly ILog log = LogManager.GetLogger("TimeItemService");
                protected override void Initialize()
                {
                        BOName = "TIMEITEM";
                        base.Initialize();
                }
                #region 获取时间点数据
                public DataTable SearchTimeItems(string mpId, string qcType)
                {
                    string sql = this.getTimeItemMainSql() + @" WHERE M.MPID = '" + mpId + @"'
                AND M.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'";
                    if(!String.IsNullOrEmpty(qcType))
                    {
                        sql += " AND T.TIMEITEMTYPE = '" + qcType + "'";
                    }
                    DataTable dt = new DataTable();
                    try
                    {
                        dt = this.DefaultSession.GetDataTableFromCommand(sql);
                    }
                    catch (Exception e)
                    {
                        log.Error(e.ToString());
                        throw;
                    }
                    return dt;
                }
                private string getTimeItemMainSql()
                {
                    return @"SELECT T.TIMEITEMID,
                           T.SCHEMAID,
                           T.TIMEITEMTYPE,
                           T.TIMESPOT,
                           T.TIMESPAN,
                           T.CREATED,
                           T.CREATEDBY,
                           T.MODIFIED,
                           T.MODIFIEDBY,
                           T.ORGANIZATIONID,
                           T.TIMES,
                           T.FLOATTIME
                      FROM MPASSIGNMENT M
                      LEFT JOIN TIMEITEM T ON T.SCHEMAID = M.SCHEMAID
                                          AND T.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + "'";
                }
                #endregion

        }
}