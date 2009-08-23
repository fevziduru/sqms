using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using log4net;
using SQMS.Services.Domain.QualityControl;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

namespace SQMS.Services.QualityControl
{
    public class QualityControlService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(QualityControlService));

        public static readonly string QC_TYPE_NORMAL = "_qc_type_normal";
        public static readonly string QC_TYPE_DYNAMIC = "_qc_type_dynamic";

        protected override void Initialize()
        {
            this.BOName = "QUALITY";
            base.Initialize();
        }

        #region 获取数据
        /// <summary>
        /// 根据路段ID获取监控点
        /// </summary>
        /// <param name="regionId"></param>
        /// <returns></returns>
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
                                   E.EMPNAME,
                                   M.MPLEVEL
                              FROM MPASSIGNMENT M
                              LEFT JOIN ROAD R ON R.ROADID = M.ROADID
                              LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             WHERE M.ROADID = '" + regionId+"'";
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
        /// <summary>
        /// 获取监控点详细信息
        /// </summary>
        /// <param name="mpId"></param>
        /// <returns></returns>
        public DataTable GetMonitorPoint(string mpId)
        {
            string sql = @"SELECT M.MPID,
       M.ROADID,
       R.ROADNAME,
       P.PROJECTNAME,
       M.MPCODE,
       M.MPNAME,
       M.LONGITUDE,
       M.LATITUDE,
       M.MEMO,
       M.CREATED,
       M.CREATEDBY,
       E1.EMPNAME AS CREATEDBYNAME,
       M.MODIFIED,
       M.MODIFIEDBY,
       E2.EMPNAME AS MODIFIEDBYNAME,
       E.EMPNAME AS PROJECTMANAGER,
       M.MPLEVEL
  FROM MPASSIGNMENT M
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = M.CREATEDBY
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = M.MODIFIEDBY
  LEFT JOIN ROAD R ON R.ROADID = M.ROADID
  LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID
  LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             WHERE M.MPID = '" + mpId + "'";
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
        /// <summary>
        /// 获取质量监控数据列表总数
        /// </summary>
        /// <param name="qmId">监控点ID</param>
        /// <param name="qcType">监控类型，QC_TYPE_NORMAL或QC_TYPE_DYNAMIC</param>
        /// <param name="beginDate">质量监控采集起始时间</param>
        /// <param name="endDate">质量监控采集截止时间</param>
        /// <returns></returns>
        public int GetQualityControlInfoListCount(string qmId, string qcType, DateTime beginDate, DateTime endDate)
        {
            if (String.IsNullOrEmpty(qmId))
            {
                throw new Exception("必须指定监控点ID");
            }
            string sql = @"SELECT COUNT(Q.QMID)
  FROM QUALITY Q
 WHERE 1=1 " + ((!String.IsNullOrEmpty(qcType)) ? "AND Q.TYPE='" + qcType + "' " : "");
            if (!beginDate.Equals(new DateTime(1, 1, 1)))
            {
                sql += " AND Q.CREATED >= TO_DATE('" + beginDate.ToString("yyyy-MM-dd HH:mm:ss") + @"', 'yyyy-MM-DD HH24:MI:SS') ";
            }
            if (!endDate.Equals(new DateTime(1, 1, 1)))
            {
                sql += " AND Q.CREATED < TO_DATE('" + endDate.ToString("yyyy-MM-dd HH:mm:ss") + @"', 'yyyy-MM-DD HH24:MI:SS') ";
            }
            if (!String.IsNullOrEmpty(qmId))
            {
                sql += " AND Q.MPID = '" + qmId + "'";
            }
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
        /// <summary>
        /// 获取质量监控数据列表总数
        /// </summary>
        /// <param name="qmId">监控点ID</param>
        /// <param name="qcType">监控类型，QC_TYPE_NORMAL或QC_TYPE_DYNAMIC</param>
        /// <param name="beginDate">质量监控采集起始时间</param>
        /// <returns></returns>
        public int GetQualityControlInfoListCount(string qmId, string qcType, DateTime beginDate)
        {
            return this.GetQualityControlInfoListCount(qmId, qcType, beginDate, new DateTime());
        }
        public int GetQualityControlInfoListCount(string qmId, string qcType)
        {
            return this.GetQualityControlInfoListCount(qmId, qcType,new DateTime(),new DateTime());
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
       E4.EMPNAME AS CREATEDBYNAME,
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
       ENUM2.ENUMNAME AS QCTYPE,
       Q.QUALITYLEVEL
  FROM QUALITY Q
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = Q.CHARGEPERSON
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = Q.EMERGENCYPERSON
  LEFT JOIN EMPLOYEE E3 ON E3.EMPID = Q.CHECKPERSON
  LEFt JOIN EMPLOYEE E4 ON E4.EMPID = Q.CREATEDBY
  LEFT JOIN ORGANIZATION O ON O.ORGID = Q.WORKUNIT
  LEFT JOIN MPASSIGNMENT M ON M.MPID = Q.MPID
  LEFT JOIN ENUMERATION ENUM1 ON ENUM1.ENUMID = Q.STATUS
  LEFT JOIN ENUMERATION ENUM2 ON ENUM2.ENUMID = Q.TYPE
 WHERE 1=1 " + ((!String.IsNullOrEmpty(qcType)) ? "AND Q.TYPE='" + qcType + "' " : "");
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
                sql += " AND Q.MPID = '" + qmId + "'";
            }
            sql += "  ORDER BY Q.CREATED DESC";
            string pagingSql = sql;
            if (null != pagingParam)
            {
                pagingSql = "SELECT * FROM (" + sql + ") WHERE ROWNUM >= "
                    + (pagingParam.PageNo * pagingParam.PageSize - pagingParam.PageSize + 1)
                    + " AND ROWNUM < "
                    + (pagingParam.PageNo * pagingParam.PageSize + 1);
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
  LEFT JOIN ORGANIZATION O ON O.ORGID = Q.WORKUNIT
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
  LEFT JOIN ORGANIZATION O ON O.ORGID = Q.WORKUNIT
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
                                   E.EMPNAME,
                                   M.MPLEVEL
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
                                       E.EMPNAME,
                                       M.MPLEVEL
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
        public DataTable GetVideo(string videoId)
        {
            string sql = @"SELECT V.VIDEOID,
       V.VIDEONAME,
       V.MEMO,
       V.VIDEOURL,
       V.TRACE,
       V.CREATED,
       E1.EMPNAME AS CREATEDBY,
       V.MODIFIED,
       E2.EMPNAME AS MODIFIEDBY
  FROM VIDEO V
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = V.CREATEDBY
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = V.MODIFIEDBY
 WHERE V.VIDEOID = '"+videoId+"'";
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

        public DataTable GetVideoList(string mpId)
        {
            string sql = @"SELECT V.VIDEOID,
       V.VIDEONAME,
       V.MEMO,
       V.VIDEOURL,
       V.TRACE,
       V.CREATED,
       E1.EMPNAME AS CREATEDBY,
       V.MODIFIED,
       E2.EMPNAME AS MODIFIEDBY
  FROM VIDEO V
 INNER JOIN MONITORPOINTINVIDEO MINV ON MINV.VIDEOID = V.VIDEOID
  LEFT JOIN EMPLOYEE E1 ON E1.EMPID = V.CREATEDBY
  LEFT JOIN EMPLOYEE E2 ON E2.EMPID = V.MODIFIEDBY
 WHERE MINV.MPID = '" + mpId + "'";
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
