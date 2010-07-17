using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Net;
using System.Web;
using EasyDev.TaobaoAPI;

namespace EasyDev.TaobaoAPI
{
    /// <summary>
    /// 文件元数据。构造方法：
    /// 本地文件：new FileItem(new FileInfo("C:/temp.jpg"));
    /// 字节流：new FileItem("abc.jpg", bytes);
    /// </summary>
    public class FileItem
    {
        private string fileName;
        private string mimeType;
        private byte[] content;
        private FileInfo fileInfo;

        /// <summary>
        /// 基于本地文件的构造器。
        /// </summary>
        /// <param name="fileInfo">本地文件</param>
        public FileItem(FileInfo fileInfo)
        {
            if (fileInfo == null || !fileInfo.Exists)
            {
                throw new ArgumentException("FileInfo is null or not exists!");
            }
            this.fileInfo = fileInfo;
        }

        /// <summary>
        /// 基于文件名、字节流和媒体类型的构造器。
        /// </summary>
        /// <param name="fileName">文件名称或文件全路径（本地不一定要存在这个文件，仅仅是为了在服务端保存文件时有一个文件名）</param>
        /// <param name="content">文件字节流</param>
        public FileItem(string fileName, byte[] content)
        {
            if (string.IsNullOrEmpty(fileName)) throw new ArgumentNullException("fileName");
            if (content == null || content.Length == 0) throw new ArgumentNullException("content");
            this.fileName = fileName;
            this.content = content;
        }

        /// <summary>
        /// 基于URL地址文件构造器
        /// </summary>
        /// <param name="url">图片URL（ 含http:// ）</param>
        public FileItem(string url)
        {
            string path = "";
            string fileName = "";
            int tmp1 = 0;
            int tmp2 = 0;
            if (url.Contains("http://"))
            {
                //获取路径
                tmp1 = url.IndexOf("http://") + 7;
                tmp1 = url.IndexOf("/", tmp1) + 1;
                tmp2 = url.LastIndexOf("/") + 1;
                path = url.Substring(tmp1, tmp2 - tmp1);

                //获取文件名
                fileName = url.Substring(tmp2);
            }
            else
            {
                throw new ArgumentException("url format error!");
                //return; //URL不合法
            }

            System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path));

            if (!System.IO.File.Exists(HttpContext.Current.Server.MapPath(path) + fileName))
            {
                System.Net.WebClient wc = new System.Net.WebClient();
                wc.DownloadFile(url, HttpContext.Current.Server.MapPath(path) + fileName);// + "/" + preStr + imgurlAry[i].Substring(imgurlAry[i].LastIndexOf("/") + 1
            }

            FileInfo fileInfo = new FileInfo(HttpContext.Current.Server.MapPath(path) + fileName);
            if (fileInfo == null || !fileInfo.Exists)
            {
                throw new ArgumentException("FileInfo is null or not exists!");
            }
            this.fileInfo = fileInfo;
        }


        /// <summary>
        /// 根据URL获取文件名
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string GetUrlFileName(string url)
        {
            string path = "";
            string fileName = "";
            int tmp1 = 0;
            int tmp2 = 0;
            if (url.Contains("http://"))
            {
                //获取路径
                tmp1 = url.IndexOf("http://") + 7;
                tmp1 = url.IndexOf("/", tmp1) + 1;
                tmp2 = url.LastIndexOf("/") + 1;
                path = url.Substring(tmp1, tmp2 - tmp1);

                //获取文件名
                fileName = url.Substring(tmp2);
            }
            return fileName;
        }

        /// <summary>
        /// 下载文件保存到本地
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        protected bool DownloadImage(string url)
        {
            string path = "";
            string fileName = "";
            int tmp1 = 0;
            int tmp2 = 0;
            if (url.Contains("http://"))
            {
                //获取路径
                tmp1 = url.IndexOf("http://") + 7;
                tmp1 = url.IndexOf("/", tmp1) + 1;
                tmp2 = url.LastIndexOf("/") + 1;
                path = url.Substring(tmp1, tmp2 - tmp1);

                //获取文件名
                fileName = url.Substring(tmp2);
            }
            else
            {
                return false; //URL不合法
            }

            System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath(path));
            //-------------------------------创建成功 (" + path + ") [" + fileName + "]-------------------------------<br />");
            if (!System.IO.File.Exists(HttpContext.Current.Server.MapPath(path) + fileName))
            {
                System.Net.WebClient wc = new System.Net.WebClient();
                wc.DownloadFile(url, HttpContext.Current.Server.MapPath(path) + fileName);// + "/" + preStr + imgurlAry[i].Substring(imgurlAry[i].LastIndexOf("/") + 1
            }
            return true;
        }

        /// <summary>
        /// 基于文件名、字节流和媒体类型的构造器。
        /// </summary>
        /// <param name="fileName">文件名</param>
        /// <param name="content">文件字节流</param>
        /// <param name="mimeType">媒体类型</param>
        public FileItem(String fileName, byte[] content, String mimeType)
            : this(fileName, content)
        {
            if (string.IsNullOrEmpty(mimeType))
            {
                throw new ArgumentNullException("mimeType");
            }

            this.mimeType = mimeType;
        }

        public string GetFileName()
        {
            if (this.fileName == null && this.fileInfo != null && this.fileInfo.Exists)
            {
                this.fileName = this.fileInfo.FullName;
            }
            return this.fileName;
        }

        public string GetMimeType()
        {
            if (this.mimeType == null)
            {
                this.mimeType = MediaAnalyzer.GetMimeType(GetContent());
            }
            return this.mimeType;
        }

        public byte[] GetContent()
        {
            if (this.content == null && this.fileInfo != null && this.fileInfo.Exists)
            {
                using (Stream fileStream = this.fileInfo.OpenRead())
                {
                    this.content = new byte[fileStream.Length];
                    fileStream.Read(content, 0, content.Length);
                }
            }

            return this.content;
        }
    }

}
