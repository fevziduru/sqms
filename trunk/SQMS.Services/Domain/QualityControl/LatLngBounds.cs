using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.QualityControl
{
    /// <summary>
    /// 地图可见区域
    /// </summary>
    public struct LatLngBounds
    {
        private LatLng southWest;

        public LatLng SouthWest
        {
            get { return southWest; }
            set { southWest = value; }
        }

        private LatLng northEast;

        public LatLng NorthEast
        {
            get { return northEast; }
            set { northEast = value; }
        }

        public LatLngBounds(LatLng southWest, LatLng northEast)
            : this()
        {
            this.SouthWest = southWest;
            this.NorthEast = northEast;
        }
    }
}
