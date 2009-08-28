using System;
using System.Collections.Generic;
using System.Xml;
using System.Collections;
using System.Web;
using WebCaching = System.Web.Caching;
using EasyDev.PL;
using System.Linq;
using System.Xml.Linq;

namespace EasyDev.Configuration
{
        /// <summary>
        /// 持久层配置管理器
        /// </summary>
        public class PersistenceConfigManager
        {
                private static readonly string DEFAULT_SCHEMA_DIR = "DEFAULT_SCHEMA_DIR";

                private static readonly string EasyDev_DATASOURCE_CONFIG = "EasyDev_DATASOURCE_CONFIG";

                private static readonly string DEFAULT_DATASOURCE = "DEFAULT_DATASOURCE";

                /// <summary>
                /// 默认数据提供程序
                /// </summary>
                private string defaultDataSource = string.Empty;

                /// <summary>
                /// 默认数据架构目录
                /// </summary>
                private string defaultSchemaDir = string.Empty;

                /// <summary>
                /// 数据源缓存
                /// </summary>
                private WebCaching.Cache DataSourceCache { get; set; }

                /// <summary>
                /// 配置文件位置
                /// </summary>
                private string configPath = string.Empty;

                /// <summary>
                /// 数据提供程序集合
                /// </summary>
                private IDictionary<string, IDataSource> datasources = null;

                /// <summary>
                /// 锁对象
                /// </summary>
                private static readonly object lockHelper = new object();

                /// <summary>
                /// 持久配置对象管理器实例
                /// </summary>
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

                /// <summary>
                /// 创建持久层对象实例
                /// </summary>
                /// <returns></returns>
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
                        lock (HttpRuntime.Cache)
                        {
                                this.datasources = HttpRuntime.Cache.Get(EasyDev_DATASOURCE_CONFIG) as Dictionary<string, IDataSource>;

                                if (this.datasources == null)
                                {
                                        InitDatasourcesConfig();
                                }
                        }
                }

                /// <summary>
                /// 初始化数据源
                /// TODO: 待测方法
                /// </summary>
                private void InitDataSource()
                {
                        IEnumerable<XElement> nodes = 
                                from p in XElement.Load("EasyDev.Persistence.Config.xml").Elements("EasyDev.Persistence.Config/DataSources") select p;

                        if (nodes != null && nodes.Count<XElement>() > 0)
                        {
                                XElement rootNode = nodes.First<XElement>();

                                if (rootNode.Attribute("SchemaDir") != null)
                                {
                                        this.defaultSchemaDir = AppDomain.CurrentDomain.BaseDirectory + @"\" + rootNode.Attribute("SchemaDir").Value;
                                        HttpRuntime.Cache.Insert(DEFAULT_SCHEMA_DIR, this.defaultSchemaDir);
                                }

                                if (rootNode.Attribute("Default") != null)
                                {
                                        this.defaultDataSource = rootNode.Attribute("Default").Value;
                                        HttpRuntime.Cache.Insert(DEFAULT_DATASOURCE, this.defaultDataSource);
                                }

                                IEnumerable<XElement> datasources = rootNode.Elements("DataSource");
                                foreach (XElement item in datasources)
                                {
                                        IDataSource newDatasource = new DataSource();
                                        XElement nameNode = item.Elements().First<XElement>(p => p.Name.LocalName.Equals("Name"));
                                        XElement providerNode = item.Elements().First<XElement>(p => p.Name.LocalName.Equals("ProviderType"));
                                        XElement connstrNode = item.Elements().First<XElement>(p => p.Name.LocalName.Equals("ConnectionString"));

                                        if (nameNode.Value.Length == 0)
                                        {
                                                throw new System.Exception("_datasource_must_have_a_name");
                                        }

                                        newDatasource.Name = nameNode.Value;
                                        newDatasource.ProviderType = providerNode.Value;
                                        newDatasource.ConnectionString = connstrNode.Value;

                                        KeyValuePair<string, IDataSource> ds = new KeyValuePair<string, IDataSource>(nameNode.Value, newDatasource);
                                        if (this.datasources == null)
                                        {
                                                this.datasources = new Dictionary<string, IDataSource>();
                                        }

                                        if (this.datasources.Keys.Contains(ds.Key) == false)
                                        {
                                                this.datasources.Add(ds);
                                        }
                                }

                                HttpRuntime.Cache.Insert(EasyDev_DATASOURCE_CONFIG, this.datasources);
                        }
                        else
                        {
                                throw new PersistenceException("_persistence_config_lack_of_root");
                        }
                }

                [Obsolete("此方法已经过时，待InitDataSource方法测试通过后，此方法作废")]
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

                                        HttpRuntime.Cache.Insert(EasyDev_DATASOURCE_CONFIG, this.datasources);
                                }
                                else
                                {
                                        throw new PersistenceException("_persistence_config_lack_of_root");
                                }
                        }
                        catch (PersistenceException e)
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
                                    HttpRuntime.Cache.Get(EasyDev_DATASOURCE_CONFIG) as Dictionary<string, IDataSource>;

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
                                        HttpRuntime.Cache.Get(EasyDev_DATASOURCE_CONFIG) as Dictionary<string, IDataSource>;

                                if (ds == null)
                                {
                                        InitDatasourcesConfig();
                                }
                        }

                        return this.datasources[name];
                }
        }
}