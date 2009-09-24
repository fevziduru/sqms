using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using EasyDev.Applications.SQMS;

namespace SQMS.Services
{
        public class MonitorPointService : GenericService, IPortalPartService
        {
                public EnumerationService EnumService { get; private set; }

                protected override void Initialize()
                {
                        BOName = "MPASSIGNMENT";
                        EnumService = ServiceManager.CreateService<EnumerationService>();

                        base.Initialize();
                }

                public void UpdateMonitorPointTimeSchema(string timeschemaId, string mpid)
                {
                        try
                        {
                                DefaultSession.ExecuteCommand(
                                        string.Format("update {0} set schemaid=:schemaid where organizationid=:orgid and mpid=:mpid", BOName), timeschemaId, CurrentUser.OrganizationID, mpid);
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                public DataSet GetListDataByType(string type)
                {
                        try
                        {
                                DataSet ds = DefaultSession.GetDataSetFromCommand(@"select mpa.mpid,mpa.mpname,mpa.isvoid,mpa.importance,mpa.longitude,mpa.latitude from mpassignment mpa
                                        left join enumeration e on mpa.importance=e.enumid where mpa.organizationid=:orgid and mptype=:type", CurrentUser.OrganizationID, type);
                                ds.Tables[0].TableName = BOName;
                                return ds;
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                #region IPortalPartService 成员

                public DataSet GetPortalPartData()
                {
                        try
                        {
                                DataSet ds = new DataSet();
                                DataTable dt = DefaultSession.GetDataTableFromCommand(@"select t.mpid, t.mpname,t.chargeperson,t.empid, t.trend from 
                                                (
                                                select  max(MP.MPID) mpid,
                                                        max(q.qualitylevel) qualitylevel,
                                                        max(MP.MPNAME) mpname,
                                                        max(q.chargeperson) empid,
                                                        max(e.empname) chargeperson,
                                                        sum(decode(
                                                            sign(to_number(to_char(q.created, 'yyyyiw'))-to_number(to_char(sysdate,'yyyyiw'))),0,1,-1,-1,49,1,0)*nvl(Q.QUALITYLEVEL,0)) trend
                                                from mpassignment mp 
                                                left join quality q on MP.MPID = Q.MPID and q.organizationid=:organizationid
                                                left join employee e on e.empid = q.chargeperson and e.organizationid=:organizationid
                                                where MP.organizationid=:organizationid and to_char(q.created, 'yyyy')=to_char(sysdate,'yyyy')
                                                group by mp.mpid
                                                order by qualitylevel desc
                                                ) t where rownum<=5", CurrentUser.OrganizationID, CurrentUser.OrganizationID, CurrentUser.OrganizationID);
                                dt.TableName = "WeekTrend";
                                ds.Tables.Add(dt);

                                dt = DefaultSession.GetDataTableFromCommand(@"select t.mpid, t.mpname, t.chargeperson,t.empid, t.trend from 
                                                (
                                                select  max(MP.MPID) mpid,
                                                        max(q.qualitylevel) qualitylevel,
                                                        max(e.empname) chargeperson,
                                                        max(q.chargeperson) empid,
                                                        max(MP.MPNAME) mpname,
                                                        sum(decode(
                                                            to_number(to_char(q.created, 'yyyymm'))-to_number(to_char(sysdate, 'yyyymm')),0,1,
                                                            to_number(to_char(q.created, 'yyyymm'))-to_number(to_char(add_months(q.created, -1),'yyyymm')),0,-1,0)*nvl(Q.QUALITYLEVEL,0)) trend
                                                from mpassignment mp 
                                                left join quality q on MP.MPID = Q.MPID and q.organizationid=:organizationid
                                                left join employee e on e.empid = q.chargeperson and e.organizationid=:organizationid
                                                where MP.organizationid=:organizationid and to_char(q.created, 'yyyy')=to_char(sysdate,'yyyy')
                                                group by mp.mpid
                                                order by qualitylevel desc
                                                ) t
                                                where rownum<=5", CurrentUser.OrganizationID, CurrentUser.OrganizationID, CurrentUser.OrganizationID);
                                dt.TableName = "MonthTrend";
                                ds.Tables.Add(dt);

                                dt = DefaultSession.GetDataTableFromCommand(@"select t.mpid,t.empid, t.mpname,t.chargeperson, t.trend from 
                                                (
                                                select  max(MP.MPID) mpid,
                                                        max(e.empname) chargeperson,
                                                        max(q.qualitylevel) qualitylevel,
                                                        max(q.chargeperson) empid,
                                                        max(MP.MPNAME) mpname,
                                                        sum(decode(
                                                            to_number(to_char(q.created, 'yyyy'))-to_number(to_char(sysdate, 'yyyy')),0,1,
                                                            to_number(to_char(q.created, 'yyyy'))-to_number(to_char(add_months(q.created, -1),'yyyy')),1,-1,0)*nvl(Q.QUALITYLEVEL,0)) trend
                                                from mpassignment mp 
                                                left join quality q on MP.MPID = Q.MPID and q.organizationid=:organizationid
                                                left join employee e on e.empid=q.chargeperson and e.organizationid=:organizationid
                                                where MP.organizationid=:organizationid and to_char(q.created, 'yyyy')=to_char(sysdate,'yyyy')
                                                group by mp.mpname
                                                order by qualitylevel desc
                                                ) t
                                                where rownum<=5", CurrentUser.OrganizationID, CurrentUser.OrganizationID, CurrentUser.OrganizationID);
                                dt.TableName = "YearTrend";
                                ds.Tables.Add(dt);

                                return ds;
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                #endregion
        }
}
