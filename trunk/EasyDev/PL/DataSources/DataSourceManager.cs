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

        #region IDBProviderManager ��Ա

        /// <summary>
        /// ����������Ϣ�������ݿ��ṩ����
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
        /// ����������Ϣ�е�����Դ���Ʋ����Ự����ķ���
        /// </summary>
        /// <param name="name">provider������</param>
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
