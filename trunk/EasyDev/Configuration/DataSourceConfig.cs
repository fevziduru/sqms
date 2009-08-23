using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Xml;

namespace EasyDev.Configuration
{
    /// <summary>
    /// 数据源配置对象
    /// @Author:蒲胤
    /// </summary>
    public class DataSourceConfig : ConfigurationBase,ICustomConfiguration
    {
        /// <summary>
        /// 构造方法，初始化配置属性名
        /// </summary>
        public DataSourceConfig()
        {
            this.NameAttribute = "name";
            this.ValueAttribute = "connectionString";
        }
    }
}
