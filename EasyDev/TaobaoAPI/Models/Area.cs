using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// Area Data Structure.
    /// </summary>
    [Serializable]
    public class Area : Model
    {
        [XmlElement("id")]
        public long Id { get; set; }

        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("parent_id")]
        public long ParentId { get; set; }

        [XmlElement("type")]
        public long Type { get; set; }

        [XmlElement("zip")]
        public string Zip { get; set; }
    }
}
