using System;
using System.Reflection;
using System.Configuration;
using EasyDev.DAL.Sessions;
using System.Runtime.Remoting;
using EasyDev.PL;
using EasyDev.Util;

namespace EasyDev.DAL
{
    public enum AssemblyNameSource 
    {
        FromString,
        FromConfiguration
    }

    /// <summary>
    /// ���ݿ����ӹ�����
    /// </summary>
    public class GenericDBFactory
    {
        /// <summary>
        /// ͬ��������
        /// </summary>
        private static object _lockHelper = new object();

        /// <summary>
        /// ������ʵ��
        /// </summary>
        private static GenericDBFactory _instance = null;

        #region ��������

        public MSSqlSession MSSqlSession
        {
            get
            {
                return this.CreateDBSession<MSSqlSession>();
            }
        }

        public OracleSession OracleSession
        {
            get
            {
                return this.CreateDBSession<OracleSession>();
            }
        }

        public AccessSession AccessSession
        {
            get
            {
                return this.CreateDBSession<AccessSession>();
            }
        }

        #endregion

        protected GenericDBFactory()
        { }

        /// <summary>
        /// ȡ�ù�����ʵ��
        /// </summary>
        public static GenericDBFactory GetInstance()
        {            
            if (_instance == null)
            {
                lock (_lockHelper)
                {
                    if (_instance == null)
                    {
                        _instance = new GenericDBFactory();
                    }
                }
            }
    
            return _instance;
        }

        /// <summary>
        /// ����MSSQL���ݿ�Ự
        /// </summary> 
        /// <param name="dataSourceName"></param>
        /// <returns></returns>
        public MSSqlSession CreateMSSqlSessionByName(string dataSourceName)
        {
            return new MSSqlSession(dataSourceName);
        }

        /// <summary>
        /// ����Oracle���ݿ�Ự
        /// </summary>
        /// <param name="dataSourceName"></param>
        /// <returns></returns>
        public OracleSession CreateOracleSessionByName(string dataSourceName)
        {
            return new OracleSession(dataSourceName);
        }

        /// <summary>
        /// ����Access���ݿ�Ự
        /// </summary>
        /// <param name="dataSourceName"></param>
        /// <returns></returns>
        public AccessSession CreateAccessSessionByName(string dataSourceName)
        {
            return new AccessSession(dataSourceName);
        }

        /// <summary>
        /// (���ͷ���) ����DBSession��������������ʵ��IDBSession�ӿڣ�����Session�������Ҫ���޲����Ĺ������캯��
        /// </summary>
        /// <typeparam name="T">��������</typeparam>
        /// <param name="dataSourceName">λ�������ļ��е�����Դ����</param>
        /// <returns>��Ӧ�������͵�ʵ��������</returns>
        public T CreateDBSession<T>() 
            where T : IDBSession, new()
        {
            return new T();
        }

        /// <summary>
        /// ���ݳ������ƶ�̬���س��򼯲���ʵ�������ݷ��ʶ���
        /// ���ݼ��е����ݷ��ʶ������ʵ��IDBSession�ӿ�
        /// </summary>
        /// <typeparam name="T">��������</typeparam>
        /// <param name="name">��������</param>
        /// <param name="source">������������(�����ַ����������ַ���)</param>
        /// <returns>��Ӧ�������͵�ʵ��������</returns>
        public T CreateDBSession<T>(string name,AssemblyNameSource source) 
            where T : IDBSession, new()
        {
            Assembly assembly = null;

            try
            {
                string assemblyName = "";

                if (source == AssemblyNameSource.FromConfiguration)
                {
                    assemblyName = ConvertUtil.ConvertToString(ConfigurationManager.AppSettings[name]);
                }
                else if (source == AssemblyNameSource.FromString)
                {
                    assemblyName = name;
                }
                else
                {
                    throw new DALCoreException("assembly_name_is_not_allowed"); //����������Դ���Ϸ�
                }

                //���ݳ������ƴ�����������
                assembly = Assembly.Load(new AssemblyName(assemblyName));
                T component = Activator.CreateInstance<T>();

                //�ж��ⲿ���ݷ�������Ƿ�̳���DBSessionBase������������׳��쳣
                if ((component is DBSessionBase) == false)
                {
                    throw new DALCoreException("DAComponent_must_be_derived_from_DBSessionBase");    //���ݷ����������̳���DBSessionBase
                }

                return component;
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// �������ʹ��������ݿ�Ự����
        /// </summary>
        /// <param name="type">���ʹ�</param>
        /// <returns>����IDBSession���Ͷ���</returns>
        public IDBSession CreateDBSession(string type)
        {
            ObjectHandle handle = null;
            try
            {
                if (string.IsNullOrEmpty(type) || type.IndexOf(',') == -1)
                {
                    throw new DALCoreException("_type_is_not_vaild");
                }
                string[] assemblyInfo = type.Split(',');
                handle = Activator.CreateInstance(assemblyInfo[1], assemblyInfo[0]);
            }
            catch (DALCoreException e)
            {
                throw e;
            }

            return (IDBSession)handle.Unwrap();
        }
        
        /// <summary>
        /// ���÷��䴴�����ݷ��ʶ���
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="assemblyName">��������</param>
        /// <param name="typeName">��������</param>
        /// <returns></returns>
        public T CreateDBSession<T>(string assemblyName, string typeName) where T : IDBSession
        {
            try
            {
                ObjectHandle handle = Activator.CreateInstance(assemblyName,typeName);
                
                T component = (T)handle.Unwrap();
                
                if ((component is DBSessionBase) == false)
                {
                    throw new DALCoreException("DAComponent_must_be_derived_from_DBSessionBase");    //���ݷ����������̳���DBSessionBase
                }

                return component;
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }

        /// <summary>
        /// ����Web.Config�е����������ַ����������ݿ�Ự����
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="cfgName">������web.config�ļ���AppSetting�ڵ����ݿ����Ӵ�</param>
        /// <returns></returns>
        public T CreateDBSessionByConfig<T>(string cfgName) where T : IDBSession
        {
            string[] cfg = null;
            string assemblyName = "";
            string typeName = "";

            try
            {                
                if (string.IsNullOrEmpty(ConvertUtil.ConvertToString(ConfigurationManager.AppSettings[cfgName])) == false)
                {
                    cfg = ConvertUtil.ConvertToString(ConfigurationManager.AppSettings[cfgName]).Split(new char[] { ',' });
                }
                else
                {
                    throw new DALCoreException("_there_is_not_configuration_for_session");
                }

                if (cfg != null && cfg.Length >= 2)
                {
                    assemblyName = cfg[0];
                    typeName = cfg[1];
                }
                else
                {
                    throw new ArgumentException("_there_is_not_enough_configuration", "in_method_CreateDBSession<T>(string cfgName)");
                }

                return this.CreateDBSession<T>(assemblyName, typeName);
            }
            catch (DALCoreException e)
            {
                throw e;
            }
        }
    }
}
