using System;
using System.Collections.Generic;
using System.Text;

namespace EasyDev.Configuration
{
    /// <summary>
    /// ͨ�����ö���
    /// @Author:��ط
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
