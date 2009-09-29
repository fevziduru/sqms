using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
    public class VehicleTaskService : GenericService
    {
        public EnumerationService EnumService { get; private set; }

        protected override void Initialize()
        {
            BOName = "VEHICLETASK";
            EnumService = ServiceManager.CreateService<EnumerationService>();

            base.Initialize();
        }
    }
}
