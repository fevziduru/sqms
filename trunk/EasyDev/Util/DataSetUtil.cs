using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace EasyDev.Util
{
    public class DataSetUtil
    {
        /// <summary>
        /// 获取数据集中的数据表
        /// </summary>
        /// <param name="dsFrom">数据集</param>
        /// <param name="tableName">数据表名称</param>
        /// <returns></returns>
        public static DataTable GetDataTableFromDataSet(DataSet dsFrom, string tableName)
        {
            DataTable dt = null;
            try
            {
                if (dsFrom.Tables.Contains(tableName))
                {
                    dt = dsFrom.Tables[tableName];
                    //对于有自关联的表，要先删除其自关联关系，否则无法移除表
                    if (dsFrom.Relations.Count > 0)
                    {
                        dsFrom.Relations.Clear();
                    }

                    dsFrom.Tables.Remove(tableName);
                    return dt;
                }
                else
                {
                    return null;
                }
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 获取数据集中的数据表
        /// </summary>
        /// <param name="dsFrom">源数据集</param>
        /// <param name="index">数据表索引</param>
        /// <returns></returns>
        public static DataTable GetDataTableFromDataSet(DataSet dsFrom, int index)
        {
            DataTable dt = null;
            try
            {
                if (dsFrom.Tables[index] != null)
                {
                    dt = dsFrom.Tables[index];
                    //对于有自关联的表，要先删除其自关联关系，否则无法移除表
                    if (dsFrom.Relations.Count > 0)
                    {
                        dsFrom.Relations.Clear();
                    }

                    dsFrom.Tables.RemoveAt(index);
                    return dt;
                }
                else
                {
                    return null;
                }
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 获取数据集中某数据表的第一行
        /// </summary>
        /// <param name="dsFrom">数据集</param>
        /// <param name="tableName">数据表名称</param>
        /// <returns></returns>
        public static DataRow GetFirstRowFromDataSet(DataSet dsFrom, string tableName)
        {
            try
            {
                return GetSingleRowFromDataSet(dsFrom, tableName, 0);
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 获取数据表中的第一行
        /// </summary>
        /// <param name="dtFrom">数据表</param>
        /// <returns></returns>
        public static DataRow GetFirstRowFromDataTable(DataTable dtFrom)
        {
            try
            {
                return GetSingleRowFromDataTable(dtFrom, 0);
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 获取数据集中的一行
        /// </summary>
        /// <param name="dsFrom">数据集</param>
        /// <param name="tableName">数据表名称</param>
        /// <param name="rowNum">行号</param>
        /// <returns></returns>
        public static DataRow GetSingleRowFromDataSet(DataSet dsFrom, string tableName, int rowNum)
        {
            try
            {
                if (dsFrom.Tables.Contains(tableName) && dsFrom.Tables[tableName].Rows.Count > 0)
                {
                    return dsFrom.Tables[tableName].Rows[rowNum];
                }
                else
                {
                    return null;
                }
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 获取数据表中的一行
        /// </summary>
        /// <param name="dtFrom">数据表</param>
        /// <param name="rowNum">行号</param>
        /// <returns></returns>
        public static DataRow GetSingleRowFromDataTable(DataTable dtFrom, int rowNum)
        {
            try
            {
                if (dtFrom.Rows.Count > 0)
                {
                    return dtFrom.Rows[rowNum];
                }
                else
                {
                    return null;
                }
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }
    }
}
