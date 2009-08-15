using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.QualityControl
{
    public class Video
    {
        private string videoId;

        public string VideoId
        {
            get { return videoId; }
            set { videoId = value; }
        }
        private string videoName;

        public string VideoName
        {
            get { return videoName; }
            set { videoName = value; }
        }
        private string videoUrl;

        public string VideoUrl
        {
            get { return videoUrl; }
            set { videoUrl = value; }
        }
        private string memo;

        public string Memo
        {
            get { return memo; }
            set { memo = value; }
        }
        private LatLng[] trace;

        public LatLng[] Trace
        {
            get { return trace; }
            set { trace = value; }
        }
        private DateTime created;

        public DateTime Created
        {
            get { return created; }
            set { created = value; }
        }
        private string createdBy;

        public string CreatedBy
        {
            get { return createdBy; }
            set { createdBy = value; }
        }
        private DateTime modified;

        public DateTime Modified
        {
            get { return modified; }
            set { modified = value; }
        }
        private string modifiedBy;

        public string ModifiedBy
        {
            get { return modifiedBy; }
            set { modifiedBy = value; }
        }
    }
}
