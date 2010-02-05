using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using SQMS.Services;
using System.IO;
using EasyDev.BL;
using EasyDev.Util;

namespace SQMS.IntegrityServices
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class MobileInterfaces : System.Web.Services.WebService
    {
        private EmployeeService employeeService = null;
        private UpdateQualityDataService srv = null;
        private EquipmentService equipmentService = null;
        private WorkStatusService workstatusService = null;
        private NativeServiceManager ServiceManager = null;

        public MobileInterfaces()
        {
            if (ServiceManager == null)
            {
                ServiceManager = ServiceManagerFactory.CreateNativeServiceManager();
            }

            employeeService = ServiceManager.CreateService<EmployeeService>();
            srv = ServiceManager.CreateService<UpdateQualityDataService>();
            equipmentService = ServiceManager.CreateService<EquipmentService>();
            workstatusService = ServiceManager.CreateService<WorkStatusService>();
        }


        /// <summary>
        /// 质量数据存储规则：
        /// 根目录下存放以设备名称命名的文件夹表示其中的内容由这个设备上传。
        /// 每个设备文件夹中的文件的命名规则为“_+设备名+_+时间戳+_+<seqno>.扩展名”,seqno是序列号，用于标识分段视频，
        /// 多段分段视频文件名的前面部分应该相同。注：多段视频不用单独放到一个文件夹中
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public bool UpdateQualityData()
        {
            bool isSuccess = true;
            try
            {
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
                                Concat<string>(Directory.GetFiles(dir[i], "_*.mpg")).ToArray<string>().
                                Concat<string>(Directory.GetFiles(dir[i], "_*.3gp")).ToArray<string>();


                        if (files.Length > 0)
                        {
                            DataRow drQuality = srv.Create();
                            DataRow drVideo = srv.VideoService.Create();
                            DataRow drMonitorVideo = srv.mvService.Create();

                            #region 处理质量数据文件
                            FileInfo fi = new FileInfo(files[0]);
                            //选择一组文件(相同文件名，不同类型的文件，即由同一设备一次上传的不同类型的文件)
                            IEnumerable<string> qd = files.Select<string, string>(
                                p =>
                                {
                                    string tmp = p.Substring(p.LastIndexOf("\\") + 1);
                                    if (tmp.Split(new char[] { '.' })[0].Contains(fi.Name.Substring(0, fi.Name.Length - fi.Extension.Length)))
                                        return tmp;
                                    else
                                        return "";
                                });

                            IDictionary<string, string> empinfo = srv.FindUserInfoByEquID(currEquid);
                            drQuality["QMID"] = srv.GetNextSequenceID();
                            drQuality["ORGANIZATIONID"] = drQuality["WORKUNIT"] = empinfo["OrganizationID"];
                            drQuality["EMERGENCYPERSON"] = drQuality["CHECKPERSON"] = drQuality["CHARGEPERSON"] = empinfo["EmployeeID"];
                            drQuality["CREATEDBY"] = drQuality["MODIFIEDBY"] = empinfo["PassportID"];
                            drQuality["Status"] = "_normal";
                            IDictionary<string, string> filecontent = null;


                            //文本文件
                            //string filename = qd.First<string>(p => p.EndsWith(".txt"));
                            qd.ToList<string>().FindAll(p => p.EndsWith(".txt")).ForEach((file) =>
                            {
                                if (file != null && file.Length > 0)
                                {
                                    //去掉文件名前的下划线以标识当前文件已经被更新
                                    if (File.Exists(phyDirBase + "\\" + currEquid + "\\" + file))
                                    {
                                        File.Move(phyDirBase + "\\" + currEquid + "\\" + file, phyDirBase + "\\" + currEquid + "\\" + file.Substring(1));
                                    }

                                    filecontent = ExtractInfoFromText(phyDirBase + "\\" + currEquid + "\\" + file.Substring(1));
                                    drQuality["LONGITUDE"] = filecontent["LNG"];
                                    drQuality["LATITUDE"] = filecontent["LAT"];
                                    drQuality["CREATED"] = drQuality["MODIFIED"] = Convert.ToDateTime(filecontent["TIME"]);
                                    drQuality["ISVOID"] = "N";
                                    drQuality["MPID"] = filecontent["MPID"];
                                    drQuality["TYPE"] = filecontent["TYPE"];
                                }
                                //QualityData.Tables[0].Rows.Add(
                            });


                            //图片文件
                            qd.ToList<string>().FindAll(p => p.EndsWith(".jpg")).ForEach((file) =>
                            {
                                if (file != null && file.Length > 0)
                                {
                                    //去掉文件名前的下划线以标识当前文件已经被更新
                                    if (File.Exists(phyDirBase + "\\" + currEquid + "\\" + file))
                                    {
                                        File.Move(phyDirBase + "\\" + currEquid + "\\" + file, phyDirBase + "\\" + currEquid + "\\" + file.Substring(1));
                                    }

                                    if (drQuality["MATERIAL"].ToString().Length == 0)
                                    {
                                        drQuality["MATERIAL"] = phyDirBase + "\\" + currEquid + "\\" + file.Substring(1);
                                    }
                                    else
                                    {
                                        drQuality["MATERIAL"] = drQuality["MATERIAL"].ToString() + "|" + phyDirBase + "\\" + currEquid + "\\" + file.Substring(1);
                                    }
                                }
                            });


                            //视频文件
                            qd.ToList<string>().FindAll(p => p.EndsWith(".mpg") || p.EndsWith(".3gp")).ForEach((file) =>
                            {
                                if (file != null && file.Length > 0)
                                {
                                    //去掉文件名前的下划线以标识当前文件已经被更新
                                    if (File.Exists(phyDirBase + "\\" + currEquid + "\\" + file))
                                    {
                                        File.Move(phyDirBase + "\\" + currEquid + "\\" + file, phyDirBase + "\\" + currEquid + "\\" + file.Substring(1));
                                    }
                                    drVideo["VIDEOID"] = srv.VideoService.GetNextSequenceID();

                                    drVideo["CREATED"] = drVideo["MODIFIED"] = drQuality["CREATED"];
                                    drVideo["VIDEONAME"] = drVideo["VIDEONAME"].ToString() + "|" + file.Substring(1);
                                    drVideo["CREATEDBY"] = drVideo["MODIFIEDBY"] = drQuality["CREATEDBY"];
                                    drVideo["VIDEOURL"] = drVideo["VIDEOURL"].ToString() + "|" + (phyDirBase + "\\" + currEquid + "\\" + file.Substring(1));
                                    drVideo["ORGANIZATIONID"] = empinfo["OrganizationID"];
                                    drVideo["TRACE"] = filecontent["TRACE"];

                                    //处理监控点与视频的映射
                                    drMonitorVideo["MPID"] = filecontent["MPID"];
                                    drMonitorVideo["VIDEOID"] = drVideo["VIDEOID"];
                                }

                            });

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
            catch (Exception)
            {
                isSuccess = false;
            }

            return isSuccess;
        }

        private IDictionary<string, string> ExtractInfoFromText(string fileName)
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

        /// <summary>
        /// 员工登录系统接口，通过判断员工与设备的绑定关系决定登录成功与否
        /// </summary>
        /// <param name="empId">员工号</param>
        /// <param name="equId">设备编号</param>
        /// <returns></returns>
        [WebMethod]
        public bool MobileLogin(string empId, string equId)
        {
            try
            {
                //return true;
                return this.employeeService.LoadByCondition(string.Format("EMPID='{0}' AND EQUID='{1}'", empId, equId)).Tables[0].Rows.Count > 0;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 注册新设备
        /// 刚购买的设备，在使用之前要注册到系统中并且和具体的员工绑定后才可使用
        /// </summary>
        /// <param name="equIdentify">设备编号，包括产品号和IMEI编号</param>
        /// <param name="equname"></param>
        /// <param name="orgid"></param>
        /// <param name="suiteid"></param>
        /// <returns></returns>
        [WebMethod]
        public bool RegisterEquipment(string equIdentify, string equname, string orgid, string suiteid)
        {
            bool isSuccess = true;
            try
            {
                DataSet dsEqu = equipmentService.LoadByKey("", true);
                DataRow drEqu = dsEqu.FirstRow(equipmentService.BOName);
                drEqu.SetField<string>("EQUID", equipmentService.GetNextSequenceID());
                drEqu.SetField<string>("EQUCODE", equIdentify.Split(new char[] { '-' })[0]);
                drEqu.SetField<string>("EQUNAME", equname);
                drEqu.SetField<string>("IDENTIFY", equIdentify);
                drEqu.SetField<string>("ORGANIZATIONID", orgid);
                drEqu.SetField<string>("SUITEID", suiteid);
                drEqu.SetField<DateTime>("CREATED", DateTime.Now);
                drEqu.SetField<DateTime>("MODIFIED", DateTime.Now);
                drEqu.SetField<string>("ISVOID", "N");

                equipmentService.Save(drEqu.Table.DataSet);
            }
            catch (Exception)
            {
                isSuccess = false;
            }

            return isSuccess;
        }

        /// <summary>
        /// 更新设备工作状态
        /// </summary>
        /// <param name="equIdentity">设备编号</param>
        /// <param name="empid">职员编号</param>
        /// <param name="isStartup">True-开启；False-关闭</param>
        /// <returns></returns>
        [WebMethod]
        public bool UpdateWorkStatus(string equIdentity, string empid, bool isStartup)
        {
            bool isSuccess = true;
            try
            {
                DataSet ds = workstatusService.LoadByKey("", true);
                DataRow dr = ds.FirstRow(workstatusService.BOName);
                dr.SetField<string>("STATUSID", workstatusService.GetNextSequenceID());
                dr.SetField<string>("EQUIDENTITY", equIdentity);
                dr.SetField<string>("EMPID", empid);
                if (isStartup)
                {
                    dr.SetField<string>("ACTION", "STARTUP");
                    dr.SetField<DateTime>("STARTUPTIME", DateTime.Now);
                }
                else
                {
                    dr.SetField<string>("ACTION", "SHUTDOWN");
                    dr.SetField<DateTime>("SHUTDOWNTIME", DateTime.Now);
                }
                dr.SetField<DateTime>("CREATED", DateTime.Now);
                dr.SetField<DateTime>("MODIFIED", DateTime.Now);

                workstatusService.Save(ds);
            }
            catch (Exception)
            {
                isSuccess = false;
            }

            return isSuccess;
        }
    }
}
