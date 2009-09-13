using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.QualityControl
{
    public class TimeItem
    {
        private string timeItemId;

        public string TimeItemId
        {
            get { return timeItemId; }
            set { timeItemId = value; }
        }
        private string timeSchemaId;

        public string TimeSchemaId
        {
            get { return timeSchemaId; }
            set { timeSchemaId = value; }
        }
        private string timeItemType;

        public string TimeItemType
        {
            get { return timeItemType; }
            set { timeItemType = value; }
        }
        private string timeSpot;

        public string TimeSpot
        {
            get { return timeSpot; }
            set { timeSpot = value; }
        }
        private TimeSpan timeSpan;

        public TimeSpan TimeSpan
        {
            get { return timeSpan; }
            set { timeSpan = value; }
        }
        private TimeSpan floatTime;

        public TimeSpan FloatTime
        {
            get { return floatTime; }
            set { floatTime = value; }
        }
        private decimal times;

        public decimal Times
        {
            get { return times; }
            set { times = value; }
        }

    }
}
