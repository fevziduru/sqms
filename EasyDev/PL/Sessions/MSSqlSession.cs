using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using EasyDev.Util;
using System;

namespace EasyDev.PL
{
    /// <summary>
    /// ���ݿ����ӻỰ���Ự����ͨ����ȡSQL�����ı�ִ��SQL���
    /// Ҳ���Դ��ⲿ��ȡ�̳���IDbCommand�ӿڵĶ�����ִ��SQL����
    /// </summary>
    [Obsolete("�����Ѿ���ʱ")]
    public class MSSqlSession : DBSessionBase, IDBSession
    {
        /// <summary>
        /// Ĭ�Ϲ�����
        /// </summary>
        public MSSqlSession()
        {
            this._adapter = new SqlDataAdapter();

            this.dataSourceName = "MSSqlDataSource";

            this.InitDataSource();
        }

        /// <summary>
        /// ������
        /// ��������Դ���Ƴ�ʼ�����ݿ�Ự
        /// </summary>
        /// <param name="dataSourceName">����Դ����</param>
        public MSSqlSession(string dataSourceName)
        {
            this._adapter = new SqlDataAdapter();

            this.dataSourceName = dataSourceName;

            this.InitDataSourceByName(dataSourceName);
        }

        /// <summary>
        /// ���ݿ������ַ���
        /// </summary>
        public override string ConnectionString
        {
            get
            {
                //��������ַ���Ϊ����������ļ���ȡ
                if (connectionString.Equals(""))
                { 
                    connectionString = ConvertUtil.ConvertToString(ConfigurationManager.ConnectionStrings[this.dataSourceName]);
                }

                //���û��ָ���������Ӵ��������ƣ���Ĭ��ȡ��һ��
                if (connectionString.Equals(""))
                {
                    connectionString = ConvertUtil.ConvertToString(ConfigurationManager.ConnectionStrings[0]);
                }

                return connectionString;
            }
            set
            {
                this.ConnectionString = value;
            }
        }

        #region IDBSession ��Ա

        /// <summary>
        /// ��ʼ������Դ
        /// </summary>
        public override void InitDataSource()
        {
            try
            {
                this._connection = new SqlConnection(this.ConnectionString);
                this._command = new SqlCommand();
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// �����������Ƴ�ʼ������Դ
        /// </summary>
        /// <param name="cfgName">����Դ���ý�����</param>
        public override void InitDataSourceByName(string cfgName)
        {
            try
            {
                string customConnectionString = ConvertUtil.ConvertToString(ConfigurationManager.ConnectionStrings[cfgName]);
                this._connection = new SqlConnection(customConnectionString);
                this._command = new SqlCommand();
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// ����SQL�����������
        /// </summary>
        /// <param name="sqlCmdText">SQL�����ı�</param>
        public override IDbCommand CreateCommand(string sqlCmdText) 
        {
            IDbCommand command = null;
            try
            {
                if (null == command)
                {
                    command = new SqlCommand(sqlCmdText,(SqlConnection)this._connection);
                }
                else
                {
                    command.CommandText = sqlCmdText;
                    command.Connection = this._connection;
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }

            return command;
        }
        #endregion

        /// <summary>
        /// ��������
        /// </summary>
        public override void BeginTransaction()
        {
            try
            {
                if (this._connection != null)
                {
                    this._transaction = this._connection.BeginTransaction(IsolationLevel.Serializable);
                    if (this._command == null)
                    {
                        this._command = new SqlCommand();
                    }

                    this._command.Transaction = this._transaction;             //��ʼ������������������
                }
                else
                {
                    throw new DALCoreException("Failed_to_begin_transaction");      //��������ʧ��,���������ݿ�����û�б���ʼ��
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }
        
        #region ��ʵ�ַ���

        /// <summary>
        /// ��ȡ�洢���������װ��
        /// </summary>
        /// <returns></returns>
        //public override IDBCommandWrapper GetStoredProcCommandWrapper()
        //{
        //    throw new Exception("The method or operation is not implemented.");
        //}

        /// <summary>
        /// ��ȡ��������ѯ����
        /// </summary>
        /// <param name="sqlCmd">��������ѯ�ִ�</param>
        /// <param name="parameters">�����б�(��ֵ��)</param>
        /// <returns></returns>
        //public override IDBCommandWrapper GetSqlCommandWithParametersWrapper(string sqlCmd, IDictionary<string, object> parameters)
        //{
        //    try
        //    {
        //        if (this._command != null)
        //        {
        //            this._command.CommandText = sqlCmd;
        //        }
        //        else
        //        {
        //            throw new DALCoreException("_command_object_is_null");     //������󲻴���
        //        }

        //        return new DBCommandWrapperBase(this._command, parameters);
        //    }
        //    catch (DALCoreException e)
        //    {
        //        throw e;
        //    }
        //}

        #endregion
    }
}
