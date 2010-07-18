using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// ItemVerticalProp Data Structure.
    /// </summary>
    [Serializable]
    public class ItemVerticalProp : Model
    {
        [XmlElement("id")]
        public long Id { get; set; }

        [XmlElement("is_required")]
        public bool IsRequired { get; set; }

        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("type")]
        public int Type { get; set; }
    }
}
