using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// PostageMode Data Structure.
    /// </summary>
    [Serializable]
    public class PostageMode : Model
    {
        [XmlElement("dests")]
        public string Dests { get; set; }

        [XmlElement("id")]
        public long Id { get; set; }

        [XmlElement("increase")]
        public string Increase { get; set; }

        [XmlElement("postage_id")]
        public long PostageId { get; set; }

        [XmlElement("price")]
        public string Price { get; set; }

        [XmlElement("type")]
        public string Type { get; set; }
    }
}
