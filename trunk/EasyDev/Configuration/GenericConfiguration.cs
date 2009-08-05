using System;
using System.Collections.Generic;
using System.Text;

namespace EasyDev.Configuration
{
    /// <summary>
    /// 通用配置对象
    /// @Author:蒲胤
    /// </summary>
    public class GenericConfiguration : ConfigurationBase,ICustomConfiguration
    {
        public GenericConfiguration()
        {
            this.NameAttribute = "key";
            this.ValueAttribute = "value";
        }
    }
}
