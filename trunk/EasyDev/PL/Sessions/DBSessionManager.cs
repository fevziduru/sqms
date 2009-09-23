using EasyDev.Configuration;
using EasyDev.PL;
using System.Xml;
using System.Collections;
using System;
using System.Collections.Generic;

namespace EasyDev.PL
{
    /// <summary>
    /// ���ݿ�Ự������������ͨ�����ô������ݿ�Ự����
    /// </summary>
    public class DBSessionManager
    {   
        #region IDBSessionManager ��Ա

        /// <summary>
        /// �������ڳ�ʼ��SessionManager�����Provider�������ݿ�Ự����
        /// </summary>
        /// <param name="_datasource">datasource����</param>
        /// <returns></returns>
        public static GenericDBSession CreateDBSession(DataSourceObject _datasource)
        {
            try
            {
                return new GenericDBSession(_datasource, PersistenceConfigManager.GetInstance());
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        #endregion
    }
}
