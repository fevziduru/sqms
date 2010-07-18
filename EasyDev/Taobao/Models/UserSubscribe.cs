using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    [Serializable]
    public class UserSubscribe : Model
    {
        [XmlElement("status")]
        public string Status { get; set; }

        [XmlElement("start_date")]
        public DateTime StartDate { get; set; }

        [XmlElement("end_date")]
        public DateTime EndDate { get; set; }

        [XmlElement("version")]
        public string Version { get; set; }
    }
}
