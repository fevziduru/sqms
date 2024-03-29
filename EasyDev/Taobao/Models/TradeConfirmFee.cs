using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// TradeConfirmFee Data Structure.
    /// </summary>
    [Serializable]
    public class TradeConfirmFee : Model
    {
        [XmlElement("confirm_fee")]
        public string ConfirmFee { get; set; }

        [XmlElement("confirm_post_fee")]
        public string ConfirmPostFee { get; set; }

        [XmlElement("is_last_order")]
        public bool IsLastOrder { get; set; }
    }
}
