using System.Data;
using EasyDev.PL;
using System;

namespace EasyDev.PL
{
    /// <summary>
    /// ���ݿ����ӵĹ�������
    /// </summary>
    [Obsolete("�����Ѿ���ʱ")]
    public abstract class DBSessionBase  : IDBSession
    {
        /// <summary>
        /// ����Դ����
        /// </summary>
        protected string dataSourceName = "";

        /// <summary>
        /// �����ַ���
        /// </summary>
        protected string connectionString = "";

        /// <summary>
        /// ���ݿ����Ӷ���
        /// </summary>
        protected IDbConnection _connection = null;

        /// <summary>
        /// ���ݿ��������
        /// </summary>
        protected IDbCommand _command = null;

        /// <summary>
        /// ���ݿ��������
        /// </summary>
        protected IDbTransaction _transaction = null;

        /// <summary>
        /// ���ݿ�������
        /// </summary>
        protected IDbDataAdapter _adapter = null;
        
        /// <summary>
        /// �����ַ���
        /// </summary>
        public virtual string ConnectionString
        {
            get
            {
                return this.connectionString;
            }
            set
            {
                this.connectionString = value;
            }
        }

        /// <summary>
        /// ����������
        /// </summary>
        public IDbDataAdapter DataAdapter
        {
            get
            {
                return this._adapter;
            }
        }

        /// <summary>
        /// �������ݿ�����
        /// </summary>
        public IDbConnection Connection
        {
            get 
            {
                if (this._connection == null)
                {
                    throw new DALCoreException("the_connection_is_not_initialized");
                }
                return this._connection;
            }
        }

        /// <summary>
        /// ȡ�����ݿ�Ự״̬
        /// </summary>
        public virtual ConnectionState SessionState
        {
            get
            {
                if (this._connection != null)
                {
                    return this._connection.State;
                }
                else
                {
                    throw new DALCoreException("");
                }
            }
        }

