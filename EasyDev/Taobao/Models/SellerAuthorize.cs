using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace EasyDev.Taobao.Models
{
    /// <summary>
    /// SellerAuthorize Data Structure.
    /// </summary>
    [Serializable]
    public class SellerAuthorize : Model
    {
        [XmlArray("brands")]
        [XmlArrayItem("brand")]
        public List<Brand> Brands { get; set; }

        [XmlArray("item_cats")]
        [XmlArrayItem("item_cat")]
        public List<ItemCat> ItemCats { get; set; }
    }
}
