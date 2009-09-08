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
                        try
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

                                //int towidth = b.Width * 130 / b.Height;
                                //int toheight = 95;
                                int towidth = 250;
                                int toheight = 180;
                                int oh = b.Height;
                                int ow = b.Width;
                                int x = 0;
                                int y = 0;

                                if ((double)b.Width / (double)b.Height > (double)towidth / (double)toheight)
                                {
                                        oh = b.Height;
                                        ow = b.Height * towidth / toheight;
                                        y = 0;
                                        x = (b.Width - ow) / 2;
                                }
                                else
                                {
                                        ow = b.Width;
                                        oh = b.Width * 180 / towidth;
                                        x = 0;
                                        y = (b.Height - oh) / 2;
                                }


                                Bitmap bmp = new System.Drawing.Bitmap(towidth, toheight);
                                Graphics g = Graphics.FromImage(bmp);

                                //设置高质量插值法
                                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

                                //设置高质量,低速度呈现平滑程度
                                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

                                //清空画布并以透明背景色填充
                                g.Clear(Color.White);

                                //生成新图像并输出到浏览器
                                //g.DrawImage(b, new Rectangle(0, 0, towidth, toheight), new Rectangle(towidth, toheight, b.Width, b.Height), GraphicsUnit.Pixel);
                                g.DrawImage(b, new Rectangle(0, 0, towidth, toheight), new Rectangle(0, 0, b.Width, b.Height), GraphicsUnit.Pixel);

                                bmp.Save(Response.OutputStream, b.RawFormat);
                                //释放内存
                                b.Dispose();
                                bmp.Dispose();
                                g.Dispose();
                        }
                        catch (Exception ex)
                        {
                                throw ex;
                        }
                }
        }
}
