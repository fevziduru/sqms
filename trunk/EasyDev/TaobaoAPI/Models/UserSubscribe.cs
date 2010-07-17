using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI.Models
{
    [Serializable]
    public class UserSubscribe : Model
    {
        [Field(FieldName="status")]
        [Privacy(IsPrivacy=true)]
        public string Status { get; set; }

        [Field(FieldName = "version")]
        public string Version { get; set; }

        [Field(FieldName = "start_date")]
        public DateTime StartDate { get; set; }

        [Field(FieldName = "end_date")]
        public DateTime EndDate { get; set; }

        public UserSubscribe() { }
    }
}
