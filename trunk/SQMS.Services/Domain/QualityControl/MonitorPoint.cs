// File:    MonitorPoint.cs
// Author:  fishtrees
// Created: 2009年8月8日 10:47:20
// Purpose: Definition of Class MonitorPoint

using System;
namespace SQMS.Services.Domain.QualityControl
{
    /// 监控点
    public class MonitorPoint
    {
        private string organizationId;
        private string monitorPointId;
        private string roadId;
        private string monitorPointCode;
        private string monitorPointName;
        private decimal lat;
        private decimal lng;
        private string memo;
        private DateTime created;
        private string createdBy;
        private DateTime modified;
        private string modifiedBy;
        private int level = 14;
        private int lastestQCLevel = 0;
        private bool isStart = false;
        private TimeSchema timeSchema;

        public TimeSchema TimeSchema
        {
            get { return timeSchema; }
            set { timeSchema = value; }
        }
        /// <summary>
        /// 是否为路段起始点
        /// </summary>
        public bool IsStart
        {
            get { return isStart; }
            set { isStart = value; }
        }
        /// <summary>
        /// 获取或设置监控点中最新常态监控数据的质量等级
        /// </summary>
        public int LastestQCLevel
        {
            get { return lastestQCLevel; }
            set { lastestQCLevel = value; }
        }
        /// <summary>
        /// 获取或设置地图缩放等级，监控点只在该监控点该缩放级别上显示
        /// </summary>
        public int Level
        {
            get { return level; }
            set { level = value; }
        }

        public string MonitorPointId
        {
            get
            {
                return monitorPointId;
            }
            set
            {
                this.monitorPointId = value;
            }
        }

        public string MonitorPointCode
        {
            get
            {
                return monitorPointCode;
            }
            set
            {
                this.monitorPointCode = value;
            }
        }

        public string MonitorPointName
        {
            get
            {
                return monitorPointName;
            }
            set
            {
                this.monitorPointName = value;
            }
        }

        public decimal Lat
        {
            get
            {
                return lat;
            }
            set
            {
                this.lat = value;
            }
        }

        public decimal Lng
        {
            get
            {
                return lng;
            }
            set
            {
                this.lng = value;
            }
        }

        public string Memo
        {
            get
            {
                return memo;
            }
            set
            {
                this.memo = value;
            }
        }

        public DateTime Created
        {
            get
            {
                return created;
            }
            set
            {
                this.created = value;
            }
        }

        public string CreatedBy
        {
            get
            {
                return createdBy;
            }
            set
            {
                this.createdBy = value;
            }
        }

        public DateTime Modified
        {
            get
            {
                return modified;
            }
            set
            {
                this.modified = value;
            }
        }

        public string ModifiedBy
        {
            get
            {
                return modifiedBy;
            }
            set
            {
                this.modifiedBy = value;
            }
        }

        public string RoadId
        {
            get
            {
                return roadId;
            }
            set
            {
                this.roadId = value;
            }
        }

        public string OrganizationId
        {
            get
            {
                return organizationId;
            }
            set
            {
                this.organizationId = value;
            }
        }

        public string ProjectName
        {
            get;
            set;
        }
        public string ProjectId
        {
            get;
            set;
        }
        public string RoadName
        {
            get;
            set;
        }
        public bool IsEnd
        {
            get;
            set;
        }

    }

    public enum MonitorPointType
    {
        Road,
        Event
    }
}