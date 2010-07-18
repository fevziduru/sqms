using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// Tadget Data Structure.
    /// </summary>
    [Serializable]
    public class Tadget : Model
    {
        [XmlElement("app_key")]
        public string AppKey { get; set; }

        [XmlElement("app_secret")]
        public string AppSecret { get; set; }
    }
}
