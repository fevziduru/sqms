using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
        public class EmergencyEventService : GenericService
        {
            public EnumerationService EnumService { get; private set; }

                protected override void Initialize()
                {
                    BOName = "EMERGENCYEVENT";
                    EnumService = ServiceManager.CreateService<EnumerationService>();


                    base.Initialize();
                }
        }
}