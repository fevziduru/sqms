using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// ItemImg Data Structure.
    /// </summary>
    [Serializable]
    public class ItemImg : Model
    {
        [XmlElement("created")]
        public string Created { get; set; }

        [XmlElement("id")]
        public long Id { get; set; }

        [XmlElement("position")]
        public int Position { get; set; }

        [XmlElement("url")]
        public string Url { get; set; }
    }
}
