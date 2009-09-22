using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using log4net;

namespace SQMS.Services
{
        public class EmergencyEventService : GenericService
        {
            private static readonly ILog log = LogManager.GetLogger(typeof(EmergencyEventService));
            public EnumerationService EnumService { get; private set; }

                protected override void Initialize()
                {
                    BOName = "EMERGENCYEVENT";
                    EnumService = ServiceManager.CreateService<EnumerationService>();


                    base.Initialize();
                }
                public DataTable GetEvent(string eventId)
                {
                    string sql = this.getEventMainSql() + " AND E.EVENTID='"+eventId+"' AND E.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'";
                   
                    DataTable dt = null;
                    try
                    {
                        dt = this.DefaultSession.GetDataSetFromCommand(sql).Tables[0];
                    }
                    catch (Exception e)
                    {
                        log.Error(e.ToString());
                        throw;
                    }
                    return dt;
                }
                public DataTable GetEventList()
                {
                    return this.GetEventList("");
                }
                public DataTable GetEventList(string dateFilter)
                {
                    string sql = this.getEventMainSql() + " {0} AND E.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'";
                    if (!String.IsNullOrEmpty(dateFilter))
                    {
                        sql = String.Format(sql, " AND E.MODIFIED = TO_DATE('"+dateFilter+"', 'yyyy-mm-dd')");
                    }
                    else
                    {
                        sql = String.Format(sql, "");
                    }
                    DataTable dt = null;
                    try
                    {
                        dt = this.DefaultSession.GetDataSetFromCommand(sql).Tables[0];
                    }
                    catch (Exception e)
                    {
                        log.Error(e.ToString());
                        throw;
                    }
                    return dt;
                }
                public DataTable GetEventVideoList(string eventId)
                {
                    string sql = @"SELECT V.VIDEOID,
                                           V.VIDEONAME,
                                           V.MEMO,
                                           V.VIDEOURL,
                                           V.TRACE,
                                           V.CREATED,
                                           V.CREATEDBY,
                                           V.MODIFIED,
                                           V.MODIFIEDBY,
                                           V.ORGANIZATIONID,
                                           V.SUITEID,
                                           V.ISVOID,
                                           M.MPID
                                      FROM EMERGENCYEVENT E
                                     INNER JOIN MPASSIGNMENT M ON M.EVENTID = E.EVENTID
                                     INNER JOIN MONITORPOINTINVIDEO MV ON MV.MPID = M.MPID
                                     INNER JOIN VIDEO V ON V.VIDEOID = MV.VIDEOID                
                                     WHERE E.EVENTID = '" + eventId + @"'
                                       AND V.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'
                                       AND M.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'
                                       AND E.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'";
                    DataTable dt = null;
                    try
                    {
                        dt = this.DefaultSession.GetDataSetFromCommand(sql).Tables[0];
                    }
                    catch (Exception e)
                    {
                        log.Error(e.ToString());
                        throw;
                    }
                    return dt;
                }

                private string getEventMainSql()
                {
                    return @"SELECT E.EVENTID,
                                           E.SCHEMAID,
                                           E.EVENTNAME,
                                           E.ISVOID,
                                           E.CREATED,
                                           E.CREATEDBY,
                                           E.MODIFIED,
                                           E.MODIFIEDBY,
                                           E.ORGANIZATIONID,
                                           E.CHECKTIME,
                                           E.CHECKUNIT,
                                           E.PRIVILIGE,
                                           E.EMERGENCYCHARGEPERSON,
                                           EMP.EMPNAME,
                                           (SELECT M.MPID
                                              FROM MPASSIGNMENT M
                                             WHERE M.ISSTART = 'Y'
                                               AND M.EVENTID = E.EVENTID
                                               AND M.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"') AS STARTMPID
                                      FROM EMERGENCYEVENT E
                                      LEFT JOIN EMPLOYEE EMP ON EMP.EMPID = E.EMERGENCYCHARGEPERSON
                                                            AND EMP.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'
                                     WHERE 1=1";
                }

            
        }
}