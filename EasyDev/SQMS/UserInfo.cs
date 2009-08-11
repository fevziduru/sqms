using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace EasyDev.SQMS
{
    [Serializable]
    public class UserInfo
    {
        public string Passport { get; set; }
        public string EmployeeName { get; set; }
        public DataTable Roles { get; set; }
        public DataTable Permissions { get; set; }
        public string PassportID { get; set; }
        public string EmployeeID { get; set; }
        public string OrganizationID { get; set; }
        public string OrganizationName { get; set; }
        public string DepartmentID { get; set; }
        public string DepartmentName { get; set; }
    }
}
