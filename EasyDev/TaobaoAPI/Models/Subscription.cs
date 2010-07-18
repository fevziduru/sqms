using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// Subscription Data Structure.
    /// </summary>
    [Serializable]
    public class Subscription : Model
    {
        [XmlElement("status")]
        public string Status { get; set; }

        [XmlElement("topic")]
        public string Topic { get; set; }
    }
}
