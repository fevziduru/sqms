using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace EasyDev.SQMS
{
    public class UserInfo
    {
        public string Passport { get; set; }
        public string EmployeeName { get; set; }
        public DataTable Roles { get; set; }
        public DataTable Permissions { get; set; }
    }
}
