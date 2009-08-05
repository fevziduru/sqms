using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;

namespace SQMS.Services
{
    public class EmployeeService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "EMPLOYEE";
            base.Initialize();
        }

        public bool mymethod()
        {
            return false;
        }
    }
}