        /// <summary>
        /// �������ݿ����ӻỰ
        /// </summary>
        public virtual void OpenSession()
        {
            try
            {
                if (this._connection.State == ConnectionState.Closed)
                {
                    this._connection.Open();
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// �ر����ݿ�Ự
        /// </summary>
        public virtual void CloseSession()
        {
            try
            {
                if (this._connection.State == ConnectionState.Open)
                {
                    this._connection.Close();
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }  

        /// <summary>
        /// �ύ����
        /// </summary>
        public virtual void CommitTransaction()
        {
            try
            {
                if (this._transaction != null)
                {
                    this._transaction.Commit();
                }
                else
                {
                    throw new DALCoreException("command_is_null_transaction");    //�����ύʧ��,�������������δ��ʼ��
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// �ع�����
        /// </summary>
        public virtual void RollBackTransaction()
        {
            try
            {
                if (this._transaction != null)
                {
                    this._transaction.Rollback();
                }
                else
                {
                    throw new DALCoreException("command_is_null");     //�������Ϊ��
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// ִ��SQL����
        /// </summary>
        /// <returns>SQL����Ӱ������</returns>
        public virtual int ExecuteCommand(string sqlCmd)
        {
            int result = -1;

            try
            {
                if (this._command != null)
                {
                    this._command.CommandText = sqlCmd;
                    if (this._connection != null)
                    {
                        this._command.Connection = this._connection;
                    }
                    else
                    {
                        throw new DALCoreException("command_no_connection");    //�������û�ж�Ӧ�����ݿ�������Ϣ
                    }

                    this._connection.Open();                                                            //�������ݿ�����
                    this.BeginTransaction();                                                             //��������
                    
                    result = this._command.ExecuteNonQuery();

                    this._transaction.Commit();
                }
                else
                {
                    throw new DALCoreException("command_is_null");     //�������Ϊ��
                }
            }
            catch (DALCoreException e)
            {
                this._transaction.Rollback();                                               //�ع�����
                throw e;
            }
            finally
            {
                this._connection.Close();                                                    //�ر�����
            }

            return result;
        }

        /// <summary>
        /// ִ��SQL����
        /// </summary>
        /// <returns>SQL����Ӱ������</returns>
        public virtual int ExecuteCommand(IDbCommand command)
        {
            int result = -1;
            try
            {
                if (string.IsNullOrEmpty(command.CommandText) == false && command.Connection != null)
                {
                    this._connection.Open();                                                     //�������ݿ�����
                    this._transaction = this._connection.BeginTransaction();       //��������
                    command.Transaction = this._transaction;                           //��ʼ��Command�������������

                    result = command.ExecuteNonQuery();

                    this._transaction.Commit();
                }
                else
                {
                    throw new DALCoreException("no_connection_or_no_commandText"); //�������û�������ı���û�г�ʼ�����ݿ�����
                }
            }
            catch (DALCoreException e)
            {
                this._transaction.Rollback();   //�ع�����
                throw e;
            }
            finally
            {
                this._connection.Close();      //�ر����ݿ�����
            }
            return result;
        }
               
        /// <summary>
        /// ����SQL����õ�һ�����ݼ�¼�α�
        /// </summary>
        /// <returns></returns>
        public virtual IDataReader GetDataReaderFromCommand(string sqlCmd)
        {
            try
            {
                if (this._command != null)
                {
                    this._command.CommandText = sqlCmd;
                    this._command.Connection = this.Connection;
                    
                    this.OpenSession();

                    return this._command.ExecuteReader(CommandBehavior.CloseConnection);
                }
                else
                {
                    throw new DALCoreException("command_is_null");     //�������Ϊ��
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
            finally
            {
                this.CloseSession();
            }
        }

        /// <summary>
        /// �����������õ�һ�����ݼ�¼�α�
        /// </summary>
        /// <returns></returns>
        public virtual IDataReader GetDataReaderFromCommand(IDbCommand command)
        {
            try
            {
                if (string.IsNullOrEmpty(command.CommandText) == false && command.Connection != null)
                {
                    this.OpenSession();
                    return command.ExecuteReader(CommandBehavior.CloseConnection);
                }
                else
                {
                    throw new DALCoreException("no_connection_or_no_commandText"); //�������û�������ı���û�г�ʼ�����ݿ�����
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
            finally
            {
                this.CloseSession();
            }
        }

        /// <summary>
        /// ȡ�ý�����е�һ�е�һ�е�ֵ���Զ������ͷ���
        /// </summary>
        /// <param name="sqlCmd">SQL�����ı�</param>
        /// <returns></returns>
        public virtual object GetScalarObjectFromCommand(string sqlCmd)
        {
            try
            {
                if (this._command != null)
                {
                    this._command.CommandText = sqlCmd;
                    this._command.Connection = this.Connection;
                    
                    this.OpenSession();

                    return this._command.ExecuteScalar();
                }
                else
                {
                    throw new DALCoreException("command_is_null");     //�������Ϊ��
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
            finally
            {
                this.CloseSession();
            }
        }

        /// <summary>
        /// ȡ�ý�����е�һ�е�һ�е�ֵ���Զ������ͷ���
        /// </summary>
        /// <param name="sqlCmd">SQL�����ı�</param>
        /// <returns></returns>
        public virtual object GetScalarObjectFromCommand(IDbCommand command)
        {
            try
            {
                if (string.IsNullOrEmpty(command.CommandText) == false && command.Connection != null)
                {
                    this.OpenSession();

                    return command.ExecuteScalar();
                }
                else
                {
                    throw new DALCoreException("no_connection_or_no_commandText"); //�������û�������ı���û�г�ʼ�����ݿ�����
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }
            finally
            {
                this.CloseSession();
            }
        }

        /// <summary>
        /// ��ȡ���ݼ�
        /// </summary>
        /// <param name="sqlCmd">SQL�����ı�</param>
        /// <returns></returns>
        public virtual DataSet GetDataSetFromCommand(string sqlCmd)
        {
            DataSet dsResult = new DataSet();
            try
            {
                if (this._command != null)
                {
                    this._command.CommandText = sqlCmd;
                    this._command.Connection = this.Connection;

                    if (this._adapter != null)
                    {
                        this._adapter.SelectCommand = this._command;
                        this._adapter.Fill(dsResult);
                    }
                    else
                    {
                        throw new DALCoreException("the_adapter_is_not_initialized");        //Adapterδ��ʼ��
                    }
                }
                else
                {
                    throw new DALCoreException("command_is_null");     //�������Ϊ��
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }

            return dsResult;
        }

        /// <summary>
        /// ��ȡ���ݼ�
        /// </summary>
        /// <param name="command">�������</param>
        /// <returns></returns>
        public virtual DataSet GetDataSetFromCommand(IDbCommand command)
        {
            DataSet dsResult = new DataSet();

            try
            {
                if (string.IsNullOrEmpty(command.CommandText) == false && command.Connection != null)
                {
                    if (this._adapter != null)
                    {
                        this._adapter.SelectCommand = command;
                        this._adapter.Fill(dsResult);
                    }
                    else
                    {
                        throw new DALCoreException("the_adapter_is_not_initialized");        //Adapterδ��ʼ��
                    }
                }
                else
                {
                    throw new DALCoreException("no_connection_or_no_commandText"); //�������û�������ı���û�г�ʼ�����ݿ�����
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }

            return dsResult;
        }

        /// <summary>
        /// ��ȡ���ݱ�
        /// </summary>
        /// <param name="command">�������</param>
        /// <returns></returns>
        public virtual DataTable GetDataTableFromCommand(IDbCommand command)
        {
            DataTable dtResult = new DataTable();

            try
            {
                DataSet dsTmp = this.GetDataSetFromCommand(command);
                dtResult = dsTmp.Tables[0];
                dsTmp.Tables.Clear();
            }
            catch (DALCoreException e)
            {
                throw e;
            }

            return dtResult;
        }

        /// <summary>
        /// ��ȡ���ݱ�
        /// </summary>
        /// <param name="sqlCmd">�����ı�</param>
        /// <returns></returns>
        public virtual DataTable GetDataTableFromCommand(string sqlCmd)
        {
            DataTable dtResult = new DataTable();

            try
            {
                if (this._command != null)
                {
                    this._command.CommandText = sqlCmd;
                    this._command.Connection = this.Connection;
                    dtResult = this.GetDataTableFromCommand(this._command);
                }
                else
                {
                    throw new DALCoreException("the_command_is_not_initialized");  //Ϊ��ʼ���������
                }
            }
            catch (DALCoreException e)
            {
                throw e;
            }

            return dtResult;
        }

        /// <summary>
        /// ȡ�ô洢���������װ��
        /// </summary>
        /// <returns></returns>
        //public abstract IDBCommandWrapper<> GetStoredProcCommandWrapper();

        /// <summary>
        /// ȡ��SQL�����ı���װ��
        /// </summary>
        /// <returns></returns>
        //public abstract IDBCommandWrapper GetSqlCommandWithParametersWrapper(string sqlCmd ,IDictionary<string,object> parameters);

        /// <summary>
        /// �������ݿ�����
        /// </summary>
        public abstract void BeginTransaction();

        #region IDBSession ��Ա

        public virtual void InitDataSource()
        {
            throw new System.Exception("The method or operation is not implemented.");
        }

        public virtual void InitDataSourceByName(string cfgName)
        {
            throw new System.Exception("The method or operation is not implemented.");
        }

        public virtual IDbCommand CreateCommand(string sqlCmdText)
        {
            throw new System.Exception("The method or operation is not implemented.");
        }

        #endregion
    }
}