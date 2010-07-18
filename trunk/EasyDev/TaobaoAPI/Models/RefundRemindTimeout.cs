using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// RefundRemindTimeout Data Structure.
    /// </summary>
    [Serializable]
    public class RefundRemindTimeout : Model
    {
        [XmlElement("exist_timeout")]
        public bool ExistTimeout { get; set; }

        [XmlElement("remind_type")]
        public int RemindType { get; set; }

        [XmlElement("timeout")]
        public string Timeout { get; set; }
    }
}
