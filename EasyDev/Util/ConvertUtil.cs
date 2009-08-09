using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace EasyDev.Util
{
    public sealed class ConvertUtil
    {
        [Obsolete("此方法已经过时，请使用ToStringOrDefault")]
        public static string EmptyOrString(object obj)
        {
            try
            {
                if (null == obj)
                {
                    return string.Empty;
                }
                else
                {
                    return System.Convert.ToString(obj);
                }
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 转换为字符串，如果为空则返回string.Empty
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [Obsolete("此方法已过时")]
        public static string ConvertToString(object obj)
        {
            try
            {
                if (null == obj)
                {
                    return string.Empty;
                }
                else
                {
                    return System.Convert.ToString(obj);
                }
            }
            catch (ConvertException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 返回对象的字符串表示
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string ToStringOrDefault(object obj)
        {
            try
            {
                if (null == obj)
                {
                    return string.Empty;
                }
                else
                {
                    return Convert.ToString(obj);
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
        /// <param name="dsFrom">数据集</param>
        /// <param name="tableName">数据表名称</param>
        /// <returns></returns>
        [Obsolete("请使用DataSetUtil中的对应方法")]
        public static DataTable GetDataTableFromDataSet(DataSet dsFrom, string tableName)
        {
            try
            {
                if (dsFrom.Tables.Contains(tableName))
                {
                    return dsFrom.Tables[tableName];
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
        [Obsolete("请使用DataSetUtil中的对应方法")]
        public static DataTable GetDataTableFromDataSet(DataSet dsFrom, int index)
        {
            try
            {
                if (dsFrom.Tables[index] != null)
                {
                    return dsFrom.Tables[index];
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
        [Obsolete("请使用DataSetUtil中的对应方法")]
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
        [Obsolete("请使用DataSetUtil中的对应方法")]
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
        [Obsolete("请使用DataSetUtil中的对应方法")]
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
        [Obsolete("请使用DataSetUtil中的对应方法")]
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

        /// <summary>
        /// 将对象转换成DateTime，如果无法转换则返回值为0001-1-1 00:00:00的DateTime（new DateTime();）
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static DateTime ToDateTime(object obj)
        {
            try
            {
                DateTime d = DateTime.Parse(ConvertUtil.ToStringOrDefault(obj));
                return d;
            }
            catch
            {
                return new DateTime();
            }
        }
        /// <summary>
        /// 将对象转换成decimal，如果无法转换则返回0
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static decimal ToDecimal(object obj)
        {
            try
            {
                return Convert.ToDecimal(obj);
            }
            catch
            { 
                return 0; 
            }
        }
        /// <summary>
        /// 将对象转换成int，如果无法转换则返回0
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int ToInt(object obj)
        {
            try
            {
                return Convert.ToInt32(obj);
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 转换成纬度，正数为北纬，负数为南纬，默认值为0度
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static decimal ToLat(object obj)
        {
            decimal value = 0;
            try
            {
                value = Convert.ToDecimal(obj);
                if (value > 90)
                {
                    value = 90;
                }
                else if (value < -90)
                {
                    value = -90;
                }
            }
            catch
            {}
            return value;
        }
        /// <summary>
        /// 转换成经度，正数为东经，负数为西经，默认值为0度
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static decimal ToLng(object obj)
        {
            decimal value = 0;
            try
            {
                value = Convert.ToDecimal(obj);
                if (value > 180)
                {
                    value = 180;
                }
                else if (value < -180)
                {
                    value = -180;
                }
            }
            catch
            { }
            return value;
        }
    }
}
