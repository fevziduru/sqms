using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SQMS.Services.Domain.QualityControl;

namespace SQMS.Services.Domain.Vehicle
{
    public class VehicleTrace
    {
        public string Points
        {
            get;
            set;
        }
        public List<VehicleTaskData> Data
        {
            get;
            set;
        }
    }
}
