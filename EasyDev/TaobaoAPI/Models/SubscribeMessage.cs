using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// SubscribeMessage Data Structure.
    /// </summary>
    [Serializable]
    public class SubscribeMessage : Model
    {
        [XmlElement("app_key")]
        public string AppKey { get; set; }

        [XmlElement("end_date")]
        public string EndDate { get; set; }

        [XmlElement("modified")]
        public string Modified { get; set; }

        [XmlElement("start_date")]
        public string StartDate { get; set; }

        [XmlArray("subscriptions")]
        [XmlArrayItem("subscription")]
        public List<Subscription> Subscriptions { get; set; }
    }
}
