using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.Configuration
{
    public interface IDataSource
    {
        string Name { get; set; }
        string ProviderType { get; set; }
        string ConnectionString { get; set; }
    }
}
