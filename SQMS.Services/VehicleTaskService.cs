using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;

namespace SQMS.Services
{
    public class VehicleTaskService : GenericService
    {
        protected override void Initialize()
        {
            BOName = "VEHICLETASK";
            base.Initialize();
        }
    }
}
