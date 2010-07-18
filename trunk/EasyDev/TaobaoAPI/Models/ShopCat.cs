using System;
using System.Xml.Serialization;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// ShopCat Data Structure.
    /// </summary>
    [Serializable]
    public class ShopCat : Model
    {
        [XmlElement("cid")]
        public long Cid { get; set; }

        [XmlElement("is_parent")]
        public bool IsParent { get; set; }

        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("parent_cid")]
        public long ParentCid { get; set; }
    }
}
