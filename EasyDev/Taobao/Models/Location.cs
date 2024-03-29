using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// Location Data Structure.
    /// </summary>
    [Serializable]
    public class Location : Model
    {
        [XmlElement("address")]
        public string Address { get; set; }

        [XmlElement("city")]
        public string City { get; set; }

        [XmlElement("country")]
        public string Country { get; set; }

        [XmlElement("district")]
        public string District { get; set; }

        [XmlElement("state")]
        public string State { get; set; }

        [XmlElement("zip")]
        public string Zip { get; set; }
    }
}
