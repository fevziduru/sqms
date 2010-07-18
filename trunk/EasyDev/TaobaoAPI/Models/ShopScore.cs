using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// ShopScore Data Structure.
    /// </summary>
    [Serializable]
    public class ShopScore : Model
    {
        [XmlElement("delivery_score")]
        public string DeliveryScore { get; set; }

        [XmlElement("item_score")]
        public string ItemScore { get; set; }

        [XmlElement("service_score")]
        public string ServiceScore { get; set; }
    }
}
