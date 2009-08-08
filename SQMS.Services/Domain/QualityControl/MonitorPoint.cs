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
        private string regionId;
        private string monitorPointCode;
        private string monitorPointName;
        private decimal lat;
        private decimal lng;
        private string memo;
        private DateTime created;
        private string createdBy;
        private DateTime modified;
        private string modifiedBy;

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

        public string RegionId
        {
            get
            {
                return regionId;
            }
            set
            {
                this.regionId = value;
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

    }
}