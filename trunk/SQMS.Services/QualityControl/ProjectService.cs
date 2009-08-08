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
        

        public DataTable GetProjectList()
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
                                   P.MODIFIEDBY
                              FROM PROJECT P";
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
    }
}
