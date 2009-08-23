using System;
using System.Data;

namespace EasyDev.Configuration
{
    public sealed class DataSource : IDataSource
    {
        public string Name
        {
            get;
            set;
        }

        public string ProviderType
        {
            get;
            set;
        }

        public string ConnectionString
        {
            get;
            set;
        }        
    }
}
