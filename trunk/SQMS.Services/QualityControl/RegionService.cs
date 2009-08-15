using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using System.Data.Common;
using log4net;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

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
        public DataTable GetRegionList(PagingParameter pagingParam)
        {
            return this.GetRegionList(this.CurrentUser.OrganizationID, pagingParam);
        }
        public DataTable GetRegionList(string orgId,PagingParameter pagingParam)
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

        public int GetRegionListCount(string orgId)
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


        public int GetRegionListCount()
        {
            return this.GetRegionListCount(this.CurrentUser.OrganizationID);
        }
    }
}
