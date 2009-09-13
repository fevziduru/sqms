using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.QualityControl
{
    public class TimeSchema
    {
        private string timeSchemaId;

        public string TimeSchemaId
        {
            get { return timeSchemaId; }
            set { timeSchemaId = value; }
        }
        private string timeSchemaName;

        public string TimeSchemaName
        {
            get { return timeSchemaName; }
            set { timeSchemaName = value; }
        }
        private bool isVoid;

        public bool IsVoid
        {
            get { return isVoid; }
            set { isVoid = value; }
        }
        private DateTime beginTime;

        public DateTime BeginTime
        {
            get { return beginTime; }
            set { beginTime = value; }
        }
        public string BeginTimeString
        {
            get;
            set;
        }
        private DateTime endTime;

        public DateTime EndTime
        {
            get { return endTime; }
            set { endTime = value; }
        }
        public string EndTimeString
        {
            get;
            set;
        }
        public double TimeAmount
        {
            get {

                return (EndTime - BeginTime).TotalHours;
            }
        }

        private List<TimeItem> timeItems;

        public List<TimeItem> TimeItems
        {
            get
            {
                if (null == this.timeItems)
                {
                    this.timeItems = new List<TimeItem>();
                }
                return timeItems;
            }
            set { timeItems = value; }
        }

        private decimal floatTime;

        public decimal FloatTime
        {
            get { return floatTime; }
            set { floatTime = value; }
        }

        public decimal TimeSpan
        {
            get;
            set;
        }
        public decimal Times
        {
            get;
            set;
        }
    }
}
