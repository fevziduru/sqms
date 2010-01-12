using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class WorkStatusService:GenericService
        {
                protected override void Initialize()
                {
                        this.BOName = "WORKSTATUS";
                        base.Initialize();
                }
        }
}
