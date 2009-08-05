﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.PL;
using EasyDev.Resources;
using System.Data;
using System.Web.Caching;
using System.Web;

namespace EasyDev.BL.Services
{
    /// <summary>
    /// 通用服务
    /// </summary>
    public class GenericService : IService
    {
        #region 私有成员
        /// <summary>
        /// 业务对象
        /// </summary>
        private IGenericBizObject bizObject = null;

        /// <summary>
        /// 业务对象工厂
        /// </summary>
        private BizObjectFactory boFactory = null;

        /// <summary>
        /// 本地服务管理器
        /// </summary>
        private NativeServiceManager serviceManager = null;

        /// <summary>
        /// 数据源对象
        /// </summary>
        private DataSourceObject datasource = null;

        /// <summary>
        /// 本地化/国际化对象创建工厂
        /// </summary>
        private ResourceManagerFactory resMgrFactory = null;

        private Cache SessionPool
        {
            get;
            set;
        }

        /// <summary>
        /// 根据名称创建SESSION
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public virtual GenericDBSession GetSession(string name)
        {
            GenericDBSession session = null;

            lock (SessionPool)
            {
                session = SessionPool.Get(name) as GenericDBSession;
                if (session == null)
                {
                    session = DBSessionManager.CreateDBSession(
                        DataSourceManager.CreateDataSource(name)); //数据访问对象

                    SessionPool.Insert("DEFAULT_SESSION", session);
                }
            }

            return session;
        }

        #endregion

        #region 公共属性
        /// <summary>
        /// 本地化/国际化对象
        /// </summary>
        public ResourceManagerFactory ResourceManagerCreator
        {
            get
            {
                return this.resMgrFactory;
            }
        }

        /// <summary>
        /// 服务管理器
        /// </summary>
        public NativeServiceManager ServiceManager
        {
            get
            {
                return this.serviceManager;
            }
        }

        /// <summary>
        /// 业务对象名称
        /// </summary>
        public string BOName
        {
            get;
            set;
        }

        /// <summary>
        /// 业务对象
        /// </summary>
        //protected IGenericBizObject BO
        //{
        //    get
        //    {
        //        return this.bizObject;
        //    }
        //}

        /// <summary>
        /// 资源管理器
        /// </summary>
        public IResourceManager ResourceManager
        {
            get;
            set;
        }
        #endregion

        public string SessionName
        {
            get;
            set;
        }

        public GenericService()
        {
            SessionPool = HttpRuntime.Cache;
            Initialize();
        }

        /// <summary>
        /// 服务初始化
        /// </summary>
        protected virtual void Initialize()
        {
            string sessionName = (SessionName == null || SessionName.Equals(string.Empty)) ? "DEFAULT_SESSION" : SessionName;
            this.resMgrFactory = ResourceManagerFactory.GetInstance();      //国际化资源对象
            this.serviceManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();

            //创建默认SESSION
            GenericDBSession session = null;
            lock (SessionPool)
            {
                session = SessionPool.Get(sessionName) as GenericDBSession;
                if (session == null)
                {
                    session = DBSessionManager.CreateDBSession(
                        DataSourceManager.CreateDefaultDataSource()); //数据访问对象

                    SessionPool.Insert(sessionName, session);
                }
            }

            this.boFactory = BizObjectFactory.GetInstance(session);   //BO工厂
            if (this.BOName == null || this.BOName.Length == 0)
            {
                throw new ArgumentException("BOName属性不能为空", "BOName");
            }

            this.bizObject = boFactory.CreateBizObject(this.BOName);   //创建BO对象
        }

        /// <summary>
        /// 根据单主键加载数据
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public virtual DataSet LoadByKey(object key)
        {
            return this.LoadByKey(key, false);
        }

        /// <summary>
        /// 根据单主键加载数据
        /// </summary>
        /// <param name="key">主键值</param>
        /// <param name="isCreateNew">是否创建新行</param>
        /// <returns></returns>
        public virtual DataSet LoadByKey(object key, bool isCreateNew)
        {
            try
            {
                this.bizObject.LoadByPrimaryKey(key);
                if (this.bizObject.IsEmpty())
                {
                    if (isCreateNew)
                    {
                        this.bizObject.Create();
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return this.bizObject.BOData;
        }

        /// <summary>
        /// 根据多主键加载数据
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public virtual DataSet LoadByKeys(IDictionary<string, object> keys)
        {
            return this.LoadByKeys(keys, false);
        }

        /// <summary>
        /// 根据多主键加载数据
        /// </summary>
        /// <param name="keys">主键值集合</param>
        /// <param name="isCreateNew">是否创建新行</param>
        /// <returns></returns>
        public virtual DataSet LoadByKeys(IDictionary<string, object> keys, bool isCreateNew)
        {
            try
            {
                this.bizObject.LoadByPrimaryKeys(keys);
                if (this.bizObject.IsEmpty())
                {
                    if (isCreateNew)
                    {
                        this.bizObject.Create();
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return this.bizObject.BOData;
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="dsSave"></param>
        public virtual void Save(DataSet dsSave)
        {
            this.bizObject.BOData.Merge(dsSave);
            this.bizObject.Synchronize();
        }

        /// <summary>
        /// 加载所有数据
        /// </summary>
        /// <returns></returns>
        public virtual DataSet LoadAll()
        {
            try
            {
                if (this.bizObject.LoadAll())
                {
                    return this.bizObject.BOData;
                }
                else
                {
                    throw new Exception();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public virtual DataSet LoadViewByName(string name)
        {
            try
            {
                return this.bizObject.LoadViewByName(name);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public virtual void DeleteByKey(object key)
        {
            try
            {
                this.bizObject.DeleteByPrimaryKey(key);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public virtual void DeleteByKeys(IDictionary<string, object> keys)
        {
            try
            {
                this.bizObject.DeleteByPrimaryKeys(keys);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public virtual DataSet LoadByCondition(string cond)
        {
            try
            {
                if (this.bizObject.LoadByCondition(cond))
                {
                    return this.bizObject.BOData;
                }
                else
                {
                    throw new Exception();
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public string GetNextSequenceID()
        {
            return this.bizObject.GetNextSequenceID(this.BOName);
        }
    }
}
