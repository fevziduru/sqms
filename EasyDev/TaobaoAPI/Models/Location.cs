using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI.Models
{
    /// <summary>
    /// Strong typed data model: Location
    /// </summary>
    [Serializable]
    public class Location : Model
    {
        /// <summary>
        /// Zip Code of the location
        /// </summary>
        [Field(FieldName = "zip")]
        [Privacy(IsPrivacy=true)]
        public string Zip { get; set; }

        /// <summary>
        /// Address of the location
        /// </summary>
        [Field(FieldName = "address")]
        [Privacy(IsPrivacy = true)]
        public string Address { get; set; }

        /// <summary>
        /// The city which the location belongs to 
        /// </summary>
        [Field(FieldName = "city")]
        public string City { get; set; }

        /// <summary>
        /// The state which the location at
        /// </summary>
        [Field(FieldName = "state")]
        public string State { get; set; }

        /// <summary>
        /// The country which the location at
        /// </summary>
        [Field(FieldName = "country")]
        public string Country { get; set; }

        /// <summary>
        /// The district which the location belongs to
        /// </summary>
        [Field(FieldName = "district")]
        public string District { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public Location() { }
    }
}
