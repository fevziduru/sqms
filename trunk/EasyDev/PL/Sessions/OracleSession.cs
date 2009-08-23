using System;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;
using EasyDev.Util;

namespace EasyDev.PL
{
    [Obsolete("�����Ѿ���ʱ")]
    public class OracleSession : DBSessionBase, IDBSession
    {
        /// <summary>
        /// Ĭ�Ϲ�����
        /// </summary>
        public OracleSession()
        {
            this._adapter = new OracleDataAdapter();

            this.dataSourceName = "OracleDataSource";

            this.InitDataSource();
        }

        /// <summary>
        /// ������
        /// ��������Դ���Ƴ�ʼ�����ݿ�Ự
        /// </summary>
        /// <param name="_dataSourceName">����Դ����</param>
        public OracleSession(string _dataSourceName)
        {
            this.dataSourceName = _dataSourceName;

            this.InitDataSourceByName(_dataSourceName);
        }

        /// <summary>
        /// ���ݿ������ַ���
        /// </summary>
        public override string ConnectionString
        {
            get
            {
                //��������ַ���Ϊ����������ļ���ȡ
                if (this.connectionString.Equals(""))
                {
                    this.connectionString = ConvertUtil.ConvertToString(ConfigurationManager.ConnectionStrings[this.dataSourceName]);
                }

                //���û��ָ���������Ӵ��������ƣ���Ĭ��ȡ��һ��
                if (this.connectionString.Equals(""))
                {
                    this.connectionString = ConvertUtil.ConvertToString(ConfigurationManager.ConnectionStrings[0]);
                }

                return this.connectionString;
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
                this._connection = new OracleConnection(this.ConnectionString);
                this._command = new OracleCommand();
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
                string customConnectionString = System.Convert.ToString(ConfigurationManager.ConnectionStrings[cfgName]);
                this._connection = new OracleConnection(customConnectionString);
                this._command = new OracleCommand();
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
                    command = new OracleCommand(sqlCmdText, (OracleConnection)this._connection);
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
                        this._command = new OracleCommand();
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

        //public override IDBCommandWrapper<> GetStoredProcCommandWrapper()
        //{
        //    throw new Exception("The method or operation is not implemented.");
        //}

        //public override IDBCommandWrapper GetSqlCommandWithParametersWrapper(string sqlCmd, IDictionary<string, object> parameters)
        //{
        //    throw new Exception("The method or operation is not implemented.");
        //}

        #endregion
    }
}