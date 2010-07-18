using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// Feature Data Structure.
    /// </summary>
    [Serializable]
    public class Feature : Model
    {
        [XmlElement("attr_key")]
        public string AttrKey { get; set; }

        [XmlElement("attr_value")]
        public string AttrValue { get; set; }
    }
}
