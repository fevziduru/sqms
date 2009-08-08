using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.QualityControl
{
    public struct LatLng
    {
        private decimal lat;
        /// <summary>
        /// 纬度
        /// </summary>
        public decimal Lat
        {
            get { return lat; }
            set
            {
                if (Math.Abs(value) > 90)
                {
                    throw new ArgumentException("纬度必须在-90到90之间");
                }
                lat = value;
            }
        }

        private decimal lng;
        /// <summary>
        /// 经度
        /// </summary>
        public decimal Lng
        {
            get { return lng; }
            set
            {
                if (Math.Abs(lng) > 180)
                {
                    throw new ArgumentException("经度必须在-180到180之间");
                }
                lng = value;
            }
        }

        public LatLng(decimal plat, decimal plng)
            : this()
        {
            this.Lat = plat;
            this.Lng = plng;
        }
    }
}
