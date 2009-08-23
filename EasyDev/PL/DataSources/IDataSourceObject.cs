using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;

namespace EasyDev.PL
{
    /// <summary>
    /// ����Դ����ӿ�
    /// </summary>
    public interface IDataSourceObject
    {
        DbConnection GetDBConnection();

        DbParameter GetDBParameter();

        DbCommand GetDBCommand();

        DbCommandBuilder GetDBCommandBuilder();

        DbDataAdapter GetDBDataAdapter();
    }
}
