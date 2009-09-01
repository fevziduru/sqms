using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using System.Data.Common;
using log4net;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

namespace SQMS.Services
{
    public class RoadService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(RoadService));

        protected override void Initialize()
        {
            this.BOName = "ROAD";
            base.Initialize();
        }
        public DataTable GetRoadListInProject(string projectId)
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
        public DataTable GetRoadList(PagingParameter pagingParam)
        {
            return this.GetRoadList(this.CurrentUser.OrganizationID, pagingParam);
        }
        public DataTable GetRoadList(string orgId,PagingParameter pagingParam)
        {
            if (String.IsNullOrEmpty(orgId))
            {
                throw new ArgumentException("orgId参数不能为空");
            }
            string sql = @"SELECT R.ROADID,
       R.PROJECTID,
       R.ROADCODE,
       R.ROADNAME,
       ENUM1.ENUMNAME AS ROADTYPE,
       R.BEGINTIME,
       R.ENDTIME,
       R.WORKTIME,
       R.WORKERAMOUNT,
       R.MEMO,
       R.AVGWORKERAMOUNT,
       R.CREATED,
       R.CREATEDBY,
       R.MODIFIED,
       R.MODIFIEDBY,
       DECODE(R.ISVOID, 'Y', '已停用', '已启用') AS ISVOID
  FROM ROAD R
  LEFT JOIN ENUMERATION ENUM1 ON ENUM1.ENUMID = R.ROADTYPE
 WHERE R.ORGANIZATIONID = '" + orgId + "' ";
            string pagingSql = sql;
            if (null != pagingParam)
            {
                pagingSql = "SELECT * FROM (SELECT ROWNUM AS rowno,t.* FROM (" + sql + ") t WHERE ROWNUM < "
                    + (pagingParam.PageNo * pagingParam.PageSize + 1)
                    + ") WHERE rowno >= "
                    + (pagingParam.PageNo * pagingParam.PageSize - pagingParam.PageSize + 1);
            }
            DataTable dt = new DataTable();
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(pagingSql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }

        public int GetRoadListCount(string orgId)
        {
            if (String.IsNullOrEmpty(orgId))
            {
                throw new ArgumentException("orgId参数不能为空");
            }
            string sql = @"SELECT COUNT(R.ROADID)
  FROM ROAD R
 WHERE R.ORGANIZATIONID = '" + orgId + "' ";
            int count = 0;
            try
            {
                count = ConvertUtil.ToInt(this.DefaultSession.GetScalarObjectFromCommand(sql));
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return count;
        }


        public int GetRoadListCount()
        {
            return this.GetRoadListCount(this.CurrentUser.OrganizationID);
        }

        public DataTable GetRoad(string roadId)
        {
            string sql =@"SELECT R.ROADID,
       R.PROJECTID,
       P.PROJECTNAME,
       R.ROADCODE,
       R.ROADNAME,
       R.ROADTYPE,
       E.ENUMNAME AS ROADTYPENAME,
       R.BEGINTIME,
       R.ENDTIME,
       R.WORKTIME,
       R.WORKERAMOUNT,
       R.MEMO,
       R.AVGWORKERAMOUNT,
       R.CREATED,
       R.CREATEDBY,
       R.MODIFIED,
       R.MODIFIEDBY,
       R.ISVOID,
       R.ORGANIZATIONID,
       R.SUITEID
  FROM ROAD R
  LEFT JOIN ENUMERATION E ON E.ENUMID = R.ROADTYPE
  LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID
 WHERE R.ROADID = '"+roadId+"'";
            DataTable dt = null;
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
        public DataTable GetRoadType()
        {
            string sql = @"SELECT E.ENUMID,
       E.ENUMCODE,
       E.ENUMNAME,
       E.ENUMTYPE,
       E.MEMO,
       E.CREATED,
       E.CREATEDBY,
       E.MODIFIED,
       E.MODIFIEDBY
  FROM ENUMERATION E
 WHERE E.ENUMTYPE = '_road_type'";
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
