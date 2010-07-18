using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.Taobao
{
    public class PrivacyAttribute : Attribute
    {
        public bool IsPrivacy { get; set; }

        public PrivacyAttribute() 
        {
            IsPrivacy = false;
        }

        public PrivacyAttribute(bool privacy) { IsPrivacy = privacy; }
    }
}
