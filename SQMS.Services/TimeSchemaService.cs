using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class TimeSchemaService : GenericService
        {
                protected override void Initialize()
                {
                        BOName = "TIMESCHEMA";
                        base.Initialize();
                }
        }
}
