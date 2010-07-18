using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// TaobaokeShop Data Structure.
    /// </summary>
    [Serializable]
    public class TaobaokeShop : Model
    {
        [XmlElement("click_url")]
        public string ClickUrl { get; set; }

        [XmlElement("commission_rate")]
        public string CommissionRate { get; set; }

        [XmlElement("shop_title")]
        public string ShopTitle { get; set; }

        [XmlElement("user_id")]
        public string UserId { get; set; }
    }
}
