using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;

namespace SQMS.Services
{
    public class RoleService : GenericService
    {
        public OperationService OperationService { get; private set; }
        public ResourceService ResourceService { get; private set; }
        public ResPermissionService ResPermissionService { get; private set; }
        public UserRoleService UserRoleService { get; private set; }
        //public PassportService PassportService { get; private set; }

        protected override void Initialize()
        {
            this.BOName = "ROLE";
            base.Initialize();

            this.OperationService = ServiceManager.CreateService<OperationService>();
            this.ResourceService = ServiceManager.CreateService<ResourceService>();
            this.ResPermissionService = ServiceManager.CreateService<ResPermissionService>();
            //this.PassportService = ServiceManager.CreateService<PassportService>();
            this.UserRoleService = ServiceManager.CreateService<UserRoleService>();
        }

        public DataSet GetRoleByEmployeeID(string empid)
        {
            try
            {
                DataSet ds = DefaultSession.GetDataSetFromCommand(@"select p.passportid, r.roleid from role r 
                    left join userrole ur on r.roleid = ur.roleid
                    left join passport p on p.passportid = ur.passportid
                    left join employee e on e.empid = p.empid
                    where e.empid = :empid", empid);
                ds.Tables[0].TableName = "USERROLE";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataSet GetRolesView(string empid)
        {
            try
            {
                DataSet ds = DefaultSession.GetDataSetFromCommand(@"select r.rolename,p.passportid, r.roleid from role r 
                    left join userrole ur on r.roleid = ur.roleid
                    left join passport p on p.passportid = ur.passportid
                    left join employee e on e.empid = p.empid
                    where e.empid = :empid", empid);
                ds.Tables[0].TableName = "USERROLE";
                return ds;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
