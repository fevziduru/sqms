using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// TaobaokeItemDetail Data Structure.
    /// </summary>
    [Serializable]
    public class TaobaokeItemDetail : Model
    {
        [XmlElement("click_url")]
        public string ClickUrl { get; set; }

        [XmlElement("item")]
        public Item Item { get; set; }

        [XmlElement("seller_credit_score")]
        public long SellerCreditScore { get; set; }

        [XmlElement("shop_click_url")]
        public string ShopClickUrl { get; set; }
    }
}
