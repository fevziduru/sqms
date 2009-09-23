using System.Data;
using System.Data.Common;
using System;
using System.Text.RegularExpressions;
using EasyDev.Configuration;
using System.Collections.Generic;
using EasyDev.Util;

namespace EasyDev.PL
{
        /// <summary>
        /// ���ݿ����ӵĹ�������
        /// </summary>
        public class GenericDBSession : IGenericDBSession
        {
                private string sessionId = "";

                #region IGenericDBSession ��Ա

                public string SessionID
                {
                        get
                        {
                                return sessionId;
                        }
                        set
                        {
                                sessionId = value;
                        }
                }

                #endregion
                /// <summary>
                /// ����Դ����
                /// </summary>
                protected string dataSourceName = "";

                /// <summary>
                /// �����ַ��� 
                /// </summary>
                protected string connectionString = "";

                /// <summary>
                /// ���ݿ��������
                /// </summary>
                protected DbTransaction _transaction = null;

                /// <summary>
                /// ����ֵ������
                /// </summary>
                public IGenerator IdentityGenerator
                {
                        get;
                        set;
                }

                private PersistenceConfigManager ConfigManager
                {
                        get;
                        set;
                }

                /// <summary>
                /// ����Դ����
                /// </summary>
                private DataSourceObject DataSource
                {
                        get;
                        set;
                }

                /// <summary>
                /// ��ǰʹ�õ����ݿ��ṩ����
                /// </summary>
                public string CurrentDbProvider
                {
                        get;
                        set;
                }

                /// <summary>
                /// �����ַ���
                /// </summary>
                public virtual string ConnectionString
                {
                        get;
                        set;
                }

                /// <summary>
                /// ����������
                /// </summary>
                public DbDataAdapter DataAdapter
                {
                        get;
                        set;
                }

                private DbConnection _connection;

                /// <summary>
                /// �������ݿ�����
                /// </summary>
                public DbConnection Connection
                {
                        get
                        {
                                if (this._connection == null)
                                {
                                        throw new DALCoreException("the_connection_is_not_initialized");
                                }
                                return this._connection;
                        }
                        set
                        {
                                this._connection = value;
                        }
                }

                /// <summary>
                /// ͨ�������������
                /// </summary>
                public DbCommand Command
                {
                        get;
                        set;
                }

                /// <summary>
                /// ȡ�����ݿ�Ự״̬
                /// </summary>
                public virtual ConnectionState SessionState
                {
                        get
                        {
                                if (this.Connection != null)
                                {
                                        return this.Connection.State;
                                }
                                else
                                {
                                        throw new DALCoreException("");
                                }
                        }
                }

                /// <summary>
                /// ���췽��
                /// </summary>
                /// <param name="_datasource"></param>
                public GenericDBSession(DataSourceObject _datasource, PersistenceConfigManager _cfg)
                {
                        DataSource = _datasource;
                        ConfigManager = _cfg;

                        Connection = DataSource.GetDBConnection();
                        DataAdapter = DataSource.GetDBDataAdapter();
                        Command = DataSource.GetDBCommand();

                        foreach (IDataSource providerItem in ConfigManager.DataSources.Values)
                        {
                                if (DataSource.ProviderName == providerItem.Name)
                                {
                                        this.Connection.ConnectionString = providerItem.ConnectionString;
                                        CurrentDbProvider = providerItem.ProviderType;
                                        break;
                                }
                        }

                        if (CurrentDbProvider.Equals("System.Data.OracleClient", StringComparison.CurrentCultureIgnoreCase) ||
                                CurrentDbProvider.Equals("Oracle.DataAccess.Client", StringComparison.CurrentCultureIgnoreCase))
                        {
                                IdentityGenerator = GeneratorFactory.CreateGenerator<OracleSequenceGenerator>();
                                ((OracleSequenceGenerator)IdentityGenerator).TableName = "";
                                ((OracleSequenceGenerator)IdentityGenerator).Session = this;
                        }
                        else
                        {
                                IdentityGenerator = GeneratorFactory.CreateGenerator<CommonIdentityGenerator>();
                        }
                }

