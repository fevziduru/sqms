using System.Data;
using System.Configuration;
using System.Data.OleDb;
using EasyDev.Util;
using EasyDev.PL;
using System;

namespace EasyDev.DAL
{
    [Obsolete("�����Ѿ���ʱ")]
    public class AccessSession : DBSessionBase, IDBSession
    {
        /// <summary>
        /// Ĭ�Ϲ�����
        /// </summary>
        public AccessSession() 
        {
            this._adapter = new OleDbDataAdapter();

            this.dataSourceName = "AccessDataSource";

            this.InitDataSource();
        }

        /// <summary>
        /// ������
        /// ��������Դ���Ƴ�ʼ�����ݿ�Ự
        /// </summary>
        /// <param name="_dataSourceName">����Դ����</param>
        public AccessSession(string _dataSourceName)
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

        public override void InitDataSource()
        {
            try
            {
                this._connection = new OleDbConnection(this.ConnectionString);
                this._command = new OleDbCommand();
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        public override void InitDataSourceByName(string cfgName)
        {
            try
            {
                string customConnectionString = ConvertUtil.ConvertToString(ConfigurationManager.ConnectionStrings[cfgName]);
                this._connection = new OleDbConnection(customConnectionString);
                this._command = new OleDbCommand();
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        public override IDbCommand CreateCommand(string sqlCmdText)
        {
            IDbCommand command = null;
            try
            {
                if (null == command)
                {
                    command = new OleDbCommand(sqlCmdText, (OleDbConnection)this._connection);
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
                        this._command = new OleDbCommand();
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

        // public override IDBCommandWrapper GetStoredProcCommandWrapper()
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