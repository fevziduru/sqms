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
        
        /// 数据采集地点经度
        private decimal lat;
        /// 数据采集地点纬度
        private decimal lng;
        private QualityControlType qualityControlType;
        /// 责任人
        private string employeeName;
        /// 应急处理责任人
        private string emergencyEmpName;
        /// 有效状态名称
        private string validStateName;

        /// 巡查员
        private string inspectEmpName;

        private int qualityLevel;

        private string url;

        public string Url
        {
            get { return url; }
            set { url = value; }
        }
        /// <summary>
        /// 监控数据的质量等级
        /// </summary>
        public int QualityLevel
        {
            get { return qualityLevel; }
            set { qualityLevel = value; }
        }
        /// <summary>
        /// 备注
        /// </summary>
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
        /// <summary>
        /// 创建时间
        /// </summary>
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
        /// <summary>
        /// 创建者姓名
        /// </summary>
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
        /// <summary>
        /// 修改时间
        /// </summary>
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
        /// <summary>
        /// 修改者姓名
        /// </summary>
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
        /// <summary>
        /// 质量监控数据ID
        /// </summary>
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
        /// <summary>
        /// 质量监控数据编码
        /// </summary>
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

        
        /// <summary>
        /// 经度
        /// </summary>
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
        /// <summary>
        /// 纬度
        /// </summary>
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
        /// <summary>
        /// 质量监控类型
        /// </summary>
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
        /// <summary>
        /// 负责人姓名
        /// </summary>
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
        /// <summary>
        /// 应急处理责任人姓名
        /// </summary>
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
        /// <summary>
        /// 有效状态名称
        /// </summary>
        public string ValidStateName
        {
            get
            {
                return validStateName;
            }
            set
            {
                this.validStateName = value;
            }
        }
        /// <summary>
        /// 巡检员姓名
        /// </summary>
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
        /// <summary>
        /// 组织ID
        /// </summary>
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
        /// <summary>
        /// 监控点ID
        /// </summary>
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