using System;
using System.Collections.Generic;
using EasyDev.Configuration;
using System.Data;
using System.IO;
using EasyDev.PL;

namespace EasyDev.BL
{
    /// <summary>
    /// ҵ����󹤳�������ͨ��ҵ�����
    /// </summary>
    public class BizObjectFactory
    {
        private PersistenceConfigManager configMgr = null;

        private string schemeDir = "";

        private GenericDBSession session = null;

        /// <summary>
        /// ����֧��MSSqlServer2005��Schema
        /// </summary>
        public string Namespace { get; set; }

        /// <summary>
        /// Ӧ�����ƣ����Լ��ڼܹ�����ǰ��Ϊ�ܹ��ļ��������ռ��ֹ���Ӧ�üܹ��ļ�ͬ��
        /// </summary>
        public string ApplicationName { get; set; }

        /// <summary>
        /// ������
        /// </summary>
        private BizObjectFactory(GenericDBSession session)
        {
            this.configMgr = PersistenceConfigManager.GetInstance();
            this.schemeDir = this.configMgr.SchemaDir;
            this.session = session;
        }

        /// <summary>
        /// ����֧��MSSqlServer2005��Schema
        /// </summary>
        /// <param name="_namespace"></param>
        private BizObjectFactory(string _namespace, GenericDBSession session)
        {
            this.configMgr = PersistenceConfigManager.GetInstance();
            this.schemeDir = this.configMgr.SchemaDir;
            this.Namespace = _namespace;
            this.session = session;
        }

        /// <summary>
        /// ��ʼ��BizObjectFactoryʵ��
        /// </summary>
        /// <returns></returns>
        public static BizObjectFactory GetInstance(GenericDBSession session)
        {
            return new BizObjectFactory(session);
        }

        /// <summary>
        /// ����֧��MSSqlServer2005��Schema
        /// </summary>
        /// <param name="_namespace"></param>
        /// <param name="session"></param>
        /// <returns></returns>
        public static BizObjectFactory GetInstance(string _namespace, GenericDBSession session)
        {
            return new BizObjectFactory(_namespace, session);
        }

        /// <summary>
        /// ���ݼܹ���Ϣ�������ݴ������
        /// </summary>
        /// <param name="scheme"></param>
        /// <returns></returns>
        public IGenericBizObject CreateBizObject(string schema)
        {
            return this.CreateBizObject<DataSet>(this.session, null, schema);
        }

        /// <summary>
        /// ����ͨ��ҵ�����
        /// </summary>
        /// <param name="_namespace"></param>
        /// <param name="schema"></param>
        /// <returns></returns>
        public IGenericBizObject CreateBizObject(string _namespace, string schema)
        {
            return this.CreateBizObject<DataSet>(this.session, _namespace, schema);
        }

        /// <summary>
        /// ����ǿ�������ݼ�(ǿ������ģ��)
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="session"></param>
        /// <param name="schema"></param>
        /// <returns></returns>
        private GenericBizObject<T> CreateBizObject<T>(GenericDBSession session, string schema)
            where T : DataSet
        {
            return CreateBizObject<T>(session, this.Namespace, schema);
        }

        public GenericBizObject<T> CreateBizObject<T>(string schema)
            where T : DataSet
        {
            return CreateBizObject<T>(this.session, schema);
        }

        /// <summary>
        /// ����ͨ��ҵ�����
        /// </summary>
        /// <typeparam name="T">ҵ������е�����ʵ������</typeparam>
        /// <param name="session"></param>
        /// <param name="_namespace"></param>
        /// <param name="schema"></param>
        /// <returns></returns>
        public GenericBizObject<T> CreateBizObject<T>(GenericDBSession session, string _namespace, string schema)
            where T : DataSet
        {
            GenericBizObject<T> instanceDto = null;
            DataSet dsTemp = null;

            //����֧��MSSqlServer2005��Schema,fullName��ʾSchema.TableName
            string fullName = string.Empty;
            try
            {
                if (string.IsNullOrEmpty(_namespace) == false)
                {
                    fullName = _namespace + "." + schema;
                }
                else
                {
                    fullName = schema;
                }

                string filePath = "";
                if (string.IsNullOrEmpty(this.ApplicationName))
                {
                    filePath = this.schemeDir + @"\" + schema + ".xsd";
                }
                else
                {
                    filePath = this.schemeDir + @"\" + this.ApplicationName + @"\" + schema + ".xsd";
                }

                if (File.Exists(filePath))
                {
                    if (typeof(T).Name == "DataSet")
                    {
                        dsTemp = new DataSet();
                        dsTemp.ReadXmlSchema(filePath);
                    }
                    else
                    {
                        dsTemp = (DataSet)Activator.CreateInstance(typeof(T));
                    }
                }
                else
                {
                    throw new PersistenceException("_missing_scheme_file");
                }

                instanceDto = new GenericBizObject<T>((T)dsTemp, session, schema);
                instanceDto.Entity = schema;
                instanceDto.FullName = fullName;
                instanceDto.Schema = filePath;
            }
            catch (PersistenceException e)
            {
                throw e;
            }

            return instanceDto;
        }
    }
}
