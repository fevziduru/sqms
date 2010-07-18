using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// PicUrl Data Structure.
    /// </summary>
    [Serializable]
    public class PicUrl : Model
    {
        [XmlElement("url")]
        public string Url { get; set; }
    }
}
