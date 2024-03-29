using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// Suite Data Structure.
    /// </summary>
    [Serializable]
    public class Suite : Model
    {
        [XmlElement("end_date")]
        public string EndDate { get; set; }

        [XmlElement("id")]
        public long Id { get; set; }

        [XmlElement("nick")]
        public string Nick { get; set; }

        [XmlElement("start_date")]
        public string StartDate { get; set; }

        [XmlElement("suite_name")]
        public string SuiteName { get; set; }
    }
}
