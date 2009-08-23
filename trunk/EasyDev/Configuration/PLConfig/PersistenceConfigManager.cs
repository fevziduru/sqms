using System;
using System.Collections.Generic;
using System.Xml;
using System.Collections;
using System.Web;
using WebCaching = System.Web.Caching;

namespace EasyDev.Configuration
{
    public class PersistenceConfigManager
    {
        private static readonly string DEFAULT_SCHEMA_DIR = "DEFAULT_SCHEMA_DIR";

        private static readonly string EDFK_DATASOURCE_CONFIG = "EDFK_DATASOURCE_CONFIG";

        private static readonly string DEFAULT_DATASOURCE = "DEFAULT_DATASOURCE";

        /// <summary>
        /// 默认数据提供程序
        /// </summary>
        private string defaultDataSource = string.Empty;

        /// <summary>
        /// 默认数据架构目录
        /// </summary>
        private string defaultSchemaDir = string.Empty;

        private WebCaching.Cache DataSourceCache { get; set; }

        /// <summary>
        /// 配置文件位置
        /// </summary>
        private string configPath = string.Empty;

        /// <summary>
        /// 数据提供程序集合
        /// </summary>
        private IDictionary<string, IDataSource> datasources = null;

        private static readonly object lockHelper = new object();

        private static PersistenceConfigManager _instance = null;

        /// <summary>
        /// 默认数据提供程序
        /// </summary>
        public string DefaultDataSource
        {
            get { return this.defaultDataSource; }
            set { this.defaultDataSource = value; }
        }

        /// <summary>
        /// 默认数据架构目录
        /// </summary>
        public string SchemaDir
        {
            get { return this.defaultSchemaDir; }
            set { this.defaultSchemaDir = value; }
        }

        /// <summary>
        /// 数据提供程序集合
        /// </summary>
        public IDictionary<string, IDataSource> DataSources
        {
            get { return this.datasources; }
        }

        private PersistenceConfigManager()
        {
            this.configPath = AppDomain.CurrentDomain.BaseDirectory + @"/Config/EasyDev.Persistence.Config";
            this.datasources = new Dictionary<string, IDataSource>();
            this.Initialize();
        }

        public static PersistenceConfigManager GetInstance()
        {
            if (_instance == null)
            {
                lock (lockHelper)
                {
                    if (_instance == null)
                    {
                        _instance = new PersistenceConfigManager();
                    }
                }
            }

            return _instance;
        }

        /// <summary>
        /// 初始化数据提供程序配置
        /// </summary>
        private void Initialize()
        {
            //if (DataSourceCache == null)
            //{
            //    DataSourceCache = HttpRuntime.Cache;
            //}

            lock (HttpRuntime.Cache)
            {
                this.datasources = HttpRuntime.Cache.Get(EDFK_DATASOURCE_CONFIG) as Dictionary<string, IDataSource>;

                if (this.datasources == null)
                {
                    InitDatasourcesConfig();                    
                }
            }            
        }

        private void InitDatasourcesConfig()
        {
            try
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(this.configPath);
                XmlNode rootNode = doc.SelectSingleNode("EasyDev.Persistence.Config/DataSources");
                if (rootNode != null)
                {
                    if (rootNode.Attributes["SchemaDir"] != null)
                    {
                        this.defaultSchemaDir = AppDomain.CurrentDomain.BaseDirectory +
                            @"\" + rootNode.Attributes["SchemaDir"].Value;

                        //缓存架构文件目录
                        HttpRuntime.Cache.Insert(DEFAULT_SCHEMA_DIR, this.defaultSchemaDir);
                    }

                    if (rootNode.Attributes["Default"] != null)
                    {
                        this.defaultDataSource = rootNode.Attributes["Default"].Value;

                        //缓存默认数据源配置
                        HttpRuntime.Cache.Insert(DEFAULT_DATASOURCE, this.defaultDataSource);
                    }

                    XmlNodeList providerNodes = rootNode.SelectNodes("DataSource");
                    if (providerNodes != null && providerNodes.Count > 0)
                    {
                        IEnumerator itr_Nodes = providerNodes.GetEnumerator();
                        while (itr_Nodes.MoveNext())
                        {
                            IDataSource newProvider = new DataSource();
                            XmlNode currentNode = (XmlNode)itr_Nodes.Current;
                            string name = currentNode.SelectSingleNode("Name").InnerText;
                            if (name.Length == 0)
                            {
                                throw new System.Exception("_datasource_must_have_a_name");
                            }
                            else
                            {
                                //初始化每一个数据提供程序配置
                                newProvider.Name = name;
                                newProvider.ProviderType = currentNode.SelectSingleNode("ProviderType").InnerText;
                                newProvider.ConnectionString = currentNode.SelectSingleNode("ConnectionString").InnerText;

                                KeyValuePair<string, IDataSource> item = new KeyValuePair<string, IDataSource>(name, newProvider);
                                if (this.datasources == null)
                                {
                                    this.datasources = new Dictionary<string, IDataSource>();
                                }

                                if (this.datasources.Keys.Contains(item.Key) == false)
                                {
                                    this.datasources.Add(item);
                                }
                            }
                        }
                    }

                    HttpRuntime.Cache.Insert(EDFK_DATASOURCE_CONFIG, this.datasources);
                }
                else
                {
                    throw new System.Exception("_persistence_config_lack_of_root");
                }
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 取得默认数据提供程序信息
        /// </summary>
        /// <returns></returns>
        public IDataSource GetDefaultDataSource()
        {
            lock (HttpRuntime.Cache)
            {
                object defaultDs = HttpRuntime.Cache.Get(DEFAULT_DATASOURCE);
                IDictionary<string, IDataSource> ds =
                    HttpRuntime.Cache.Get(EDFK_DATASOURCE_CONFIG) as Dictionary<string, IDataSource>;

                if (defaultDs == null || ds == null)
                {
                    InitDatasourcesConfig();
                }
            }

            return this.datasources[this.defaultDataSource];
        }

        /// <summary>
        /// 根据名称取得数据提供程序信息
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public IDataSource GetDataSourceByName(string name)
        {
            lock (HttpRuntime.Cache)
            {
                IDictionary<string, IDataSource> ds =
                        HttpRuntime.Cache.Get(EDFK_DATASOURCE_CONFIG) as Dictionary<string, IDataSource>;

                if (ds == null)
                {
                    InitDatasourcesConfig();
                }
            }

            return this.datasources[name];
        }
    }
}
