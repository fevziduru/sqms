using System;
using System.Data;
using EasyDev.PL;
using EasyDev.PL.SqlBuilder;
using EasyDev.PL.IdentityStrategy;
using System.Text;
using System.Collections.Generic;
using System.Collections;

namespace EasyDev.BL
{
    [Serializable]
    public class GenericBizObject<T> : IGenericBizObject, IDisposable
        where T : DataSet
    {
        #region 私有成员
        private T _data = null;
        private DataSet views = null;
        private string _schema = string.Empty;
        private GenericDBSession _session = null;
        private string _entityName = string.Empty;
        #endregion

        #region 公共属性
        /// <summary>
        /// BO名称
        /// </summary>
        public string BOName
        {
            get;
            set;
        }

        /// <summary>
        /// 数据表全名
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// 域模型表示的表名称
        /// </summary>
        public string Entity
        {
            get { return this._entityName; }
            set { this._entityName = value; }
        }

        /// <summary>
        /// 数据集架构
        /// </summary>
        public string Schema
        {
            get { return this._schema; }
            set { this._schema = value; }
        }

        /// <summary>
        /// 与域模型关联的数据库会话
        /// </summary>
        public GenericDBSession CurrentSession
        {
            get
            {
                return this._session;
            }
        }

        /// <summary>
        /// 域模型数据
        /// </summary>
        public T Data
        {
            get { return _data; }
            set { _data = value; }
        }

        public DataSet BOData
        {
            get { return (DataSet)_data; }
        }

        public DataSet Views
        {
            get
            {
                return this.views;
            }
        }
        #endregion

        #region 公共构造方法

        public GenericBizObject(T ds)
        {
            this._data = ds;
            this.views = new DataSet();
        }

        public GenericBizObject(T ds, GenericDBSession session)
        {
            this._data = ds;
            this._session = session;
            this.views = new DataSet();
        }
        #endregion

        #region IDisposable 成员

        public void Dispose()
        {
            this._data = null;
        }

        #endregion

        #region IBizObject 成员

        /// <summary>
        /// 根据行状态将数据同步到数据库
        /// </summary>
        /// <returns></returns>
        public virtual void Synchronize()
        {
            try
            {
                if (this._data.Tables.Count > 0)
                {
                    //对数据集中的每一个表进行处理
                    foreach (DataTable dt in this._data.Tables)
                    {
                        //DataTable dt = this._data.Tables[0];
                        foreach (DataRow row in dt.Rows)
                        {
                            if (row.RowState == DataRowState.Added)
                            {
                                _session.ExecuteCommand(SqlBuilder.BuildInsertCommand(this.FullName, row.Table, row));
                            }
                            else if (row.RowState == DataRowState.Modified)
                            {
                                _session.ExecuteCommand(SqlBuilder.BuildUpdateCommand(this.FullName, row.Table, row));
                            }
                            else if (row.RowState == DataRowState.Deleted)
                            {
                                _session.ExecuteCommand(SqlBuilder.BuildDeleteCommand(this.FullName, row.Table, row));
                            }
                        }
                    }
                    this._data.AcceptChanges();
                }
            }
            catch (PersistenceException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 加载所有数据
        /// </summary>
        /// <returns></returns>
        public virtual bool LoadAll()
        {
            return this.LoadByCondition("");
        }

        /// <summary>
        /// 根据主键加载数据
        /// </summary>
        /// <param name="keyValue"></param>
        /// <returns></returns>
        public virtual bool LoadByPrimaryKey(object keyValue)
        {
            string cond = "";
            try
            {
                DataColumn[] cols = this._data.Tables[this._entityName].PrimaryKey;
                string firstKey = "";
                if (cols.Length > 0)
                {
                    firstKey = cols[0].ColumnName;
                    DataColumn column = cols[0];
                    cond += SqlBuilder.GetConditionByPrimaryKeys(firstKey, keyValue, ",");

                    //如果条件串以逗号结尾则去掉它
                    if (cond.Trim().EndsWith(","))
                    {
                        cond = cond.TrimEnd(new char[] { ',' });
                    }
                }
            }
            catch (PersistenceException ex)
            {
                throw ex;
            }

            return this.LoadByCondition(cond);
        }

        /// <summary>
        /// 根据主键加载数据（多主键情况）
        /// </summary>
        /// <param name="keyValues"></param>
        /// <returns></returns>
        public virtual bool LoadByPrimaryKeys(IDictionary<string,object> keyValues)
        {
            string cond = "";
            try
            {
                //TODO: 测试
                DataColumn[] cols = this._data.Tables[this._entityName].PrimaryKey;
                if (cols.Length > 0)
                {
                    IEnumerator itr_keyvalues = keyValues.GetEnumerator();
                    while (itr_keyvalues.MoveNext())
                    {
                        KeyValuePair<string, object> item = (KeyValuePair<string, object>)itr_keyvalues.Current;
                        cond += SqlBuilder.GetConditionByPrimaryKeys(item.Key, item.Value, " AND ");
                    }

                    if (cond.Trim().EndsWith("AND"))
                    {
                        cond = cond.Remove(cond.Length - "AND".Length);
                    }
                }
            }
            catch (PersistenceException ex)
            {
                throw ex;
            }

            return this.LoadByCondition(cond);
        }
        
        /// <summary>
        /// 根据条件加载数据
        /// </summary>
        /// <param name="whereCond"></param>
        /// <returns></returns>
        public virtual bool LoadByCondition(string whereCond)
        {
            StringBuilder sb = new StringBuilder();

            try
            {
                if (string.IsNullOrEmpty(whereCond) == false)
                {
                    whereCond = " WHERE " + whereCond;
                }
                
                sb.AppendFormat(@"SELECT {0} FROM {1} {2}",
                                SqlBuilder.GetColumns(this._data.Tables[this._entityName])
                                , this.FullName, whereCond);

                #region 重新加载域模型数据
                //清除数据集中的数据表
                this._data.Tables.Clear();
                
                //读取架构以重新获得与数据表相关的约束信息
                //@注 : 如果这里没有读取架构信息而直接将查询后得到的表或数据集赋值给数据集或数据集中的表会导致之前的架构信息丢失，
                //以至不能从数据集或数据表中取得主键、外键等相关信息
                this._data.ReadXmlSchema(this._schema);

                //将从数据库查询到的数据表合并到数据集
                this._data.Tables[this._entityName].Merge(
                    this._session.GetDataTableFromCommand(sb.ToString()), true, MissingSchemaAction.AddWithKey);

                if (this._data.Tables.Count > 0)
                {
                    this._data.Tables[0].TableName = this._entityName;
                }
                #endregion
            }
            catch (PersistenceException e)
            {
                throw e;
            }

            return true;
        }

        /// <summary>
        /// 创建新行
        /// </summary>
        /// <returns></returns>
        public virtual DataRow Create()
        {
            DataRow drNew = null;
            try
            {
                if (this._data.Tables.Count > 0)
                {
                    DataTable dt = this._data.Tables[0];
                    drNew = dt.NewRow();
                    //处理主键
                    for (int i = 0; i < dt.PrimaryKey.Length; i++)
                    {   
                        //drNew[dt.PrimaryKey[i].ColumnName] = IdentityGenerator.GUIDIdentity();
                        drNew[dt.PrimaryKey[i].ColumnName] = IdentityGenerator.GetNextSequenceId(_session, BOName);
                    }

                    //处理空值约束
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        if (dt.Columns[i].AllowDBNull == false)
                        {
                            if (dt.Columns[i].DataType == typeof(string))
                            {
                                drNew[i] = Guid.NewGuid().ToString();
                            }
                            else if (dt.Columns[i].DataType == typeof(Guid))
                            {
                                drNew[i] = Guid.NewGuid();
                            }
                            else if (dt.Columns[i].DataType == typeof(decimal) || dt.Columns[i].DataType == typeof(double) || dt.Columns[i].DataType == typeof(int))
                            {
                                drNew[i] = 0;
                            }
                            else if (dt.Columns[i].DataType == typeof(DateTime))
                            {
                                drNew[i] = DateTime.Now;
                            }
                            else if (dt.Columns[i].DataType == typeof(bool))
                            {
                                drNew[i] = false;
                            }
                        }
                    }
                    dt.Rows.Add(drNew);
                }
            }
            catch (PersistenceException e)
            {
                throw e;
            }
            return drNew;
        }
        
        /// <summary>
        /// 判断模型是否为空
        /// </summary>
        /// <returns></returns>
        public virtual bool IsModelEmpty()
        {
            return this.Data.Tables.Count <= 0 
                || (this.Data.Tables.Count > 0 && this.Data.Tables[0].Rows.Count <= 0);
        }

        /// <summary>
        /// 判断BO是否为空
        /// </summary>
        /// <returns></returns>
        public virtual bool IsEmpty()
        {
            return this.Data.Tables.Count <= 0
                || (this.Data.Tables.Count > 0 && this.Data.Tables[0].Rows.Count <= 0);
        }

        /// <summary>
        /// 取得模型中的第一行
        /// </summary>
        /// <returns></returns>
        public virtual DataRow GetFirstRow()
        {
            if (IsModelEmpty() == false)
            {
                return this.Data.Tables[0].Rows[0];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 取得模型中的第一张表
        /// </summary>
        /// <returns></returns>
        public virtual DataTable GetFirstTable()
        {
            if (IsModelEmpty() == false)
            {
                return this.Data.Tables[0];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 清除业务对象数据
        /// </summary>
        public virtual void Clear()
        {
            this.Data.Clear();
        }

        #endregion

        /// <summary>
        /// 根据名称打开视图
        /// </summary>
        /// <param name="viewName"></param>
        /// <returns></returns>
        public DataSet LoadViewByName(string viewName)
        {
            try
            {
                return LoadViewByCondition(viewName, null);
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 根据条件打开视图
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="cond"></param>
        /// <returns></returns>
        public DataSet LoadViewByCondition(string viewName, string cond)
        {
            try
            {
                string sql = string.Empty;
                if (string.IsNullOrEmpty(cond))
                {
                    sql = string.Format(@"select * from {0}", viewName);
                }
                else
                {
                    sql = string.Format(@"select * from {0} where {1}", viewName, cond);
                }
                
                DataTable dtTmp = this._session.GetDataTableFromCommand(sql);
                
                dtTmp.TableName = viewName;
                if (this.views.Tables.Contains(viewName))
                {
                    this.views.Tables.Remove(viewName);
                }

                this.views.Tables.Add(dtTmp);
                return dtTmp.DataSet;
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 从视图集合中移除视图
        /// </summary>
        /// <param name="viewName"></param>
        public void RemoveFromViews(string viewName)
        {
            this.views.Tables.Remove(viewName);
        }

        /// <summary>
        /// 根据ID删除数据
        /// </summary>
        /// <param name="key"></param>
        public void DeleteByPrimaryKey(object key)
        {
            string cond = string.Empty;
            try
            {
                DataColumn[] cols = this._data.Tables[this._entityName].PrimaryKey;
                string firstKey = "";

                if (cols.Length > 0)
                {
                    firstKey = cols[0].ColumnName;
                    DataColumn column = cols[0];
                    cond += SqlBuilder.GetConditionByPrimaryKeys(firstKey, key, ",");

                    //如果条件串以逗号结尾则去掉它
                    if (cond.Trim().EndsWith(","))
                    {
                        cond = cond.TrimEnd(new char[] { ',' });
                    }
                }

                this.DeleteByCondition(cond);
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 多主键删除
        /// </summary>
        /// <param name="keys"></param>
        public void DeleteByPrimaryKeys(IDictionary<string, object> keys)
        {
            string cond = string.Empty;
            try
            {
                DataColumn[] cols = this._data.Tables[this._entityName].PrimaryKey;
                if (cols.Length > 0)
                {
                    IEnumerator itr_keyvalues = keys.GetEnumerator();
                    while (itr_keyvalues.MoveNext())
                    {
                        KeyValuePair<string, object> item = (KeyValuePair<string, object>)itr_keyvalues.Current;
                        cond += SqlBuilder.GetConditionByPrimaryKeys(item.Key, item.Value, " AND ");
                    }

                    if (cond.Trim().EndsWith("AND"))
                    {
                        cond = cond.Remove(cond.Length - "AND".Length);
                    }
                }

                this.DeleteByCondition(cond);
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 按条件删除
        /// </summary>
        /// <param name="cond"></param>
        public void DeleteByCondition(string cond)
        {
            try
            {
                StringBuilder deleteCommand = new StringBuilder();
                deleteCommand.Append(string.Format("DELETE FROM {0} WHERE {1}", this.Entity, cond));

                _session.ExecuteCommand(deleteCommand.ToString());
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }

        public string GetNextSequenceID(string tableName)
        {
            try
            {
                return Convert.ToString(
                    _session.GetScalarObjectFromCommand(
                    string.Format(@"SELECT SEQ_{0}.nextval FROM dual", tableName)));
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
