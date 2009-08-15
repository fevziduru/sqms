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
    public class EmployeeService : GenericService
    {
        public PassportService PassportService { get; private set; }
        public RoleService RoleService { get; private set; }
        public EnumerationService EnumService { get; private set; }
        //public DepartmentService DepartmentService { get; private set; }
        public OrganizationService OrganizationService { get; private set; }
        public EquipmentService EquipmentService { get; private set; }
        public UserRoleService UserRoleService { get; private set; }

        protected override void Initialize()
        {
            this.BOName = "EMPLOYEE";
            PassportService = ServiceManager.CreateService<PassportService>();
            RoleService = ServiceManager.CreateService<RoleService>();
            EnumService = ServiceManager.CreateService<EnumerationService>();
            OrganizationService = ServiceManager.CreateService<OrganizationService>();
            EquipmentService = ServiceManager.CreateService<EquipmentService>();
            UserRoleService = ServiceManager.CreateService<UserRoleService>();
            
            base.Initialize();
        }

        public DataSet GetRoles()
        {
            DataSet ds = RoleService.LoadAll();
            foreach (DataRow item in ds.Tables["ROLE"].Rows)
            {
                if (ConvertUtil.ToStringOrDefault(item["memo"]).Length > 0)
                {
                    item["rolename"] = ConvertUtil.ToStringOrDefault(item["rolename"]) + "：" + ConvertUtil.ToStringOrDefault(item["memo"]);
                }
            }

            return ds;
        }

        public DataTable GetSex()
        {
            return EnumService.GetSex();
        }

        public DataSet GetDepartments()
        {
            return OrganizationService.LoadByCondition(
                "orgtype='department' and organizationid='" + CurrentUser.OrganizationID + "'");
        }

        public DataSet GetEquipments()
        {
            return EquipmentService.LoadAll();
        }

        public string GetPassport(string empid)
        {
            return PassportService.GetPassport(empid);
        }

        public DataSet GetPassportByEmployeeID(string empid)
        {
            return PassportService.GetPassportByEmployeeID(empid);
        }

        public DataSet LoadPassportByKey(string key)
        {
            return PassportService.LoadByKey(key, true);
        }

        public override void Save(DataSet dsSave)
        {
            base.Save(dsSave); //调用本当前服务的基类保存，用于保存职员
            dsSave.Tables.Remove(this.BOName);
            string passportid = "";

            if (dsSave.Tables.Contains(PassportService.BOName))
            {
                PassportService.Save(dsSave);
                passportid = ConvertUtil.ToStringOrDefault(dsSave.Tables[PassportService.BOName].Rows[0]["passportid"]);
                dsSave.Tables.Remove(PassportService.BOName);
            }

            if (dsSave.Tables.Contains(UserRoleService.BOName))
            {
                //删除角色分配
                int effectRows = DefaultSession.ExecuteCommand(@"delete from userrole ur where ur.passportid=:passportid", passportid);

                UserRoleService.Save(dsSave);
                dsSave.Tables.Remove(UserRoleService.BOName);
            }
        }

        public void Delete(DataSet ds)
        {
            DataRow drEmployee = DataSetUtil.GetFirstRowFromDataSet(ds, "EMPLOYEE");
            string employeeId = "";
            string passportid = "";
            if (drEmployee != null)
            {
                employeeId = ConvertUtil.ToStringOrDefault(drEmployee["EMPID"]);
            }
                        
            //删除USERROLE
            DataRow drPassport = DataSetUtil.GetFirstRowFromDataSet(PassportService.GetPassportByEmployeeID(employeeId),"PASSPORT");
            if (drPassport != null)
            {
                passportid = ConvertUtil.ToStringOrDefault(drPassport["PASSPORTID"]);
                UserRoleService.DefaultSession.ExecuteCommand("delete from userrole ur where ur.passportid=:passportid", passportid);
            }

            //删除职员账号
            PassportService.DeleteByKey(passportid);

            //删除职员
            base.DeleteByKey(employeeId);
        }

        public override void DeleteByKey(object key)
        {
            //this.ViewData = Service.LoadByKey(this.ID, true);
            //this.ViewData.Merge(srv.GetPassportByEmployeeID(this.ID));
            //this.ViewData.Merge(srv.RoleService.GetRolesView(this.ID));

            DataSet ds = LoadByKey(key.ToString());
            DataSet tmp = PassportService.GetPassportByEmployeeID(key.ToString());
            if (tmp != null && tmp.Tables.Count > 0)
            {
                ds.Merge(tmp);
                tmp = RoleService.GetRolesView(key.ToString());
                if (tmp != null && tmp.Tables.Count > 0)
                {
                    ds.Merge(tmp);                    
                }
            }

            Delete(ds);
        }
    }
}
