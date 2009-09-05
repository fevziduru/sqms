using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using log4net;
using EasyDev.PL;
using EasyDev.Applications.SQMS;

namespace SQMS.Services.QualityControl
{
        public class ProjectService : GenericService, IPortalPartService
        {
                private static readonly ILog log = LogManager.GetLogger(typeof(ProjectService));
                public static readonly string PROJECT_TABLENAME = "PROJECT";

                protected override void Initialize()
                {
                        this.BOName = "PROJECT";
                        base.Initialize();
                }

                /// <summary>
                /// 在当前用户的组织内按负责人取项目列表
                /// </summary>
                /// <param name="employeeId"></param>
                /// <returns></returns>
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
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID 
                              WHERE 1=1 AND P.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + "'";
                        if (!String.IsNullOrEmpty(employeeId))
                        {
                                sql += " AND P.EMPID = '" + employeeId + "'";
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
                /// <summary>
                /// 获取当前组织内的所有项目
                /// </summary>
                /// <returns></returns>
                public DataTable GetProjectList()
                {
                        return this.GetProjectList(String.Empty);
                }
                /// <summary>
                /// 获取登录用户所属公司的项目负责人列表
                /// </summary>
                /// <returns></returns>
                public DataTable GetProjectManagerList()
                {
                        string sql = @"SELECT MAX(E.EMPNAME) AS EMPNAME, P.EMPID
                              FROM PROJECT P
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID
                             GROUP BY P.EMPID";
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
                /// 获取发生项目业务的公司列表，可用于上级监督部门获取所有的环卫公司
                /// </summary>
                /// <returns></returns>
                public DataTable GetOrganizationListInProject()
                {
                        string sql = @"SELECT MAX(O.ORGNAME) ORGNAME, P.ORGANIZATIONID
  FROM PROJECT P
  LEFT JOIN ORGANIZATION O ON O.ORGID = P.ORGANIZATIONID
 GROUP BY P.ORGANIZATIONID";
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
                /// 按公司获取项目列表
                /// </summary>
                /// <param name="orgId"></param>
                /// <returns></returns>
                public DataTable GetProjectListByOrg(string orgId)
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
                        if (!String.IsNullOrEmpty(orgId))
                        {
                                sql += " WHERE P.ORGANIZATIONID = '" + orgId + "'";
                        }
                        DataTable dt = new DataTable();
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
                /// <summary>
                /// 获取所有公司的项目列表
                /// </summary>
                /// <returns></returns>
                public DataTable GetProjectListByOrg()
                {
                        return this.GetProjectListByOrg(String.Empty);
                }

                public DataTable GetProject(string projectId)
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
                                   P.ISVOID,
                                   E.EMPNAME 
                              FROM PROJECT P
                              LEFT JOIN EMPLOYEE E ON E.EMPID = P.EMPID 
                              WHERE P.ProjectId = '" + projectId + "' AND P.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + "'";

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

                public override void Save(DataSet dsSave)
                {
                        try
                        {
                                if (dsSave.Tables.Count > 0)
                                {
                                        DataTable dt = dsSave.Tables[0];
                                        dt.PrimaryKey = new DataColumn[] { dt.Columns["ProjectId"] };
                                        foreach (DataRow row in dt.Rows)
                                        {
                                                if (row.RowState == DataRowState.Added)
                                                {
                                                        this.DefaultSession.ExecuteCommand(SqlBuilder.BuildInsertCommand(this.BOName, row.Table, row));
                                                }
                                                else if (row.RowState == DataRowState.Modified)
                                                {
                                                        this.DefaultSession.ExecuteCommand(SqlBuilder.BuildUpdateCommand(this.BOName, row.Table, row));
                                                }
                                                else if (row.RowState == DataRowState.Deleted)
                                                {
                                                        this.DefaultSession.ExecuteCommand(SqlBuilder.BuildDeleteCommand(this.BOName, row.Table, row));
                                                }
                                        }

                                        dsSave.AcceptChanges();
                                }
                        }
                        catch (Exception e)
                        {
                                log.Error(e.ToString());
                                throw;
                        }
                }

                public DataTable GetRoadsOfProject(string projectid)
                {
                        try
                        {
                                DataTable dt = DefaultSession.GetDataTableFromCommand(@"select r.roadid, r.roadname, r.roadcode,r.avgworkeramount,r.worktime,r.workeramount from project t 
                                                left join road r on t.projectid=r.projectid
                                                where t.organizationid=:orgid and t.projectid=:projectid", CurrentUser.OrganizationID, projectid);
                                dt.TableName = "ROADS";
                                return dt;
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
                                return DefaultSession.GetDataSetFromCommand("select * from project p where rownum<=5 order by created desc");
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }

                #endregion
        }
}
