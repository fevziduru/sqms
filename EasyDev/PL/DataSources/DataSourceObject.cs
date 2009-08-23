using System.Data.Common;

namespace EasyDev.PL
{
    /// <summary>
    /// ����Դ����
    /// <remarks>
    /// ����Դ����ͨ��DbProviderFactory����ͨ�õ�ADO.NET����
    /// </remarks>
    /// </summary>
    public class DataSourceObject : IDataSourceObject
    {
        private DbProviderFactory providerFactory = null;

        private string providerName = string.Empty;

        /// <summary>
        /// �����ṩ��������
        /// </summary>
        public string ProviderName
        {
            get { return this.providerName; }
            set { this.providerName = value; }
        }

        /// <summary>
        /// ���췽��
        /// </summary>
        /// <param name="factory"></param>
        public DataSourceObject(DbProviderFactory factory)
        {
            this.providerFactory = factory;
        }

        /// <summary>
        /// ����ͨ���������Ӷ���
        /// </summary>
        /// <returns></returns>
        public DbConnection GetDBConnection()
        {
            return this.providerFactory.CreateConnection();
        }

        /// <summary>
        /// ����ͨ�ò�������
        /// </summary>
        /// <returns></returns>
        public DbParameter GetDBParameter()
        {
            return this.providerFactory.CreateParameter();
        }

        /// <summary>
        /// ����ͨ���������
        /// </summary>
        /// <returns></returns>
        public DbCommand GetDBCommand()
        {
            return this.providerFactory.CreateCommand();
        }

        /// <summary>
        /// ����ͨ���������
        /// </summary>
        /// <returns></returns>
        public DbCommandBuilder GetDBCommandBuilder()
        {
            return this.providerFactory.CreateCommandBuilder();
        }

        /// <summary>
        /// ����ͨ����������������
        /// </summary>
        /// <returns></returns>
        public DbDataAdapter GetDBDataAdapter()
        {
            return this.providerFactory.CreateDataAdapter();
        }
    }
}
