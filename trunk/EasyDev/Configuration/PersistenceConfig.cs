using System.Configuration;
using System.Xml;
using System.Collections;
using EasyDev.Util;
using EasyDev.Configuration;

namespace EasyDev.Configuration
{
    public class PersistenceConfig : ConfigurationBase, ICustomConfiguration
    {
        /// <summary>
        /// 取得存放XML架构文件的目录
        /// </summary>
        /// <returns></returns>
        public string GetSchemeDirectory()
        {
            string dir = string.Empty;
            try
            {
                if (this.ConfigNode != null && this.ConfigNode.Attributes["schemeDirectory"] != null)
                {
                    dir = ConvertUtil.ConvertToString(this.ConfigNode.Attributes["schemeDirectory"].Value);
                }
            }
            catch (ConfigException e)
            {
                throw e;
            }
            return dir;
        }
        
        /// <summary>
        /// 取得默认提供程序的类型
        /// </summary>
        /// <returns></returns>
        public string GetDefaultProviderType()
        {
            string type = string.Empty;
            try
            {
                XmlNode node = this.GetDefaultProvider();
                
                if (node.Attributes["providerType"] != null)
                {
                    type = node.Attributes["providerType"].Value;
                }
                else
                {
                    throw new ConfigException("_missing_provider_type");
                }
            }
            catch (ConfigException e)
            {
                throw e;
            }

            return type;
        }

        

        /// <summary>
        /// 取得默认提供程序对应的数据库连接串
        /// </summary>
        /// <returns></returns>
        public string GetDefaultConnectionString()
        {
            string connStr = string.Empty;
            try
            {
                XmlNode node = this.GetDefaultProvider();

                if (node.Attributes["connectionString"] != null)
                {
                    connStr = node.Attributes["connectionString"].Value;
                }
                else
                {
                    throw new ConfigException("_missing_connectionstring");
                }
            }
            catch (ConfigException e)
            {
                throw e;
            }

            return connStr;
        }
        
        public string GetDefaultProviderName()
        {
            string name = "";
            try
            {
                XmlNode node = this.GetDefaultProvider();
                if (node != null)
                {
                    name = node.Attributes["name"].Value;
                }
                else
                {
                    throw new ConfigException("_no_default_provider");
                }
            }
            catch (ConfigException e)
            {
                throw e;
            }

            return name;
        }
        
        /// <summary>
        /// 取得默认数据源
        /// </summary>
        /// <returns></returns>
        private XmlNode GetDefaultProvider()
        {
            XmlNode defaultProviderNode = null;
            XmlNode providersParentNode = null;
            try
            {
                if (this.ConfigNode.HasChildNodes)
                {
                    providersParentNode = this.ConfigNode.ChildNodes[0];
                }
                else
                {
                    throw new ConfigException("_missing_providers_node");
                }
                
                string defaultProviderName = string.Empty;
                if (providersParentNode != null && providersParentNode.Attributes["default"] != null)
                {
                    defaultProviderName = providersParentNode.Attributes["default"].Value;
                }
                else
                {
                    throw new ConfigException("_missing_default_attribute_in_providers_node");
                }
                
                if (providersParentNode.HasChildNodes == false)
                {
                    throw new ConfigException("_there_was_not_any_provider_was_set");
                }
                
                if (string.IsNullOrEmpty(defaultProviderName))
                {
                    defaultProviderNode = providersParentNode.ChildNodes[0];
                }
                else
                {
                    XmlNodeList providers = providersParentNode.ChildNodes; 

                    IEnumerator itr_providers = providers.GetEnumerator();
                    while (itr_providers.MoveNext())
                    {
                        XmlNode node = (XmlNode)itr_providers.Current;
                        if (node.Attributes["name"].Value.Equals(defaultProviderName))
                        {
                            defaultProviderNode = node.CloneNode(true);
                            break;
                        }
                    }
                }
            }
            catch (ConfigException e)
            {
                throw e;
            }

            return defaultProviderNode;
        }
        
        /// <summary>
        /// 取得providers结点的子结点集
        /// </summary>
        /// <returns></returns>
        public XmlNodeList GetProviderConfigList()
        {
            XmlNodeList list = null;
            try
            {
                if (this.ConfigNode != null && this.ConfigNode.HasChildNodes)
                {
                    if (this.ConfigNode.ChildNodes[0].HasChildNodes)
                    {
                        list = this.ConfigNode.ChildNodes[0].ChildNodes;
                    }
                    else
                    {
                        throw new ConfigException("_no_provider_config_list");
                    }
                }
                else
                {
                    throw new ConfigException("_no_providers_node");
                }
            }
            catch (ConfigException e)
            {
                throw e;
            }

            return list;
        }
    }
}