                /// <summary>
                /// �������ݿ����ӻỰ
                /// </summary>
                public virtual void OpenSession()
                {
                        OpenSession(false);
                }

                /// <summary>
                /// �������ݿ�Ự
                /// </summary>
                /// <param name="withTrans">ΪTRUE��ʾ�ڿ����Ự��ʱ��ͬʱ��ʼ����</param>
                public virtual void OpenSession(bool withTrans)
                {
                        try
                        {
                                if (this.Connection.State == ConnectionState.Closed)
                                {
                                        this.Connection.Open();
                                        if (withTrans)
                                        {
                                                this._transaction = this.Connection.BeginTransaction();
                                        }
                                }
                        }
                        catch (DALCoreException e)
                        {
                                throw e;
                        }
                }

                /// <summary>
                /// ���ò�������ѯ����
                /// </summary>
                /// <param name="commandText">����������</param>
                /// <param name="paramValues">����ֵ�б�</param>
                public virtual void PrepareParameterizedCommand(string commandText, params object[] paramValues)
                {
                        try
                        {
                                MatchCollection collection = null;

                                if (CurrentDbProvider.Equals("System.Data.OracleClient", StringComparison.CurrentCultureIgnoreCase) ||
                                    CurrentDbProvider.Equals("Oracle.DataAccess.Client", StringComparison.CurrentCultureIgnoreCase))
                                {
                                        collection = Regex.Matches(commandText, "[^\\w*]:\\w+", RegexOptions.Multiline | RegexOptions.IgnoreCase);
                                }
                                else
                                {
                                        collection = Regex.Matches(commandText, "@\\w+", RegexOptions.Multiline | RegexOptions.IgnoreCase);
                                }

                                if (collection.Count == 0)
                                {
                                        throw new ArgumentException("commandText_is_not_a_parameterized_query");
                                }

                                if (collection.Count > paramValues.Length)
                                {
                                        throw new ArgumentException("too_many_parameters");
                                }

                                Command.CommandText = commandText;

                                for (int i = 0; i < collection.Count; i++)
                                {

                                        DbParameter parameter = DataSource.GetDBParameter();
                                        parameter.Direction = ParameterDirection.Input;
                                        parameter.ParameterName = collection[i].ToString().Substring(collection[i].ToString().IndexOf(":"));
                                        parameter.Value = paramValues[i];

                                        if (CurrentDbProvider.Equals("System.Data.OracleClient", StringComparison.CurrentCultureIgnoreCase) ||
                                            CurrentDbProvider.Equals("Oracle.DataAccess.Client", StringComparison.CurrentCultureIgnoreCase))
                                        {
                                                parameter.SourceColumn = collection[i].ToString().Substring(collection[i].ToString().IndexOf(":") + 1);
                                        }
                                        else
                                        {
                                                parameter.SourceColumn = collection[i].ToString().Replace("@", "");
                                        }

                                        Command.Parameters.Add(parameter);
                                }
                        }
                        catch (ArgumentException e)
                        {
                                ResetCommand();
                                throw e;
                        }
                }

