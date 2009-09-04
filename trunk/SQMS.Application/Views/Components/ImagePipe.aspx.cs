using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using System.Net;

namespace SQMS.Application.Views.Components
{
        public partial class ImagePipe : System.Web.UI.Page
        {
                protected void Page_Load(object sender, EventArgs e)
                {
                        WebClient c = new WebClient();
                        //获取原图像
                        string strSelectedFile = Request.QueryString["filename"].ToString();
                        Bitmap b = null;
                        if (strSelectedFile.IndexOf("http://") >= 0)
                        {
                                MemoryStream imageStream = null;
                                using (imageStream = new MemoryStream())
                                {
                                        byte[] imagedata = c.DownloadData(strSelectedFile);
                                        imageStream.Write(imagedata, 0, imagedata.Length);
                                        b = new Bitmap(imageStream);
                                }
                        }
                        else
                        {
                                b = new Bitmap(strSelectedFile);
                        }
                        
                        int towidth = b.Width * 130 / b.Height;
                        int toheight = 95;

                        Bitmap bmp = new System.Drawing.Bitmap(towidth, toheight);
                        Graphics g = Graphics.FromImage(bmp);

                        //设置高质量插值法
                        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

                        //设置高质量,低速度呈现平滑程度
                        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

                        //清空画布并以透明背景色填充
                        g.Clear(Color.Transparent);

                        //生成新图像并输出到浏览器
                        g.DrawImage(b, new Rectangle(0, 0, towidth, toheight), new Rectangle(0, 0, b.Width, b.Height), GraphicsUnit.Pixel);

                        bmp.Save(Response.OutputStream, b.RawFormat);
                        //释放内存
                        b.Dispose();
                        bmp.Dispose();
                        g.Dispose();
                }
        }
}
