using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class TimeItemService : GenericService
        {
                protected override void Initialize()
                {
                        BOName = "TIMEITEM";
                        base.Initialize();
                }


        }
}