using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI.Models
{
    [Serializable]
    public class User : Model
    {
        [Field(FieldName="user_id")]        
        public decimal UserId { get; set; }

        [Field(FieldName = "uid")]
        public string Uid { get; set; }

        [Field(FieldName = "nick")]
        public string Nick { get; set; }

        [Field(FieldName = "sex")]
        public string Sex { get; set; }

        [Field(FieldName = "buyer_credit")]
        public UserCredit BuyerCredit { get; set; }

        [Field(FieldName = "seller_credit")]
        public UserCredit Seller_Credit { get; set; }

        [Field(FieldName = "location")]
        public Location Location { get; set; }

        [Field(FieldName = "created")]
        public DateTime Created { get; set; }

        [Field(FieldName = "last_visit")]
        public DateTime LastVisit { get; set; }

        [Field(FieldName = "birthday")]
        [Privacy(IsPrivacy = true)]
        public DateTime Birthday { get; set; }

        [Field(FieldName = "type")]
        public string Type { get; set; }

        [Field(FieldName = "has_more_pic")]
        [Privacy(IsPrivacy = true)]
        public bool HasMorePictures { get; set; }

        [Field(FieldName = "item_img_num")]
        [Privacy(IsPrivacy = true)]
        public decimal ItemImageNumber { get; set; }

        [Field(FieldName = "item_img_size")]
        [Privacy(IsPrivacy = true)]
        public decimal ItemImageSize { get; set; }

        [Field(FieldName = "prop_img_num")]
        [Privacy(IsPrivacy = true)]
        public decimal PropertiesOfImageNumber { get; set; }

        [Field(FieldName = "prop_img_size")]
        [Privacy(IsPrivacy = true)]
        public decimal PropertiesOfImageSize { get; set; }

        [Field(FieldName = "auto_report")]
        [Privacy(IsPrivacy = true)]
        public string AutoRepost { get; set; }

        [Field(FieldName = "promoted_type")]
        [Privacy(IsPrivacy = true)]
        public string PromotedType { get; set; }

        [Field(FieldName = "status")]
        [Privacy(IsPrivacy = true)]
        public string Status { get; set; }

        [Field(FieldName = "alipay_bind")]
        [Privacy(IsPrivacy = true)]
        public string AlipayBind { get; set; }

        [Field(FieldName = "consumer_protection")]
        [Privacy(IsPrivacy = true)]
        public bool ConsumerProtection { get; set; }

        [Field(FieldName = "alipay_account")]
        [Privacy(IsPrivacy = true)]
        public string AlipayAccount { get; set; }

        [Field(FieldName = "alipay_no")]
        [Privacy(IsPrivacy = true)]
        public string AlipayNo { get; set; }

        [Field(FieldName = "magazine_subscribe")]
        [Privacy(IsPrivacy = true)]
        public bool MagazineSubscribe { get; set; }

        [Field(FieldName = "vertical_market")]
        [Privacy(IsPrivacy = true)]
        public string VertialMarket { get; set; }
    }
}
