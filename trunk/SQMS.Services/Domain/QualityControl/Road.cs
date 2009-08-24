// File:    Road.cs
// Author:  fishtrees
// Created: 2009年8月8日 10:47:20
// Purpose: Definition of Class Road

using System;
namespace SQMS.Services.Domain.QualityControl
{
    public class Road
    {
        private string roadId;
        private string projectId;
        private string roadCode;
        private string roadName;
        private string roadType;
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

        public string RoadCode
        {
            get
            {
                return roadCode;
            }
            set
            {
                this.roadCode = value;
            }
        }

        public string RoadName
        {
            get
            {
                return roadName;
            }
            set
            {
                this.roadName = value;
            }
        }

        public string RoadType
        {
            get
            {
                return roadType;
            }
            set
            {
                this.roadType = value;
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