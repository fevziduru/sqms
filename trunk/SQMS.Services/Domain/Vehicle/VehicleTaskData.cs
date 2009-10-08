using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SQMS.Services.Domain.QualityControl;

namespace SQMS.Services.Domain.Vehicle
{
    public class VehicleTaskData
    {
        public string TaskId
        {
            get;
            set;
        }
        public string VehicleTaskDataId
        {
            get;
            set;
        }
        public string VideoUrl
        {
            get;
            set;
        }
        public LatLng LatLng
        {
            get;
            set;
        }
        public string ImageUrl
        {
            get;
            set;
        }
        public string TicketId
        {
            get;
            set;
        }
        public string TicketType
        {
            get;
            set;
        }
    }
}
