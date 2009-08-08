using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using log4net;
using SQMS.Services.Domain.QualityControl;

namespace SQMS.Services.QualityControl
{
    public class QualityControlService : GenericService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(QualityControlService));
        protected override void Initialize()
        {
            this.BOName = "QUALITY";
            base.Initialize();
        }
        #region 获取数据
        public DataTable GetMonitorPointList(string regionId)
        {
            string sql = @"SELECT M.MPID,
                                   M.ROADID,
                                   M.MPCODE,
                                   M.MPNAME,
                                   M.LONGITUDE,
                                   M.LATITUDE,
                                   M.MEMO,
                                   M.CREATED,
                                   M.CREATEDBY,
                                   M.MODIFIED,
                                   M.MODIFIEDBY
                              FROM MPASSIGNMENT M
                             WHERE M.ROADID = '"+regionId+"'";
            DataTable dt = new DataTable();
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }

        public DataTable GetQualityControlInfoList(string monitorPointId)
        {
            throw new NotImplementedException();
        }

        public DataTable SearchMonitorPoint(string keywords)
        {
            string[] keywordArray = keywords.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string sqlLike = " (";
            foreach (string keyword in keywordArray)
            {
                sqlLike += " M.MPNAME LIKE '%" + keyword + "%' OR";
            }
            if (sqlLike.EndsWith("OR"))
            {
                sqlLike = sqlLike.Remove(sqlLike.Length - 2, 2);
            }
            sqlLike += ") ";
            string sql = @"SELECT M.MPID,
                                   M.ROADID,
                                   M.MPCODE,
                                   M.MPNAME,
                                   M.LONGITUDE,
                                   M.LATITUDE,
                                   M.MEMO,
                                   M.CREATED,
                                   M.CREATEDBY,
                                   M.MODIFIED,
                                   M.MODIFIEDBY
                              FROM MPASSIGNMENT M
                             WHERE " + sqlLike;
            DataTable dt = new DataTable();
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }

        public DataTable GetMonitorPointInLatLngBounds(LatLngBounds bound)
        {
            string sql = @"SELECT M.MPID,
                                   M.ROADID,
                                   M.MPCODE,
                                   M.MPNAME,
                                   M.LONGITUDE,
                                   M.LATITUDE,
                                   M.MEMO,
                                   M.CREATED,
                                   M.CREATEDBY,
                                   M.MODIFIED,
                                   M.MODIFIEDBY
                              FROM MPASSIGNMENT M
                             WHERE M.LATITUDE < " + bound.NorthEast.Lat + @" 
                               AND M.LONGITUDE > " + bound.SouthWest.Lng + @" 
                               AND M.LATITUDE < " + bound.NorthEast.Lat + @"
                               AND M.LONGITUDE < " + bound.NorthEast.Lng + @" 
                               AND M.LATITUDE > " + bound.SouthWest.Lat + @"
                               AND M.LONGITUDE > " + bound.SouthWest.Lng + @" 
                               AND M.LATITUDE > " + bound.SouthWest.Lat + @"
                               AND M.LONGITUDE < " + bound.NorthEast.Lng;
            DataTable dt = new DataTable();
            try
            {
                dt = this.DefaultSession.GetDataTableFromCommand(sql);
            }
            catch (Exception e)
            {
                log.Error(e.ToString());
            }
            return dt;
        }
        #endregion
    }
}
