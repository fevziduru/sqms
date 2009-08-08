// File:    Region.cs
// Author:  fishtrees
// Created: 2009年8月8日 10:47:20
// Purpose: Definition of Class Region

using System;
namespace SQMS.Services.Domain.QualityControl
{
    public class Region
    {
        private string regionId;
        private string projectId;
        private string regionCode;
        private string regionName;
        private string regionType;
        private DateTime workBeginTime;
        private DateTime workEndTime;
        private decimal totalWorkTime;
        private int workerNum;
        private string memo;
        private decimal avgWorkQuantum;
        private DateTime created;
        private string createdBy;
        private DateTime modified;
        private string modifiedBy;

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

        public string RegionCode
        {
            get
            {
                return regionCode;
            }
            set
            {
                this.regionCode = value;
            }
        }

        public string RegionName
        {
            get
            {
                return regionName;
            }
            set
            {
                this.regionName = value;
            }
        }

        public string RegionType
        {
            get
            {
                return regionType;
            }
            set
            {
                this.regionType = value;
            }
        }

        public DateTime WorkBeginTime
        {
            get
            {
                return workBeginTime;
            }
            set
            {
                this.workBeginTime = value;
            }
        }

        public DateTime WorkEndTime
        {
            get
            {
                return workEndTime;
            }
            set
            {
                this.workEndTime = value;
            }
        }

        public decimal TotalWorkTime
        {
            get
            {
                return totalWorkTime;
            }
            set
            {
                this.totalWorkTime = value;
            }
        }

        public int WorkerNum
        {
            get
            {
                return workerNum;
            }
            set
            {
                this.workerNum = value;
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

        public decimal AvgWorkQuantum
        {
            get
            {
                return avgWorkQuantum;
            }
            set
            {
                this.avgWorkQuantum = value;
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

        public string ProjectId
        {
            get
            {
                return projectId;
            }
            set
            {
                this.projectId = value;
            }
        }

    }
}