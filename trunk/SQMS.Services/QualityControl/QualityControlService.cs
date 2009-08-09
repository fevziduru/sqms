using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using log4net;
using SQMS.Services.Domain.QualityControl;
using SQMS.Services.Domain.Common;

namespace SQMS.Services.QualityControl
{
    public class QualityControlService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(QualityControlService));

        protected override void Initialize()
        {
            this.BOName = "QUALITY";
            base.Initialize();
        }

        #region 获取数据
        public DataTable GetMonitorPointList(string regionId)
        {
            string sql = @"SELECT M.MPID,
                                   M.ROADID,
                                   M.MPCODE,
                                   M.MPNAME,
                                   M.LONGITUDE,
                                   M.LATITUDE,
                                   M.MEMO,
                                   M.CREATED,
                                   M.CREATEDBY,
                                   M.MODIFIED,
                                   M.MODIFIEDBY,
                                   E.EMPNAME
                              FROM MPASSIGNMENT M
                              LEFT JOIN ROAD R ON R.ROADID = M.ROADID
                              LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             WHERE M.ROADID = '" +regionId+"'";
            DataTable dt = new DataTable();
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
        public DataTable GetQualityControlInfoList(string qmId,string qcType, DateTime beginDate, DateTime endDate, PagingParameter pagingParam)
        {
            if (String.IsNullOrEmpty(qmId))
            {
                throw new Exception("必须指定监控点ID");
            }
            string sql = @"SELECT Q.MEMO,
       Q.CREATED,
       Q.CREATEDBY,
       Q.MODIFIED,
       Q.MODIFIEDBY,
       Q.QMID,
       Q.CHARGEPERSON,
       E1.EMPNAME AS CHARGEPERSONNAME,
       Q.WORKUNIT,
       O.ORGNAME,
       Q.STATUS,
       ENUM1.ENUMNAME AS STATUSNAME,
       Q.MPID,
       M.MPNAME,
       ROUND(M.LONGITUDE, 4) AS MPLNG,
       ROUND(M.LATITUDE, 4) AS MPLAT,
       Q.EMERGENCYPERSON,
       E2.EMPNAME AS EMERGENCYPERSONNAME,
       Q.QMCODE,
       Q.CHECKPERSON,
       E3.EMPNAME AS CHECKPERSONNAME,
       Q.MATERIAL,
       ROUND(Q.LONGITUDE, 4) AS LONGITUDE,
       ROUND(Q.LATITUDE, 4) AS LATITUDE,
       Q.TYPE,
       ENUM2.ENUMNAME AS QCTYPE
  FROM QUALITY Q
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = Q.CHARGEPERSON
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = Q.EMERGENCYPERSON
  LEFT JOIN EMPLOYEE E3 ON E3.EMPID = Q.CHECKPERSON
  LEFT JOIN ORAGANIZATION O ON O.ORGID = Q.WORKUNIT
  LEFT JOIN MPASSIGNMENT M ON M.MPID = Q.MPID
  LEFT JOIN ENUMERATION ENUM1 ON ENUM1.ENUMID = Q.STATUS
  LEFT JOIN ENUMERATION ENUM2 ON ENUM2.ENUMID = Q.TYPE
 WHERE 1=1 "+ ((!String.IsNullOrEmpty(qcType)) ? "AND Q.TYPE='" + qcType + "' " : "");
            if(!beginDate.Equals(new DateTime(1,1,1)))
            {
                sql += " AND Q.CREATED >= TO_DATE('"+beginDate.ToString("yyyy-MM-dd HH:mm:ss")+@"', 'yyyy-MM-DD HH24:MI:SS') "; 
            }
            if(!endDate.Equals(new DateTime(1,1,1)))
            {
                sql += " AND Q.CREATED < TO_DATE('" + endDate.ToString("yyyy-MM-dd HH:mm:ss") + @"', 'yyyy-MM-DD HH24:MI:SS') ";
            }
            if(!String.IsNullOrEmpty(qmId))
            {
                sql += " AND Q.QMID = '"+qmId+"'";
            }
            sql += "  ORDER BY Q.CREATED DESC";
            string pagingSql = "SELECT * FROM (" + sql + ") WHERE ROWNUM >= "
                + (pagingParam.PageNo * pagingParam.PageSize - pagingParam.PageSize)
                + " AND ROWNUM < "
                + (pagingParam.PageNo * pagingParam.PageSize);
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
        public DataTable GetQualityControlInfoList(string qmId, string qcType, DateTime beginDate, PagingParameter pagingParam)
        {
            return this.GetQualityControlInfoList(qmId, qcType, beginDate, DateTime.Now, pagingParam);
        }
        public DataTable GetQualityControlInfoList(string qmId, string qcType, PagingParameter pagingParam)
        {
            return this.GetQualityControlInfoList(qmId,qcType, new DateTime(), new DateTime(), pagingParam);
        }

        public DataTable GetQualityControlInfo(string qcId)
        {
            string sql = @"SELECT Q.MEMO,
       Q.CREATED,
       Q.CREATEDBY,
       Q.MODIFIED,
       Q.MODIFIEDBY,
       Q.QMID,
       Q.CHARGEPERSON,
       E1.EMPNAME AS CHARGEPERSONNAME,
       Q.WORKUNIT,
       O.ORGNAME,
       Q.STATUS,
       ENUM1.ENUMNAME AS STATUSNAME,
       Q.MPID,
       M.MPNAME,
       ROUND(M.LONGITUDE, 4) AS MPLNG,
       ROUND(M.LATITUDE, 4) AS MPLAT,
       Q.EMERGENCYPERSON,
       E2.EMPNAME AS EMERGENCYPERSONNAME,
       Q.QMCODE,
       Q.CHECKPERSON,
       E3.EMPNAME AS CHECKPERSONNAME,
       Q.MATERIAL,
       ROUND(Q.LONGITUDE, 4) AS LONGITUDE,
       ROUND(Q.LATITUDE, 4) AS LATITUDE,
       Q.TYPE,
       ENUM2.ENUMNAME AS QCTYPE
  FROM QUALITY Q
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = Q.CHARGEPERSON
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = Q.EMERGENCYPERSON
  LEFT JOIN EMPLOYEE E3 ON E3.EMPID = Q.CHECKPERSON
  LEFT JOIN ORAGANIZATION O ON O.ORGID = Q.WORKUNIT
  LEFT JOIN MPASSIGNMENT M ON M.MPID = Q.MPID
  LEFT JOIN ENUMERATION ENUM1 ON ENUM1.ENUMID = Q.STATUS
  LEFT JOIN ENUMERATION ENUM2 ON ENUM2.ENUMID = Q.TYPE
 WHERE Q.QMID = '" + qcId+"'";
            DataTable dt = new DataTable();
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
        public DataTable GetLatestQualityControlInfo(string mpId,string qcType)
        {
            string sql = @"SELECT * FROM (SELECT Q.MEMO,
       Q.CREATED,
       Q.CREATEDBY,
       Q.MODIFIED,
       Q.MODIFIEDBY,
       Q.QMID,
       Q.CHARGEPERSON,
       E1.EMPNAME AS CHARGEPERSONNAME,
       Q.WORKUNIT,
       O.ORGNAME,
       Q.STATUS,
       ENUM1.ENUMNAME AS STATUSNAME,
       Q.MPID,
       M.MPNAME,
       ROUND(M.LONGITUDE, 4) AS MPLNG,
       ROUND(M.LATITUDE, 4) AS MPLAT,
       Q.EMERGENCYPERSON,
       E2.EMPNAME AS EMERGENCYPERSONNAME,
       Q.QMCODE,
       Q.CHECKPERSON,
       E3.EMPNAME AS CHECKPERSONNAME,
       Q.MATERIAL,
       ROUND(Q.LONGITUDE, 4) AS LONGITUDE,
       ROUND(Q.LATITUDE, 4) AS LATITUDE,
       Q.TYPE,
       ENUM2.ENUMNAME AS QCTYPE
  FROM QUALITY Q
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = Q.CHARGEPERSON
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = Q.EMERGENCYPERSON
  LEFT JOIN EMPLOYEE E3 ON E3.EMPID = Q.CHECKPERSON
  LEFT JOIN ORAGANIZATION O ON O.ORGID = Q.WORKUNIT
  LEFT JOIN MPASSIGNMENT M ON M.MPID = Q.MPID
  LEFT JOIN ENUMERATION ENUM1 ON ENUM1.ENUMID = Q.STATUS
  LEFT JOIN ENUMERATION ENUM2 ON ENUM2.ENUMID = Q.TYPE
 WHERE Q.MPID = '" + mpId + "'"
                   + ((!String.IsNullOrEmpty(qcType)) ? "AND Q.TYPE='" + qcType + "' " : "")
                   + " ORDER BY Q.CREATED DESC) WHERE ROWNUM = 1";
            DataTable dt = new DataTable();
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

        public DataTable SearchMonitorPoint(string keywords)
        {
            string[] keywordArray = keywords.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string sqlLike = " (";
            foreach (string keyword in keywordArray)
            {
                sqlLike += " M.MPNAME LIKE '%" + keyword + "%' OR";
            }
            if (sqlLike.EndsWith("OR"))
            {
                sqlLike = sqlLike.Remove(sqlLike.Length - 2, 2);
            }
            sqlLike += ") ";
            string sql = @"SELECT M.MPID,
                                   M.ROADID,
                                   M.MPCODE,
                                   M.MPNAME,
                                   M.LONGITUDE,
                                   M.LATITUDE,
                                   M.MEMO,
                                   M.CREATED,
                                   M.CREATEDBY,
                                   M.MODIFIED,
                                   M.MODIFIEDBY,
                                   E.EMPNAME
                              FROM MPASSIGNMENT M
                              LEFT JOIN ROAD R ON R.ROADID = M.ROADID
                              LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             WHERE " + sqlLike;
            DataTable dt = new DataTable();
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

        public DataTable GetMonitorPointInLatLngBounds(LatLngBounds bound)
        {
            string sql = @"SELECT SELECT M.MPID,
                                       M.ROADID,
                                       M.MPCODE,
                                       M.MPNAME,
                                       M.LONGITUDE,
                                       M.LATITUDE,
                                       M.MEMO,
                                       M.CREATED,
                                       M.CREATEDBY,
                                       M.MODIFIED,
                                       M.MODIFIEDBY,
                                       E.EMPNAME
                              FROM MPASSIGNMENT M
                              LEFT JOIN ROAD R ON R.ROADID = M.ROADID
                              LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             WHERE M.LATITUDE < " + bound.NorthEast.Lat + @" 
                               AND M.LONGITUDE > " + bound.SouthWest.Lng + @" 
                               AND M.LATITUDE < " + bound.NorthEast.Lat + @"
                               AND M.LONGITUDE < " + bound.NorthEast.Lng + @" 
                               AND M.LATITUDE > " + bound.SouthWest.Lat + @"
                               AND M.LONGITUDE > " + bound.SouthWest.Lng + @" 
                               AND M.LATITUDE > " + bound.SouthWest.Lat + @"
                               AND M.LONGITUDE < " + bound.NorthEast.Lng;
            DataTable dt = new DataTable();
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
        #endregion
    }
}
