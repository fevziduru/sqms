using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;

namespace SQMS.Services
{
    public class OrganizationService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "ORGANIZATION";
            base.Initialize();
        }
    }
}
