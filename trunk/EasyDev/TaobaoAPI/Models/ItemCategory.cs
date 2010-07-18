using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// ItemCategory Data Structure.
    /// </summary>
    [Serializable]
    public class ItemCategory : Model
    {
        [XmlElement("category_id")]
        public long CategoryId { get; set; }

        [XmlElement("count")]
        public int Count { get; set; }
    }
}
