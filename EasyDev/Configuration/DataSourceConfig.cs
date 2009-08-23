using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Xml;

namespace EasyDev.Configuration
{
    /// <summary>
    /// ����Դ���ö���
    /// @Author:��ط
    /// </summary>
    public class DataSourceConfig : ConfigurationBase,ICustomConfiguration
    {
        /// <summary>
        /// ���췽������ʼ������������
        /// </summary>
        public DataSourceConfig()
        {
            this.NameAttribute = "name";
            this.ValueAttribute = "connectionString";
        }
    }
}
