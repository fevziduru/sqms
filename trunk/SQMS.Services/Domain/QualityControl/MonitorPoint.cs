// File:    MonitorPoint.cs
// Author:  fishtrees
// Created: 2009年8月8日 10:47:20
// Purpose: Definition of Class MonitorPoint

using System;
namespace SQMS.Services.Domain.QualityControl
{
    /// <summary>
    /// 监控点
    /// </summary>
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
        public string MPType
        {
            get;
            set;
        }

    }
    /// <summary>
    /// 监控点类型
    /// </summary>
    [Flags]
    public enum MonitorPointType
    {
        Normal = 1,
        Event = 2,
        Resource = 4,
        TripleConfuse = 8,
        DeadSpace = 16,
        TripleRoadCross = 32,
        Accident = 64,
        TrashEntrance = 128,
        All = 256
    }
    /// <summary>
    /// 监控点类型字符串
    /// </summary>
    public class MonitorPointTypeString
    {
        /// <summary>
        /// 路段上的普通监控点
        /// </summary>
        internal static readonly string Normal = "monitorpoint";
        /// <summary>
        /// 资源点（加水加油维修）
        /// </summary>
        internal static readonly string Resource = "resourcepoint";
        /// <summary>
        /// 三乱点
        /// </summary>
        internal static readonly string TripleConfuse = "tripleconfusepoint";
        /// <summary>
        /// 死角
        /// </summary>
        internal static readonly string DeadSpace = "deadspacepoint";
        /// <summary>
        /// 三叉口
        /// </summary>
        internal static readonly string TripleRoadCross = "tripleroadpoint";
        /// <summary>
        /// 事故现场
        /// </summary>
        internal static readonly string Accident = "accident";
        /// <summary>
        /// 渣口
        /// </summary>
        internal static readonly string TrashEntrance = "trashentrance";
        /// <summary>
        /// 应急事件监控点
        /// </summary>
        internal static readonly string Event = "eventpoint";
        /// <summary>
        /// 字符串转换成监控点类型枚举值
        /// </summary>
        /// <param name="typeStr">逗号分隔的监控点类型字符串</param>
        /// <returns></returns>
        public static MonitorPointType ConvertToEnum(string typeStr)
        {
            if (String.IsNullOrEmpty(typeStr))
            {
                return MonitorPointType.All;
            }
            string[] arr = typeStr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            MonitorPointType type = MonitorPointType.All;
            foreach (string str in arr)
            {
                if (str.Equals(Normal))
                {
                    type = type | MonitorPointType.Normal;
                }
                else if (str.Equals(Resource))
                {
                    type = type | MonitorPointType.Resource;
                }
                else if (str.Equals(TripleConfuse))
                {
                    type = type | MonitorPointType.TripleConfuse;
                }
                else if (str.Equals(DeadSpace))
                {
                    type = type | MonitorPointType.DeadSpace;
                }
                else if (str.Equals(TripleRoadCross))
                {
                    type = type | MonitorPointType.TripleRoadCross;
                }
                else if (str.Equals(TrashEntrance))
                {
                    type = type | MonitorPointType.TrashEntrance;
                }
                else if (str.Equals(Event))
                {
                    type = type | MonitorPointType.Event;
                }
                else if (str.Equals(Accident))
                {
                    type = type | MonitorPointType.Accident;
                }
            }
            return type;
        }

        public static string FromEnum(MonitorPointType mpType,MonitorPointEnumFormater formater)
        {
            string str = "";
            if ((mpType & MonitorPointType.Accident) == MonitorPointType.Accident)
            {
                str += "," + Accident;
            }
            if ((mpType & MonitorPointType.DeadSpace) == MonitorPointType.DeadSpace)
            {
                str += "," + DeadSpace;
            }
            if ((mpType & MonitorPointType.Event) == MonitorPointType.Event)
            {
                str += "," + Event;
            }
            if ((mpType & MonitorPointType.Normal) == MonitorPointType.Normal)
            {
                str += "," + Normal;
            }
            if ((mpType & MonitorPointType.Resource) == MonitorPointType.Resource)
            {
                str += "," + Resource;
            }
            if ((mpType & MonitorPointType.TrashEntrance) == MonitorPointType.TrashEntrance)
            {
                str += "," + TrashEntrance;
            }
            if ((mpType & MonitorPointType.TripleConfuse) == MonitorPointType.TripleConfuse)
            {
                str += "," + TripleConfuse;
            }
            if ((mpType & MonitorPointType.TripleRoadCross) == MonitorPointType.TripleRoadCross)
            {
                str += "," + TripleRoadCross;
            }
            if (str.StartsWith(","))
            {
                str = str.Remove(0, 1);
            }
            if (null != formater)
            {
                str = formater(str);
            }
            return str;

        }
    }
    /// <summary>
    /// 格式化监控点类型枚举值转换成字符串
    /// </summary>
    /// <param name="str">逗号分隔的字符串</param>
    /// <returns></returns>
    public delegate string MonitorPointEnumFormater(string str);
}