                /// <summary>
                /// ���ò�������ѯ����
                /// </summary>
                /// <param name="commandText"></param>
                /// <param name="paramValues"></param>
                public virtual void PrepareParameterizedCommand(string commandText, IDictionary<string, object> paramValues)
                {
                        try
                        {
                                MatchCollection collection = null;

                                if (CurrentDbProvider.Equals("System.Data.OracleClient", StringComparison.CurrentCultureIgnoreCase) ||
                                    CurrentDbProvider.Equals("Oracle.DataAccess.Client", StringComparison.CurrentCultureIgnoreCase))
                                {
                                        collection = Regex.Matches(commandText, "[^\\w*]:\\w+", RegexOptions.Multiline);
                                }
                                else
                                {
                                        collection = Regex.Matches(commandText, "@\\w+", RegexOptions.Multiline);
                                }

                                if (collection.Count == 0)
                                {
                                        throw new ArgumentException("commandText_is_not_a_parameterized_query");
                                }

                                if (collection.Count > paramValues.Count)
                                {
                                        throw new ArgumentException("too_many_parameters");
                                }

                                Command.CommandText = commandText;

                                for (int i = 0; i < collection.Count; i++)
                                {

                                        DbParameter parameter = DataSource.GetDBParameter();
                                        parameter.Direction = ParameterDirection.Input;
                                        parameter.ParameterName = collection[i].ToString();

                                        if (CurrentDbProvider.Equals("System.Data.OracleClient", StringComparison.CurrentCultureIgnoreCase) ||
                                            CurrentDbProvider.Equals("Oracle.DataAccess.Client", StringComparison.CurrentCultureIgnoreCase))
                                        {
                                                parameter.SourceColumn = collection[i].ToString().Replace(":", "");
                                        }
                                        else
                                        {
                                                parameter.SourceColumn = collection[i].ToString().Replace("@", "");
                                        }
                                        parameter.Value = paramValues[parameter.SourceColumn];

                                        Command.Parameters.Add(parameter);
                                }
                        }
                        catch (ArgumentException e)
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
                                if (this.Connection.State == ConnectionState.Open)
                                {
                                        this.Connection.Close();
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
                                if (this.Command != null)
                                {
                                        this.Command.CommandText = sqlCmd;
                                        if (this.Connection != null)
                                        {
                                                this.Command.Connection = this.Connection;
                                        }
                                        else
                                        {
                                                throw new DALCoreException("command_no_connection");    //�������û�ж�Ӧ�����ݿ�������Ϣ
                                        }

                                        this.OpenSession(true);
                                        this.Command.Transaction = this._transaction;    //��ʼ������������������
                                        result = this.Command.ExecuteNonQuery();

                                        if (this._transaction != null)
                                        {
                                                this._transaction.Commit();
                                        }
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
                                ResetCommand();
                                this.Connection.Close();                                                    //�ر�����
                        }

                        return result;
                }

                /// <summary>
                /// ִ�в�������ѯ����������в����������׳�ArgumentException�쳣
                /// </summary>
                /// <param name="sqlCmd">����������</param>
                /// <param name="values">����ֵ�б�</param>
                /// <returns>��Ӱ�������</returns>
                public virtual int ExecuteCommand(string sqlCmd, params object[] values)
                {
                        if (values != null && values.Length > 0)
                        {
                                PrepareParameterizedCommand(sqlCmd, values);
                                return Execute();
                        }
                        else
                        {
                                return ExecuteCommand(sqlCmd);
                        }
                }

                /// <summary>
                /// ִ�в�������ѯ����������в����������׳�ArgumentException�쳣
                /// </summary>
                /// <param name="sqlCmd"></param>
                /// <param name="values"></param>
                /// <returns></returns>
                public virtual int ExecuteCommand(string sqlCmd, IDictionary<string, object> values)
                {
                        if (values != null && values.Count > 0)
                        {
                                PrepareParameterizedCommand(sqlCmd, values);
                                return Execute();
                        }
                        else
                        {
                                return ExecuteCommand(sqlCmd);
                        }
                }

                public virtual int Execute()
                {
                        return ExecuteCommand();
                }

                /// <summary>
                /// ִ��SQL����
                /// </summary>
                /// <returns>SQL����Ӱ������</returns>
                public virtual int ExecuteCommand()
                {
                        int result = -1;
                        try
                        {
                                this.Command.Connection = this.Connection;
                                if (this.Command.Connection == null)
                                {
                                        throw new DALCoreException("no_connection");
                                }

                                if (this.Command.CommandText.Length > 0)
                                {
                                        this.Connection.Open();                                                     //�������ݿ�����
                                        this.OpenSession(true);

                                        result = this.Command.ExecuteNonQuery();

                                        //if (this._transaction != null)
                                        //{
                                        //    this._transaction.Commit();
                                        //}
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
                                ResetCommand();
                                this.Connection.Close();      //�ر����ݿ�����
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
                                if (this.Command != null)
                                {
                                        this.Command.CommandText = sqlCmd;
                                        this.Command.Connection = this.Connection;

                                        this.OpenSession();

                                        return this.Command.ExecuteReader(CommandBehavior.CloseConnection);
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
                                ResetCommand();
                                this.CloseSession();
                        }
                }

                /// <summary>
                /// �����������õ�һ�����ݼ�¼�α�
                /// </summary>
                /// <returns></returns>
                public virtual IDataReader GetDataReader()
                {
                        return GetDataReaderFromCommand();
                }

                /// <summary>
                /// �����������õ�һ�����ݼ�¼�α�
                /// </summary>
                /// <returns></returns>
                public virtual IDataReader GetDataReaderFromCommand()
                {
                        try
                        {
                                this.Command.Connection = this.Connection;
                                if (this.Command.Connection == null)
                                {
                                        throw new DALCoreException("no_connection");
                                }

                                if (this.Command.CommandText.Length > 0)
                                {
                                        this.OpenSession();
                                        return this.Command.ExecuteReader(CommandBehavior.CloseConnection);
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
                                ResetCommand();
                                this.CloseSession();
                        }
                }

                public virtual IDataReader GetDataReaderFromCommand(string sqlCmd, params object[] paramValues)
                {
                        if (paramValues != null && paramValues.Length > 0)
                        {
                                PrepareParameterizedCommand(sqlCmd, paramValues);
                                return GetDataReaderFromCommand();
                        }
                        else
                        {
                                return GetDataReaderFromCommand(sqlCmd);
                        }
                }

                private void ResetCommand()
                {
                        Command.Parameters.Clear();
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
                                if (this.Command != null)
                                {
                                        this.Command.CommandText = sqlCmd;
                                        this.Command.Connection = this.Connection;

                                        this.OpenSession();

                                        return this.Command.ExecuteScalar();
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
                                ResetCommand();
                                this.CloseSession();
                        }
                }

                /// <summary>
                /// ȡ�ý�����е�һ�е�һ�е�ֵ���Զ������ͷ���
                /// </summary>
                /// <returns></returns>
                public virtual object GetScalarObject()
                {
                        return GetScalarObjectFromCommand();
                }

                /// <summary>
                /// ȡ�ý�����е�һ�е�һ�е�ֵ���Զ������ͷ���
                /// </summary>
                /// <returns></returns>
                public virtual object GetScalarObjectFromCommand()
                {
                        try
                        {
                                this.Command.Connection = this.Connection;
                                if (this.Command.Connection == null)
                                {
                                        throw new DALCoreException("no_connection");
                                }

                                if (this.Command.CommandText.Length > 0)
                                {
                                        this.OpenSession();

                                        return this.Command.ExecuteScalar();
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
                                ResetCommand();
                                this.CloseSession();
                        }
                }

                /// <summary>
                /// ��������ѯ��ȡ�ý�����е�һ�е�һ�е�ֵ���Զ������ͷ���
                /// </summary>
                /// <param name="sqlCmd">��������SQL</param>
                /// <param name="paramValues">����ֵ</param>
                /// <returns></returns>
                public virtual object GetScalarObjectFromCommand(string sqlCmd, params object[] paramValues)
                {
                        if (paramValues != null && paramValues.Length > 0)
                        {
                                PrepareParameterizedCommand(sqlCmd, paramValues);
                                return GetScalarObjectFromCommand();
                        }
                        else
                        {
                                return GetScalarObjectFromCommand(sqlCmd);
                        }
                }

                /// <summary>
                /// ��ȡ���ݼ�
                /// </summary>
                /// <param name="sqlCmd">SQL�����ı�</param>
                /// <returns></returns>
                public virtual DataSet GetDataSetFromCommand(string sqlCmd)
                {
                        DataSet ds = new DataSet();
                        try
                        {
                                if (this.Command != null)
                                {
                                        this.Command.CommandText = sqlCmd;
                                        this.Command.Connection = this.Connection;

                                        if (this.DataAdapter != null)
                                        {
                                                this.DataAdapter.SelectCommand = this.Command;
                                                this.DataAdapter.Fill(ds);
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
                        finally
                        {
                                ResetCommand();
                        }

                        return ds;
                }

                /// <summary>
                /// ��ȡ���ݼ�
                /// </summary>
                /// <returns></returns>
                public virtual DataSet GetDataSet()
                {
                        return GetDataSetFromCommand();
                }

                /// <summary>
                /// ��ȡ���ݼ�
                /// </summary>
                /// <returns></returns>
                public virtual DataSet GetDataSetFromCommand()
                {
                        DataSet ds = new DataSet();

                        try
                        {
                                this.Command.Connection = this.Connection;
                                if (this.Command.Connection == null)
                                {
                                        throw new DALCoreException("no_connection");
                                }

                                if (this.Command.CommandText.Length > 0)
                                {
                                        if (this.DataAdapter != null)
                                        {
                                                this.DataAdapter.SelectCommand = this.Command;

                                                this.DataAdapter.Fill(ds);
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
                        finally
                        {
                                ResetCommand();
                        }

                        return ds;
                }

                /// <summary>
                /// ��ȡ���ݼ�
                /// </summary>
                /// <param name="sqlCmd">��������ѯ</param>
                /// <param name="paramValues">����ֵ</param>
                /// <returns></returns>
                public virtual DataSet GetDataSetFromCommand(string sqlCmd, params object[] paramValues)
                {
                        if (paramValues != null && paramValues.Length > 0)
                        {
                                PrepareParameterizedCommand(sqlCmd, paramValues);
                                return GetDataSetFromCommand();
                        }
                        else
                        {
                                return GetDataSetFromCommand(sqlCmd);
                        }
                }

                /// <summary>
                /// ��ȡ���ݱ�
                /// </summary>
                /// <returns></returns>
                public virtual DataTable GetDataTable()
                {
                        return GetDataTableFromCommand();
                }

                /// <summary>
                /// ��ȡ���ݱ�
                /// </summary>
                /// <param name="command">�������</param>
                /// <returns></returns>
                public virtual DataTable GetDataTableFromCommand()
                {
                        DataTable dtResult = new DataTable();

                        try
                        {
                                DataSet dsTmp = this.GetDataSetFromCommand();
                                dtResult = dsTmp.Tables[0];
                                dsTmp.Tables.Clear();
                        }
                        catch (DALCoreException e)
                        {
                                throw e;
                        }
                        finally
                        {
                                ResetCommand();
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
                                if (this.Command != null)
                                {
                                        this.Command.CommandText = sqlCmd;
                                        this.Command.Connection = this.Connection;
                                        dtResult = this.GetDataTableFromCommand();
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
                        finally
                        {
                                ResetCommand();
                        }

                        return dtResult;
                }

                /// <summary>
                /// ��ȡ���ݱ�
                /// </summary>
                /// <param name="sqlCmd">��������ѯ����</param>
                /// <param name="paramValues">����ֵ</param>
                /// <returns></returns>
                public virtual DataTable GetDataTableFromCommand(string sqlCmd, params object[] paramValues)
                {
                        if (paramValues != null && paramValues.Length > 0)
                        {
                                PrepareParameterizedCommand(sqlCmd, paramValues);
                                return GetDataTableFromCommand();
                        }
                        else
                        {
                                return GetDataTableFromCommand(sqlCmd);
                        }
                }

                /// <summary>
                /// �������ݿ�����
                /// </summary>
                public void BeginTransaction()
                {
                        this._transaction = this.Connection.BeginTransaction();
                }

                /// <summary>
                /// ȡ����һ������
                /// </summary>
                /// <param name="tableName"></param>
                /// <returns></returns>
                public virtual string GetNextID(string tableName)
                {
                        return ConvertUtil.ToStringOrDefault(GetScalarObjectFromCommand(
                                string.Format(@"SELECT SEQ_{0}.nextval FROM dual", tableName)));
                }
        }
}