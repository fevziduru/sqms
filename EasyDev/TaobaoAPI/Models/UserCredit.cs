using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI.Models
{
    [Serializable]
    public class UserCredit : Model
    {
        [Field(FieldName="level")]
        public decimal Level { get; set; }

        [Field(FieldName = "score")]
        public decimal Score { get; set; }

        [Field(FieldName = "total_num")]
        public decimal TotalNum { get; set; }

        [Field(FieldName = "good_num")]
        public decimal GoodNum { get; set; }

        public UserCredit() { }
    }
}
