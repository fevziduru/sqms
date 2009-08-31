using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class MonitorPointService : GenericService
        {
                protected override void Initialize()
                {
                        BOName = "MPASSIGNMENT";
                        base.Initialize();
                }
        }
}
