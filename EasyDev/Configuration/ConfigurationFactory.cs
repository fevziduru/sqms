using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace EasyDev.Configuration
{
    /// <summary>
    /// 创建配置对象工厂类
    /// @Author:蒲胤
    /// </summary>
    public class ConfigurationFactory
    {
        /// <summary>
        /// 实例化数据源配置对象
        /// @Author:蒲胤
        /// </summary>
        /// <returns></returns>
        /// <example>
        /// DataSourceConfig cfg = ConfigurationFactory.GetDataSourceConfig();
        /// </example>
        public static DataSourceConfig GetDataSourceConfig()
        {
            return (DataSourceConfig)ConfigurationManager.GetSection(ConfigurationConstant.DATASOURCE_SECTION_NAME);
        }
        
        /// <summary>
        /// 实例化单点登录数据提供配置对象
        /// @Author:蒲胤
        /// </summary>
        /// <returns></returns>
        /// <example>
        /// SSODataProviderConfig cfg = ConfigurationFactory.GetSSODataProviderConfig();
        /// </example>
        public static SSODataProviderConfig GetSSODataProviderConfig()
        {
            return (SSODataProviderConfig) ConfigurationManager.GetSection(ConfigurationConstant.SSODATAPROVIDER_SECTION_NAME);
        }
        
        /// <summary>
        /// 取得持久化组件配置对象
        /// @Author:蒲胤
        /// </summary>
        /// <returns></returns>
        /// <example>
        /// PersistenceConfig cfg = ConfigurationFactory.GetPersistenceConfig();
        /// </example>
        public static PersistenceConfig GetPersistenceConfig()
        {
            return (PersistenceConfig) ConfigurationManager.GetSection(ConfigurationConstant.PERSISTENCE_SECTION_NAME);
        }

        /// <summary>
        /// 实例化异常策略配置对象
        /// @Author:蒲胤
        /// </summary>
        /// <returns></returns>
        /// <example>
        /// ExceptionPolicyConfig cfg = ConfigurationFactory.GetExceptionPolicyConfig();
        /// </example>
        public static ExceptionPolicyConfig GetExceptionPolicyConfig()
        {
            return (ExceptionPolicyConfig)ConfigurationManager.GetSection(ConfigurationConstant.EXCEPTION_SECTION_NAME);
        }

        [Obsolete("被禁用的方法",true)]
        public static ICustomConfiguration GetConfiguration(string sectionPath)
        {
            return (ICustomConfiguration)ConfigurationManager.GetSection(sectionPath);
        }

        /// <summary>
        /// 实例化通过配置对象
        /// @Author:蒲胤
        /// </summary>
        /// <param name="sectionPath">配置节路径</param>
        /// <returns></returns>
        /// <example>
        /// GenericConfiguration cfg = ConfigurationFactory.GetConfiguration("sectiongroupname/sectionname");
        /// </example>
        public static GenericConfiguration GetGenericConfiguration(string sectionPath)
        {
            return (GenericConfiguration)ConfigurationManager.GetSection(sectionPath);
        }
    }
}
