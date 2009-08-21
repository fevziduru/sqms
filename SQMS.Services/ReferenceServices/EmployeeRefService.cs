using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using EasyDev.BL.Services;
using SQMS.Services.ReferenceServices;

namespace SQMS.Services.ReferenceServices 
{
    public class EmployeeRefService : GenericService, IReferenceService
    {
        protected override void Initialize()
        {
            this.BOName = "EMPLOYEE";
            base.Initialize();
        }

        public DataTable FetchReferenceData()
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand(
                    @"select empid value, empname text, empcode 职员编号, empname 职员名称 from employee");
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}
