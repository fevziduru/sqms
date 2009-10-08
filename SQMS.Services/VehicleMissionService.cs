using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using SQMS.Services.Domain.Vehicle;
using log4net;
using EasyDev.Util;
using System.Web.Script.Serialization;
using SQMS.Services.Domain.QualityControl;

namespace SQMS.Services
{
    public class VehicleMissionService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(VehicleMissionService));
        protected override void Initialize()
        {
            this.BOName = "VEHICLETASK";
            base.Initialize();
        }
        public VehicleTask GetVehicleTaskObj(string id)
        {
            string sql = @"SELECT V.TASKID,
       V.TASKNAME,
       V.PUBLICTIME,
       V.STARTTIME,
       V.ENDTIME,
       V.MODEL,
       V.TASKTYPE,
       V.TRACE,
       V.CHARGEMAN AS CHARGEMANID,
       E.EMPNAME AS CHARGEMAN,
       V.LICENSEPLATENUM,
       V.ISGASSUPPLIED,
       V.ISWATERSUPPLIED,
       V.ISREPAIRED,
       V.CREATED,
       V.CREATEDBY,
       V.MODIFIED,
       V.MODIFIEDBY,
       V.ISVOID
  FROM VEHICLETASK V
  LEFT JOIN EMPLOYEE E ON E.EMPID = V.CHARGEMAN
                      AND E.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'
 WHERE V.TASKID = '" + id + "'";
            DataTable dt = new DataTable();
            VehicleTask obj = null;
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
                obj = this.CreateSingleVehicleTask(dt.Rows[0]);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
                throw;
            }
            return obj;
        }
        public DataTable GetVehicleTaskDataList(string taskId)
        {
            string sql = @"SELECT V.VTDID,
       V.TASKID,
       V.VIDEOURL,
       V.LATITUDE,
       V.LONGITUDE,
       V.IMAGEURL,
       V.TICKETID,
       V.TICKETTYPE,
       V.CREATED,
       V.CREATEDBY,
       V.MODIFIED,
       V.MODIFIEDBY,
       V.ISVOID
  FROM VEHICLETASKDATA V
 WHERE V.TASKID = '"+taskId+"'";
            DataTable dt = new DataTable();
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
                throw;
            }
            return dt;
        }

        public List<VehicleTask> CreateVehicleTask(DataTable dt)
        {
            List<VehicleTask> list = new List<VehicleTask>();
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(this.CreateSingleVehicleTask(dr));
            }
            return list;
        }

        public VehicleTask CreateSingleVehicleTask(DataRow dr)
        {
            VehicleTask obj = new VehicleTask();
            obj.ChargeMan = ConvertUtil.ToStringOrDefault(dr["ChargeMan"]);
            obj.EndTime = ConvertUtil.ToDateTime(dr["EndTime"]);
            obj.IsGasSupplied = ConvertUtil.ToBool(dr["IsGasSupplied"]);
            obj.IsRepaired = ConvertUtil.ToBool(dr["IsRepaired"]);
            obj.IsVoid = ConvertUtil.ToBool(dr["IsVoid"]);
            obj.IsWaterSupplied = ConvertUtil.ToBool(dr["IsWaterSupplied"]);
            obj.LicensePlateNum = ConvertUtil.ToStringOrDefault(dr["LicensePlateNum"]);
            obj.Model = ConvertUtil.ToStringOrDefault(dr["Model"]);
            obj.PublicTime = ConvertUtil.ToDateTime(dr["PublicTime"]);
            obj.StartTime = ConvertUtil.ToDateTime(dr["StartTime"]);
            obj.TaskId = ConvertUtil.ToStringOrDefault(dr["TaskId"]);
            obj.TaskName = ConvertUtil.ToStringOrDefault(dr["TaskName"]);
            obj.TaskType = ConvertUtil.ToStringOrDefault(dr["TaskType"]);
            obj.Trace = new VehicleTrace();
            obj.Trace.Points = ConvertUtil.ToStringOrDefault(dr["Trace"]);
            obj.Trace.Data = this.CreateVehicleTaskData(this.GetVehicleTaskDataList(obj.TaskId));

            return obj;

        }
        //public List<VehicleTrace> CreateVehicleTrace(string trace, DataTable taskData)
        //{
        //    List<Dictionary<string, string>> dict = new List<Dictionary<string, string>>();
        //    try
        //    {
        //        JavaScriptSerializer s = new JavaScriptSerializer();
        //        dict = s.Deserialize<List<Dictionary<string, string>>>(trace);
        //    }
        //    catch { }
        //    List<VehicleTrace> list = new List<VehicleTrace>();
        //    if (dict.Count <= 0)
        //    {
        //        return list;
        //    }
        //    List<VehicleTaskData> data = this.CreateVehicleTaskData(taskData);
        //    foreach (Dictionary<string, string> item in dict)
        //    {
        //        VehicleTrace obj = new VehicleTrace();
        //        obj.LatLng = new SQMS.Services.Domain.QualityControl.LatLng(ConvertUtil.ToLat(item["Lat"]), ConvertUtil.ToLng(item["Lng"]));
        //        //obj.Data 
        //    }

        //}
        public List<VehicleTaskData> CreateVehicleTaskData(DataTable dt)
        {
            List<VehicleTaskData> list = new List<VehicleTaskData>();
            foreach (DataRow dr in dt.Rows)
            {
                VehicleTaskData obj = new VehicleTaskData();
                obj.ImageUrl = ConvertUtil.ToStringOrDefault(dr["ImageUrl"]);
                obj.LatLng = new LatLng(ConvertUtil.ToLat(dr["LATITUDE"]), ConvertUtil.ToLng(dr["LONGITUDE"]));
                obj.TaskId = ConvertUtil.ToStringOrDefault(dr["TaskID"]);
                obj.TicketId = ConvertUtil.ToStringOrDefault(dr["TicketId"]);
                obj.TicketType = ConvertUtil.ToStringOrDefault(dr["TicketType"]);
                obj.VehicleTaskDataId = ConvertUtil.ToStringOrDefault(dr["VTDID"]);
                obj.VideoUrl = ConvertUtil.ToStringOrDefault(dr["VideoUrl"]);
                
                list.Add(obj);
            }
            return list;
        }


        public DataTable GetVehicleTaskList()
        {
            return this.GetVehicleTaskList("");
        }

        public DataTable GetVehicleTaskList(string p)
        {
            string sql = @"SELECT V.TASKID,
       V.TASKNAME,
       V.PUBLICTIME,
       V.STARTTIME,
       V.ENDTIME,
       V.MODEL,
       V.TASKTYPE,
       V.TRACE,
       V.CHARGEMAN AS CHARGEMANID,
       E.EMPNAME AS CHARGEMAN,
       V.LICENSEPLATENUM,
       V.ISGASSUPPLIED,
       V.ISWATERSUPPLIED,
       V.ISREPAIRED,
       V.CREATED,
       V.CREATEDBY,
       V.MODIFIED,
       V.MODIFIEDBY,
       V.ISVOID
  FROM VEHICLETASK V
  LEFT JOIN EMPLOYEE E ON E.EMPID = V.CHARGEMAN
                      AND E.ORGANIZATIONID = '" + this.CurrentUser.OrganizationID + @"'";
            if (!String.IsNullOrEmpty(p))
            {
                sql += " WHERE V.CREATED = TO_DATE('"+p+"', 'yyyy-mm-dd')";
            }
            DataTable dt = new DataTable();
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
                throw;
            }
            return dt;
        }
    }
}
