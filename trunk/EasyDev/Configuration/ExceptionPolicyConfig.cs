using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Xml;

namespace EasyDev.Configuration
{
    /// <summary>
    /// �쳣�������ö���
    /// @Author:��ط
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
