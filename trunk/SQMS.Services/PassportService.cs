using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using EasyDev.Util;
using EasyDev.SQMS;

namespace SQMS.Services
{
    public class PassportService : GenericService
    {
        private RoleService roleService = null;

        protected override void Initialize()
        {
            this.BOName = "PASSPORT";
            roleService = ServiceManager.CreateService<RoleService>();

            base.Initialize();
        }

        /// <summary>
        /// 取得所有角色
        /// </summary>
        /// <returns></returns>
        public DataSet GetRoles()
        {
            return roleService.LoadAll();
        }

        /// <summary>
        /// 用户登录验证
        /// </summary>
        /// <param name="name">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public UserInfo Login(string name, string password, string role)
        {
            UserInfo ui = null;
            try
            {
                if (DataSetUtil.GetFirstRowFromDataSet(
                    LoadByCondition(
                        string.Format("PASSPORT='{0}' AND PASSWORD='{1}'", name, password)), this.BOName) != null)
                {
                    ui = new UserInfo();
                    ui.Passport = name;
                    ui.Roles = GetUserRole(name);
                    ui.Permissions = GetUserPermission(name, role);
                }

                return ui;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 取得用户的角色
        /// </summary>
        /// <param name="passport"></param>
        /// <returns></returns>
        public DataTable GetUserRole(string passport)
        {
            try
            {
                DataTable dt = DefaultSession.GetDataTableFromCommand(
                        @"select r.rolename, r.roleid from passport p
                        left join userrole ur on p.passportid = ur.passportid
                        left join role r on r.roleid = ur.roleid
                        where p.passport = :passport and p.isvoid = 'N'", passport);
                dt.TableName = "UserRole";

                return dt;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 取得用户权限
        /// </summary>
        /// <param name="passport"></param>
        /// <returns></returns>
        public DataTable GetUserPermission(string passport, string role)
        {
            try
            {
                DataTable dt = DefaultSession.GetDataTableFromCommand(
                        @"select ri.resname, ri.resid, o.opid, o.opname, ri.location
                        from passport p
                        left join userrole ur on p.passportid = ur.passportid
                        left join role r on r.roleid = ur.roleid
                        left join respermission rp on rp.roleid = r.roleid
                        left join resourceitem ri on ri.resid = rp.resid
                        left join operation o on o.opid = rp.opid
                        where p.passport = :passport and p.isvoid = 'N' and r.roleid=:role", passport, role);
                dt.TableName = "UserPermission";

                return dt;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public string GetPassport(string empid)
        {
            try
            {
                return ConvertUtil.ToStringOrDefault(DefaultSession.GetScalarObjectFromCommand(
                    @"select passport from passport where empid=:empid and isvoid='N'", empid));
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetPassportByEmployeeID(string empid)
        {
            try
            {
                DataSet ds = DefaultSession.GetDataSetFromCommand("select * from passport where passport.empid=:empid", empid);
                ds.Tables[0].TableName = "PASSPORT";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool IsPassportExist(string passport)
        {
            try
            {
                DataSet ds = LoadByCondition("passport='" + passport+"'");
                return (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
