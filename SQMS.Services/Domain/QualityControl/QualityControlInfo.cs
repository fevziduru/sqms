// File:    QualityControl.cs
// Author:  fishtrees
// Created: 2009年8月8日 10:47:20
// Purpose: Definition of Class QualityControl

using System;
namespace SQMS.Services.Domain.QualityControl
{
    public class QualityControlInfo
    {
        private string monitorPointId;
        private string organizationId;
        private string memo;
        /// 数据采集时间
        private DateTime created;
        private string createdBy;
        private DateTime modified;
        private string modifiedBy;
        private string qualityControlId;
        private string qualityControlCode;
        private string description;
        /// 数据采集地点经度
        private decimal lat;
        /// 数据采集地点纬度
        private decimal lng;
        private QualityControlType qualityControlType;
        /// 责任人
        private string employeeName;
        /// 应急处理责任人
        private string emergencyEmpName;
        /// 是否有效
        private bool isValid;
        /// 巡查员
        private string inspectEmpName;

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

        public string QualityControlId
        {
            get
            {
                return qualityControlId;
            }
            set
            {
                this.qualityControlId = value;
            }
        }

        public string QualityControlCode
        {
            get
            {
                return qualityControlCode;
            }
            set
            {
                this.qualityControlCode = value;
            }
        }

        public string Description
        {
            get
            {
                return description;
            }
            set
            {
                this.description = value;
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

        public QualityControlType QualityControlType
        {
            get
            {
                return qualityControlType;
            }
            set
            {
                this.qualityControlType = value;
            }
        }

        public string EmployeeName
        {
            get
            {
                return employeeName;
            }
            set
            {
                this.employeeName = value;
            }
        }

        public string EmergencyEmpName
        {
            get
            {
                return emergencyEmpName;
            }
            set
            {
                this.emergencyEmpName = value;
            }
        }

        public bool IsValid
        {
            get
            {
                return isValid;
            }
            set
            {
                this.isValid = value;
            }
        }

        public string InspectEmpName
        {
            get
            {
                return inspectEmpName;
            }
            set
            {
                this.inspectEmpName = value;
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
    }
}