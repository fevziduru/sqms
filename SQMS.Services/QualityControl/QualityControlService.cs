﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using log4net;
using SQMS.Services.Domain.QualityControl;
using SQMS.Services.Domain.Common;
using EasyDev.Util;

namespace SQMS.Services
{
        public class QualityControlService : GenericService
        {
                private static readonly ILog log = LogManager.GetLogger(typeof(QualityControlService));

                public static readonly string QC_TYPE_NORMAL = "_qc_type_normal";
                public static readonly string QC_TYPE_DYNAMIC = "_qc_type_dynamic";

                public EnumerationService EnumService { get; private set; }
                public TimeItemService TimeItemService { get; private set; }

                protected override void Initialize()
                {
                        this.BOName = "QUALITY";
                        EnumService = ServiceManager.CreateService<EnumerationService>();
                        TimeItemService = ServiceManager.CreateService<TimeItemService>();
                        base.Initialize();
                }

                #region 获取数据
                /// <summary>
                /// 根据路段ID获取监控点
                /// </summary>
                /// <param name="roadId"></param>
                /// <returns></returns>
                public DataTable GetMonitorPointList(string roadId)
                {
                        string sql = this.getMonitorPointMainSql() + @"
                             WHERE M.ROADID = '" + roadId + "' AND M.organizationid = '" + this.CurrentUser.OrganizationID + "'";
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
                /// <summary>
                /// 获取监控点详细信息
                /// </summary>
                /// <param name="mpId"></param>
                /// <returns></returns>
                public DataTable GetMonitorPoint(string mpId)
                {
                        string sql = this.getMonitorPointMainSql() + @" WHERE M.MPID = '" + mpId + "' AND M.organizationid ='" + this.CurrentUser.OrganizationID + "'";
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
                        sql += " AND Q.organizationid = '" + this.CurrentUser.OrganizationID + "'";
                        int count = 0;
                        try
                        {
                                count = ConvertUtil.ToInt(this.DefaultSession.GetScalarObjectFromCommand(sql));
                        }
                        catch (Exception e)
                        {
                                log.Error(e.ToString());
                                throw;
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
                        return this.GetQualityControlInfoListCount(qmId, qcType, new DateTime(), new DateTime());
                }

                public DataTable GetQualityControlInfoList(string qmId, string qcType, DateTime beginDate, DateTime endDate, PagingParameter pagingParam)
                {
                        if (String.IsNullOrEmpty(qmId))
                        {
                                throw new Exception("必须指定监控点ID");
                        }
                        string sql = this.getQualityMainSql() + @" WHERE 1=1 " + ((!String.IsNullOrEmpty(qcType)) ? "AND Q.TYPE='" + qcType + "' " : "");
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
                        sql += " AND Q.organizationid = '" + this.CurrentUser.OrganizationID + "'";
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
                                throw;
                        }
                        return dt;
                }

                public DataTable GetQualityControlInfoList(string qmId, string qcType, DateTime beginDate, PagingParameter pagingParam)
                {
                        return this.GetQualityControlInfoList(qmId, qcType, beginDate, DateTime.Now, pagingParam);
                }

                public DataTable GetQualityControlInfoList(string qmId, string qcType, PagingParameter pagingParam)
                {
                        return this.GetQualityControlInfoList(qmId, qcType, new DateTime(), new DateTime(), pagingParam);
                }

                public DataTable GetQualityControlInfo(string qcId)
                {
                        string sql = this.getQualityMainSql() + @" WHERE Q.QMID = '" + qcId + "' AND Q.ORGANIZATIONID='" + this.CurrentUser.OrganizationID + "'";
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
                public DataTable GetLatestQualityControlInfo(string mpId, string qcType)
                {
                        string sql = @"SELECT * FROM (" + this.getQualityMainSql() + @" WHERE Q.MPID = '" + mpId + "' "
                               + ((!String.IsNullOrEmpty(qcType)) ? "AND Q.TYPE='" + qcType + "' " : "")
                               + " AND Q.organizationid = '" + this.CurrentUser.OrganizationID + "' "
                               + " ORDER BY Q.CREATED DESC) WHERE ROWNUM = 1";
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
                        string sql = this.getMonitorPointMainSql() +
                                       @"WHERE " + sqlLike + @"
                               AND M.ORGANIZATIONID='" + this.CurrentUser.OrganizationID + @"'";
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

                public DataTable GetMonitorPointInLatLngBounds(LatLngBounds bound)
                {
                        string sql = this.getMonitorPointMainSql() + @" 
                             WHERE M.LATITUDE < " + bound.NorthEast.Lat + @" 
                               AND M.LONGITUDE > " + bound.SouthWest.Lng + @" 
                               AND M.LATITUDE < " + bound.NorthEast.Lat + @"
                               AND M.LONGITUDE < " + bound.NorthEast.Lng + @" 
                               AND M.LATITUDE > " + bound.SouthWest.Lat + @"
                               AND M.LONGITUDE > " + bound.SouthWest.Lng + @" 
                               AND M.LATITUDE > " + bound.SouthWest.Lat + @"
                               AND M.LONGITUDE < " + bound.NorthEast.Lng + @"
                               AND M.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + "'";
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
                public DataTable GetVideo(string videoId)
                {
                        string sql = this.getVideoMainSql() + @" WHERE V.VIDEOID = '" + videoId + "' AND V.organizationid ='" + this.CurrentUser.OrganizationID + "'";
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

                public DataTable GetVideoList(string mpId)
                {
                        string sql = this.getVideoMainSql() + @" WHERE MINV.MPID = '" + mpId + "' AND V.organizationid='" + this.CurrentUser.OrganizationID + "'";
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
                #endregion

                public DataSet FindQualityData(string mpid, string type, int floattime)
                {
                        try
                        {
                                try
                                {
                                        DataSet ds = null;
                                        if (type == "__all__")
                                        {
                                                ds = DefaultSession.GetDataSetFromCommand(@"select e1.empname emergencyperson,
                                                                                                                                  e2.empname chargeperson, e3.empname checkperson, t.qmid, t.mpid,t.qmcode,t.longitude,t.latitude, t.workunit, o.orgname,t.material,t.created,t.videourl
                                                                                from quality t
                                                                                left join employee e1 on t.emergencyperson = e1.empid
                                                                                left join employee e2 on t.chargeperson = e2.empid
                                                                                left join employee e3 on t.checkperson = e3.empid
                                                                                left join organization o on t.workunit = o.orgid
                                                                                where t.organizationid=:orgid and t.mpid=:mpid and (t.created between t.created-:ft/24/60 and t.created+:ft/24/60)", CurrentUser.OrganizationID, mpid, floattime, floattime);
                                        }
                                        else
                                        {
                                                ds = DefaultSession.GetDataSetFromCommand(@"select e1.empname emergencyperson,
                                                                                                                                  e2.empname chargeperson, e3.empname checkperson, t.qmid, t.mpid,t.qmcode,t.longitude,t.latitude, t.workunit, o.orgname,t.material,t.created,t.videourl
                                                                                from quality t
                                                                                left join employee e1 on t.emergencyperson = e1.empid
                                                                                left join employee e2 on t.chargeperson = e2.empid
                                                                                left join employee e3 on t.checkperson = e3.empid
                                                                                left join organization o on t.workunit = o.orgid
                                                                                where t.organizationid=:orgid and t.type=:type and t.mpid=:mpid and (t.created between t.created-:ft/24/60 and t.created+:ft/24/60)",
                                                                                                                                                                                                                   CurrentUser.OrganizationID, type, mpid, floattime, floattime);
                                        }
                                        ds.Tables[0].TableName = BOName;
                                        return ds;
                                }
                                catch (Exception e)
                                {
                                        throw e;
                                }
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                public DataSet FindQualityVideoData(string mpid, string type, int floattime)
                {
                        try
                        {
                                try
                                {
                                        DataSet ds = null;
                                        if (type == "__all__")
                                        {
                                                ds = DefaultSession.GetDataSetFromCommand(@"select e1.empname emergencyperson,
                                                                                                                                  e2.empname chargeperson, e3.empname checkperson, t.qmid, t.mpid,t.qmcode,t.longitude,t.latitude, t.workunit, o.orgname,t.material,t.created,t.videourl
                                                                                from quality t
                                                                                left join employee e1 on t.emergencyperson = e1.empid
                                                                                left join employee e2 on t.chargeperson = e2.empid
                                                                                left join employee e3 on t.checkperson = e3.empid
                                                                                left join organization o on t.workunit = o.orgid
                                                                                where  length(t.videourl) > 0 and  t.organizationid=:orgid and t.mpid=:mpid and (t.created between t.created-:ft/24/60 and t.created+:ft/24/60)", CurrentUser.OrganizationID, mpid, floattime, floattime);
                                        }
                                        else
                                        {
                                                ds = DefaultSession.GetDataSetFromCommand(@"select e1.empname emergencyperson,
                                                                                                                                  e2.empname chargeperson, e3.empname checkperson, t.qmid, t.mpid,t.qmcode,t.longitude,t.latitude, t.workunit, o.orgname,t.material,t.created,t.videourl
                                                                                from quality t
                                                                                left join employee e1 on t.emergencyperson = e1.empid
                                                                                left join employee e2 on t.chargeperson = e2.empid
                                                                                left join employee e3 on t.checkperson = e3.empid
                                                                                left join organization o on t.workunit = o.orgid
                                                                                where  length(t.videourl) > 0 and  t.organizationid=:orgid and t.type=:type and t.mpid=:mpid and (t.created between t.created-:ft/24/60 and t.created+:ft/24/60)",
                                                                                                                                                                                                                   CurrentUser.OrganizationID, type, mpid, floattime, floattime);
                                        }
                                        ds.Tables[0].TableName = BOName + "_Video";
                                        return ds;
                                }
                                catch (Exception e)
                                {
                                        throw e;
                                }
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                public DataTable FindQualityData(string mpid, string type)
                {
                        try
                        {
                                DataTable dt = null;
                                if (type == "__all__")
                                {
                                        dt = DefaultSession.GetDataTableFromCommand(@"select t.emergencyperson,t.chargeperson, t.checkperson, t.qmid, t.mpid,t.qmcode,t.longitude,t.latitude, t.workunit from quality t
                                                                                left join employee e1 on t.emergencyperson = e1.empid
                                                                                left join employee e2 on t.chargeperson = e2.empid
                                                                                left join employee e3 on t.checkperson = e3.empid
                                                                                left join organizationid o on t.workunit = o.orgid
                                                                                where t.organizationid=:orgid and t.mpid=:mpid", CurrentUser.OrganizationID, mpid);
                                }
                                else
                                {
                                        dt = DefaultSession.GetDataTableFromCommand(@"select t.emergencyperson,t.chargeperson, t.checkperson, t.qmid, t.mpid,t.qmcode,t.longitude,t.latitude, t.workunit from quality t
                                                                                left join employee e1 on t.emergencyperson = e1.empid
                                                                                left join employee e2 on t.chargeperson = e2.empid
                                                                                left join employee e3 on t.checkperson = e3.empid
                                                                                left join organizationid o on t.workunit = o.orgid
                                                                                where t.organizationid=:orgid and t.type=:type and t.mpid=:mpid", CurrentUser.OrganizationID, type, mpid);
                                }
                                dt.TableName = BOName;
                                return dt;
                        }
                        catch (Exception e)
                        {
                                log.Error(e.ToString());
                                throw;
                        }
                }

                private string getMonitorPointMainSql()
                {
                        return @"SELECT M.MPID,
                           M.ROADID,
                           M.MPCODE,
                           M.MPNAME,
                           M.LONGITUDE,
                           M.LATITUDE,
                           M.MEMO,
                           M.CREATED,
                           M.CREATEDBY,
                           E4.EMPNAME AS CREATEDBYNAME,
                           M.MODIFIED,
                           M.MODIFIEDBY,
                           E3.EMPNAME AS MODIFIEDBYNAME,
                           E.EMPNAME,
                           M.MPLEVEL,
                           M.LATESTQCLEVEL,
                           M.ISEND,
                           M.ISSTART,
                           T.SCHEMANAME,
                           T.FLOATTIME,
                           T.BEGINTIME,
                           T.ENDTIME,
                           R.ROADNAME,
                           P.PROJECTNAME
                  FROM MPASSIGNMENT M
                  LEFt JOIN EMPLOYEE E3 ON E3.EMPID = M.MODIFIEDBY AND E3.organizationid='" + this.CurrentUser.OrganizationID + @"'
                  LEFt JOIN EMPLOYEE E4 ON E4.EMPID = M.CREATEDBY AND E4.organizationid='" + this.CurrentUser.OrganizationID + @"'
                  LEFT JOIN ROAD R ON R.ROADID = M.ROADID AND R.ORGANIZATIONID='" + this.CurrentUser.OrganizationID + @"'
                  LEFT JOIN PROJECT P ON P.PROJECTID = R.PROJECTID AND P.ORGANIZATIONID='" + this.CurrentUser.OrganizationID + @"'
                  LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID AND E.ORGANIZATIONID='" + this.CurrentUser.OrganizationID + @"'
                  LEFT JOIN TIMESCHEMA T ON T.SCHEMAID = M.SCHEMAID AND T.ORGANIZATIONID='" + this.CurrentUser.OrganizationID + @"'";
                }

                private string getQualityMainSql()
                {
                        return @"SELECT Q.MEMO,
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
                      LEFT JOIN EMPLOYEE E1 ON E1.EMPID = Q.CHARGEPERSON AND E1.organizationid='" + this.CurrentUser.OrganizationID + @"'
                      LEFT JOIN EMPLOYEE E2 ON E2.EMPID = Q.EMERGENCYPERSON AND E2.organizationid='" + this.CurrentUser.OrganizationID + @"'
                      LEFT JOIN EMPLOYEE E3 ON E3.EMPID = Q.CHECKPERSON AND E3.organizationid='" + this.CurrentUser.OrganizationID + @"'
                      LEFt JOIN EMPLOYEE E4 ON E4.EMPID = Q.CREATEDBY AND E4.organizationid='" + this.CurrentUser.OrganizationID + @"'
                      LEFT JOIN ORGANIZATION O ON O.ORGID = Q.WORKUNIT AND O.organizationid='" + this.CurrentUser.OrganizationID + @"'
                      LEFT JOIN MPASSIGNMENT M ON M.MPID = Q.MPID AND M.organizationid='" + this.CurrentUser.OrganizationID + @"'
                      LEFT JOIN ENUMERATION ENUM1 ON ENUM1.ENUMID = Q.STATUS 
                      LEFT JOIN ENUMERATION ENUM2 ON ENUM2.ENUMID = Q.TYPE";
                }

                private string getVideoMainSql()
                {
                        return @"SELECT V.VIDEOID,
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
                      LEFT JOIN EMPLOYEE E1 ON E1.EMPID = V.CREATEDBY AND E1.organizationid = '" + this.CurrentUser.OrganizationID + @"'
                      LEFT JOIN EMPLOYEE E2 ON E2.EMPID = V.MODIFIEDBY AND E2.organizationid = '" + this.CurrentUser.OrganizationID + @"'";
                }
        }
}
