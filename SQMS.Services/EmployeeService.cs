﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;

namespace SQMS.Services
{
    public class EmployeeService : GenericService
    {
        private PassportService srv = null;

        protected override void Initialize()
        {
            this.BOName = "EMPLOYEE";
            srv = ServiceManager.CreateService<PassportService>();
            
            base.Initialize();
        }
    }
}