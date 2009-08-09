using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using log4net;

namespace SQMS.Services.QualityControl
{
    public class ProjectService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(ProjectService));
        public static readonly string PROJECT_TABLENAME = "PROJECT";

        protected override void Initialize()
        {
            this.BOName = "PROJECT";
            base.Initialize();
        }

        public DataTable GetProjectList(string employeeId)
        {
            string sql = @"SELECT P.PROJECTID,
                                   P.PROJECTCODE,
                                   P.PROJECTNAME,
                                   P.TOTALWORKTIME,
                                   P.TOTALSCALE,
                                   P.ASSISTAMOUNT,
                                   P.LEADERAMOUNT,
                                   P.VISELEADERAMOUNT,
                                   P.TOTALWORKERAMOUNT,
                                   P.MEMO,
                                   P.CREATED,
                                   P.CREATEDBY,
                                   P.MODIFIED,
                                   P.MODIFIEDBY,
                                   P.EMPID,
                                   E.EMPNAME 
                              FROM PROJECT P
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID ";
            if (!String.IsNullOrEmpty(employeeId))
            {
                sql += " WHERE P.EMPID = '" + employeeId + "'";
            }

            DataTable dt = null;
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
                dt.TableName = PROJECT_TABLENAME;
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }

        public DataTable GetProjectList()
        {
            return this.GetProjectList(String.Empty);
        }

        public DataTable GetProjectManagerList()
        {
            string sql = @"SELECT MAX(E.EMPNAME) AS EMPNAME, P.EMPID
                              FROM PROJECT P
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             GROUP BY P.EMPID";
            DataTable dt = null;
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }
    }
}
