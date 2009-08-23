using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Xml;

namespace EasyDev.Configuration
{
    /// <summary>
    /// 异常策略配置对象
    /// @Author:蒲胤
    /// </summary>
    public class ExceptionPolicyConfig : ConfigurationBase,ICustomConfiguration
    {
        public ExceptionPolicyConfig()
        {
            this.NameAttribute = "name";
            this.ValueAttribute = "dir";
        }
    }
}
