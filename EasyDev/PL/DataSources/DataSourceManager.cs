using System;
using System.Collections.Generic;
using System.Text;
using EasyDev.Configuration;
using System.Data.Common;
using System.Xml;
using System.Collections;

namespace EasyDev.PL
{
    public class DataSourceManager
    {
        private static PersistenceConfigManager configMgr = null;

        #region IDBProviderManager 成员

        /// <summary>
        /// 根据配置信息产生数据库提供程序
        /// </summary>
        /// <returns></returns>
        public static DataSourceObject CreateDefaultDataSource()
        {
            configMgr = PersistenceConfigManager.GetInstance();
            DataSourceObject provider = new DataSourceObject(DbProviderFactories.GetFactory(configMgr.GetDefaultDataSource().ProviderType));
            provider.ProviderName =configMgr.DefaultDataSource;
            return provider;
        }
        
        /// <summary>
        /// 根据配置信息中的数据源名称产生会话对象的方法
        /// </summary>
        /// <param name="name">provider的名称</param>
        /// <returns></returns>
        public static DataSourceObject CreateDataSource(string name)
        {
            string type = "";
            configMgr = PersistenceConfigManager.GetInstance();
            foreach (IDataSource providerItem in configMgr.DataSources.Values)
            {
                if (providerItem.Name == name)
                {
                    type = providerItem.ProviderType;
                }
            }
            DataSourceObject provider = new DataSourceObject(DbProviderFactories.GetFactory(type));
            provider.ProviderName = name;
            return provider;
        }

        #endregion
    }
}
