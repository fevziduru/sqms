using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using EasyDev.Util;

namespace SQMS.Services
{
        public class UpdateQualityDataService : GenericService
        {
                public VideoService VideoService { get; private set; }
                public MonitorVideoService mvService { get; private set; }

                protected override void Initialize()
                {
                        BOName = "QUALITY";
                        this.VideoService = ServiceManager.CreateService<VideoService>();
                        this.mvService = ServiceManager.CreateService<MonitorVideoService>();
                        base.Initialize();
                }

                public IDictionary<string, string> FindUserInfoByEquID(string equid)
                {
                        DataRow dr = DataSetUtil.GetFirstRowFromDataTable(DefaultSession.GetDataTableFromCommand(
                                                @"select e.empid, e.organizationid, p.passportid  from employee e 
                                                left join equipment equ on e.equid=equ.equid
                                                left join passport p on p.empid = e.empid
                                                where e.equid = :equid and e.isequactivate='Y'", equid));

                        IDictionary<string, string> resu = new Dictionary<string, string>();
                        resu.Add("EmployeeID", ConvertUtil.ToStringOrDefault(dr["EMPID"]));
                        resu.Add("OrganizationID", ConvertUtil.ToStringOrDefault(dr["ORGANIZATIONID"]));
                        resu.Add("PassportID", ConvertUtil.ToStringOrDefault(dr["PASSPORTID"]));
                        return resu;
                }

                //public override void Save(DataSet dsSave)
                //{
                //        //保存质量数据基本信息
                //        base.Save(dsSave);
                //        dsSave.Tables.Remove(BOName);

                //        //保存视频信息以及对应的监控点信息
                //        if (dsSave.Tables.Contains("VIDEO"))
                //        {
                //                VideoService.Save(dsSave);
                //                dsSave.Tables.Remove(VideoService.BOName);

                //                mvService.Save(dsSave);
                //                dsSave.Tables.Remove(mvService.BOName);
                //        }
                //}
        }
}
