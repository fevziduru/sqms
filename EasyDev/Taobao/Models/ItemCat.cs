using System;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// ItemCat Data Structure.
    /// </summary>
    [Serializable]
    [XmlRoot("item_cats")]
    public class ItemCat : Model
    {
        [XmlElement("cid")]
        public long Cid { get; set; }

        [XmlElement("is_parent")]
        public bool IsParent { get; set; }

        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("parent_cid")]
        public long ParentCid { get; set; }

        [XmlElement("sort_order")]
        public int SortOrder { get; set; }

        [XmlElement("status")]
        public string Status { get; set; }
    }
}
