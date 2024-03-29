﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class TimeSchemaService : GenericService
        {
            public TimeItemService TimeItemService { get; private set; }

                protected override void Initialize()
                {
                        BOName = "TIMESCHEMA";
                        base.Initialize();

                        this.TimeItemService = ServiceManager.CreateService<TimeItemService>();
                }
        }
}
