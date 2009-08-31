using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using SQMS.Services;
using EasyDev.Util;

namespace SQMS.Application.Views.Demo
{
        public partial class UpdateQualityData : SQMSPage<UpdateQualityDataService>
        {
                private UpdateQualityDataService srv = null;
                protected void Page_Load(object sender, EventArgs e)
                {
                        Process();
                }

                private void Process()
                {
                        srv = Service as UpdateQualityDataService;

                        string phyDirBase = AppDomain.CurrentDomain.BaseDirectory + @"QualityData";

                        //取得所有以设备命名的目录
                        string[] dir = Directory.GetDirectories(phyDirBase);

                        DataSet QualityData = srv.LoadByKey("", false);
                        DataSet VideoData = srv.VideoService.LoadByKey("", false);
                        DataSet mvData = srv.mvService.LoadByKeys(null, false);
                        
                        //遍历每一个设备目录
                        for (int i = 0; i < dir.Length; i++)
                        {
                                string[] files = null;
                                string currEquid = dir[i].Substring(dir[i].LastIndexOf("\\") + 1);
                                do
                                {
                                        //查找目录中的带下划线的质量数据文件
                                        files = Directory.GetFiles(dir[i], "_*.txt").
                                                Concat<string>(Directory.GetFiles(dir[i], "_*.jpg")).ToArray<string>().
                                                Concat<string>(Directory.GetFiles(dir[i], "_*.flv")).ToArray<string>();

                                        if (files.Length > 0)
                                        {
                                                DataRow drQuality = srv.Create();
                                                DataRow drVideo = srv.VideoService.Create();
                                                DataRow drMonitorVideo = srv.mvService.Create(); 

                                                #region 处理质量数据文件
                                                FileInfo fi = new FileInfo(files[0]);
                                                IEnumerable<string> qd = files.Select<string, string>(
                                                    p =>
                                                    {
                                                            string tmp = p.Substring(p.LastIndexOf("\\") + 1);
                                                            if (tmp.Split(new char[] { '.' })[0].Equals(fi.Name.Substring(0, fi.Name.Length - fi.Extension.Length)))
                                                                    return tmp;
                                                            else
                                                                    return "";
                                                    });

                                                IDictionary<string, string> empinfo = srv.FindUserInfoByEquID(currEquid);
                                                drQuality["QMID"] = srv.GetNextSequenceID();
                                                drQuality["ORGANIZATIONID"] = drQuality["WORKUNIT"] = empinfo["OrganizationID"];
                                                drQuality["EMERGENCYPERSON"] = drQuality["CHECKPERSON"] = drQuality["CHARGEPERSON"] = empinfo["EmployeeID"];
                                                drQuality["CREATEDBY"] = drQuality["MODIFIEDBY"] = empinfo["PassportID"];
                                                IDictionary<string, string> filecontent = null;
                                                //文本文件
                                                string filename = qd.First<string>(p => p.EndsWith(".txt"));
                                                if (filename != null && filename.Length > 0)
                                                {
                                                        //去掉文件名前的下划线以标识当前文件已经被更新
                                                        if (File.Exists(phyDirBase + "\\" + currEquid + "\\" + filename))
                                                        {
                                                                File.Move(phyDirBase + "\\" + currEquid + "\\" + filename, phyDirBase + "\\" + currEquid + "\\" + filename.Substring(1));
                                                        }

                                                        filecontent = ExtractInfoFromText(phyDirBase + "\\" + currEquid + "\\" + filename.Substring(1));
                                                        drQuality["LONGITUDE"] = filecontent["LNG"];
                                                        drQuality["LATITUDE"] = filecontent["LAT"];
                                                        drQuality["CREATED"] = drQuality["MODIFIED"] = Convert.ToDateTime(filecontent["TIME"]);
                                                        drQuality["ISVOID"] = "N";
                                                        drQuality["MPID"] = filecontent["MPID"];
                                                        drQuality["TYPE"] = filecontent["TYPE"];
                                                }

                                                //图片文件
                                                filename = qd.First<string>(p => p.EndsWith(".jpg"));
                                                if (filename != null && filename.Length > 0)
                                                {
                                                        //去掉文件名前的下划线以标识当前文件已经被更新
                                                        if (File.Exists(phyDirBase + "\\" + currEquid + "\\" + filename))
                                                        {
                                                                File.Move(phyDirBase + "\\" + currEquid + "\\" + filename, phyDirBase + "\\" + currEquid + "\\" + filename.Substring(1));
                                                        }

                                                        drQuality["MATERIAL"] = phyDirBase + "\\" + currEquid + "\\" + filename.Substring(1);
                                                }

                                                //视频文件
                                                filename = qd.First<string>(p => p.EndsWith(".flv"));
                                                if (filename != null && filename.Length > 0)
                                                {
                                                        //去掉文件名前的下划线以标识当前文件已经被更新
                                                        if (File.Exists(phyDirBase + "\\" + currEquid + "\\" + filename))
                                                        {
                                                                File.Move(phyDirBase + "\\" + currEquid + "\\" + filename, phyDirBase + "\\" + currEquid + "\\" + filename.Substring(1));
                                                        }
                                                        drVideo["VIDEOID"] = srv.VideoService.GetNextSequenceID();
                                                        drVideo["CREATED"] = drVideo["MODIFIED"] = drQuality["CREATED"];
                                                        drVideo["VIDEONAME"] = filename;
                                                        drVideo["CREATEDBY"] = drVideo["MODIFIEDBY"] = drQuality["CREATEDBY"];
                                                        drVideo["VIDEOURL"] = phyDirBase + "\\" + currEquid + "\\" + filename.Substring(1);
                                                        drVideo["ORGANIZATIONID"] = empinfo["OrganizationID"];
                                                        drVideo["TRACE"] = filecontent["TRACE"];

                                                        //处理监控点与视频的映射
                                                        drMonitorVideo["MPID"] = filecontent["MPID"];
                                                        drMonitorVideo["VIDEOID"] = drVideo["VIDEOID"];
                                                }
                                                #endregion
                                        }
                                } while (files.Length > 0);      
                        }

                        #region 批量保存
                        srv.Save(QualityData);
                        if (VideoData.Tables[0].Rows.Count > 0)
                        {
                                srv.VideoService.Save(VideoData);
                                srv.mvService.Save(mvData);
                        } 
                        #endregion
                }

                private IDictionary<string,string> ExtractInfoFromText(string fileName)
                {
                        IDictionary<string, string> item = new Dictionary<string, string>();
                        using (FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read))
                        {
                                using (StreamReader reader = new StreamReader(fs))
                                {
                                        string text = reader.ReadToEnd();
                                        string[] infos = text.Split(new char[] { '#' });
                                        if (infos.Length > 0)
                                        {
                                                item.Add("LNG", infos[0]);
                                                item.Add("LAT", infos[1]);
                                                item.Add("TIME", Convert.ToDateTime(infos[2]).ToString());
                                                item.Add("MPID", infos[3]);
                                                item.Add("TYPE", infos[4]);
                                                item.Add("TRACE", infos[5]);
                                        }
                                }
                        }

                        return item;
                }
        }
}
