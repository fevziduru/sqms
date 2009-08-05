using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using System.Data;
using EasyDev.PL;

namespace EasyDev.PL
{
    public class DataSourceObject : IDataSourceObject
    {
        private DbProviderFactory providerFactory = null;

        private string providerName = string.Empty;

        public string ProviderName
        {
            get { return this.providerName; }
            set { this.providerName = value; }
        }

        public DataSourceObject(DbProviderFactory factory)
        {
            this.providerFactory = factory;
        }

        public DbConnection GetDBConnection()
        {
            return this.providerFactory.CreateConnection();
        }

        public DbParameter GetDBParameter()
        {
            return this.providerFactory.CreateParameter();
        }

        public DbCommand GetDBCommand()
        {
            return this.providerFactory.CreateCommand();
        }

        public DbCommandBuilder GetDBCommandBuilder()
        {
            return this.providerFactory.CreateCommandBuilder();
        }

        public DbDataAdapter GetDBDataAdapter()
        {
            return this.providerFactory.CreateDataAdapter();
        }
    }
}
