using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.Vehicle
{
    public class VehicleTask
    {
        public string TaskId
        {
            get;
            set;
        }
        public string TaskName
        {
            get;
            set;
        }

        public DateTime PublicTime
        {
            get;
            set;
        }
        public DateTime StartTime
        {
            get;
            set;
        }
        public DateTime EndTime
        {
            get;
            set;
        }
        public string Model
        {
            get;
            set;
        }
        public string TaskType
        {
            get;
            set;
        }
        public VehicleTrace Trace
        {
            get;
            set;
        }
        public string ChargeMan
        {
            get;
            set;
        }
        public string LicensePlateNum
        {
            get;
            set;
        }
        public bool IsGasSupplied
        {
            get;
            set;
        }
        public bool IsWaterSupplied
        {
            get;
            set;
        }
        public bool IsRepaired
        {
            get;
            set;
        }
        public bool IsVoid
        {
            get;
            set;
        }
    }
}
