using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Configuration;
using log4net;

namespace EasyDev.Configuration
{
    /// <summary>
    /// 自定义Web.Config配置节的公共抽象基类
    /// @Author:蒲胤
    /// </summary>
    public abstract class ConfigurationBase : IConfigurationSectionHandler
    {
        private static ILog log = LogManager.GetLogger(typeof(ConfigurationBase));
        
        private XmlNode node = null;

        private string nameAttribute = "name";

        public string NameAttribute
        {
            get { return nameAttribute; }
            set { nameAttribute = value; }
        }

        private string valueAttribute = "value";

        public string ValueAttribute
        {
            get { return valueAttribute; }
            set { valueAttribute = value; }
        }

        /// <summary>
        /// 某组件相关配置的根
        /// </summary>
        public XmlNode ConfigNode
        {
            get { return this.node; }
        }
        
        /// <summary>
        /// 根据名称属性查找配置信息
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string this[string name]
        {
            get
            {
                string result = "";
                if (this.node != null)
                {
                    XmlNodeList config = this.node.ChildNodes;
                    for (int i = 0; i < config.Count; i++)
                    {
                        XmlNode configItem = config[i];
                        if (configItem.Attributes[this.nameAttribute].Value.Equals(name))
                        {
                            result = configItem.Attributes[this.valueAttribute].Value;
                            break;
                        }
                    }
                }
                return result;
            }
        }

        /// <summary>
        /// 根据位置查找配置信息
        /// </summary>
        /// <param name="i"></param>
        /// <returns></returns>
        public string this[int i]
        {
            get
            {
                if (this.node != null)
                {
                    XmlNodeList config = this.node.ChildNodes;
                    return config[i].Attributes[this.valueAttribute].Value;
                }
                else
                {
                    return string.Empty;
                }
            }
        }
        
        /// <summary>
        /// 根据属性名取值
        /// </summary>
        /// <param name="attributeName">属性名称</param>
        /// <returns></returns>
        public string GetAttributeValue(string attributeName)
        {            
            try
            {
                if (this.node.ChildNodes != null 
                    && this.node.ChildNodes.Count > 0 
                    && this.node.ChildNodes[0].Attributes[attributeName] != null)
                {
                    return this.node.ChildNodes[0].Attributes[attributeName].Value;
                }
                else
                {
                    throw new System.Exception("_attribute_is_not_exist");
                }
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        #region IConfigurationSectionHandler 成员

        public object Create(object parent, object configContext, XmlNode section)
        {
            this.node = section;
            return this;
        }

        #endregion
    }
}
