using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// TaobaokeReport Data Structure.
    /// </summary>
    [Serializable]
    public class TaobaokeReport : Model
    {
        [XmlArray("taobaoke_report_members")]
        [XmlArrayItem("taobaoke_report_member")]
        public List<TaobaokeReportMember> TaobaokeReportMembers { get; set; }
    }
}
