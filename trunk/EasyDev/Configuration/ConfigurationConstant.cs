using System;
using System.Collections.Generic;
using System.Text;

namespace EasyDev.Configuration
{
    internal sealed class ConfigurationConstant
    {
        /// <summary>
        /// 数据源配置结点
        /// </summary>
        public static readonly string DATASOURCE_SECTION_NAME = "easydev.config/datasources";

        /// <summary>
        /// 异常处理配置结点
        /// </summary>
        public static readonly string EXCEPTION_SECTION_NAME = "easydev.config/exceptionlogfiles";

        /// <summary>
        /// 单点登录数据提供程序配置节点
        /// </summary>
        public static readonly string SSODATAPROVIDER_SECTION_NAME = "easydev.config/ssodataproviders";

        /// <summary>
        /// 持久层配置结点
        /// </summary>
        public static readonly string PERSISTENCE_SECTION_NAME = "easydev.config/persistence";
    }
}
