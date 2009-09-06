using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SQMS.Application.Views.Components
{
    public partial class MapVideo : System.Web.UI.UserControl
    {

        private string externVideoUrl = "";
        /// <summary>
        /// 在SourceByVideoId为false时，指定外部视频URL给播放器
        /// </summary>
        public string ExternVideoUrl
        {
            get { return externVideoUrl; }
            set { externVideoUrl = value; }
        }
        private bool autoPlay = false;
        /// <summary>
        /// 是否自动播放
        /// </summary>
        public bool AutoPlay
        {
            get { return autoPlay; }
            set { autoPlay = value; }
        }
        private bool sourceByVideoId = false;
        /// <summary>
        /// 是否通过VideoId获取视频数据
        /// </summary>
        public bool SourceByVideoId
        {
            get { return sourceByVideoId; }
            set { sourceByVideoId = value; }
        }
        private string videoId = "";
        /// <summary>
        /// 在SourceByVideoId为true时，指定系统内部的视频ID给播放器
        /// </summary>
        public string VideoId
        {
            get { return videoId; }
            set { videoId = value; }
        }
        private string videoName = "";
        private bool drawTrace = false;
        /// <summary>
        /// 在SourceByVideoId为true时，设置是否在播放时绘制视频拍摄轨迹
        /// </summary>
        public bool DrawTrace
        {
            get { return drawTrace; }
            set { drawTrace = value; }
        }
        private int videoWidth = 320;
        /// <summary>
        /// 视频宽度
        /// </summary>
        public int VideoWidth
        {
            get { return videoWidth; }
            set { videoWidth = value; }
        }
        private int videoHeight = 240;
        /// <summary>
        /// 视频高度
        /// </summary>
        public int VideoHeight
        {
            get { return videoHeight; }
            set { videoHeight = value; }
        }
        private int width = 360;
        /// <summary>
        /// MapVideo控件最终呈现宽度
        /// </summary>
        public int Width
        {
            get { return width; }
            set { width = value; }
        }
        private int height = 280;
        /// <summary>
        /// MapVideo控件最终呈现高度
        /// </summary>
        public int Height
        {
            get { return height; }
            set { height = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}