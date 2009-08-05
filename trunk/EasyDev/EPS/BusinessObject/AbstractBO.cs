using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.PL;
using EasyDev.EPS.Portal;
using EasyDev.PL.IdentityStrategy;
using System.Web.Caching;
using System.Web;
using EasyDev.EPS.Attributes;

namespace EasyDev.EPS.BusinessObject
{
    public abstract class AbstractBO : IBO
    {
        private static readonly string DEFAULT_SESSION = "DEFAULT_SESSION";

        protected virtual string KeyField 
        {
            get; 
            set; 
        }

        /// <summary>
        /// SESSION集合同时也作为SESSION对象的缓存对象，用于多数据库环境
        /// </summary>
        //public virtual IDictionary<string, IGenericDBSession> SessionCache { get; set; }
        private Cache SessionCache { get; set; }

        /// <summary>
        /// 业务对象所引用的数据模型
        /// </summary>
        public virtual IModel Model { get; set; }

        /// <summary>
        /// 默认SESSION对象
        /// </summary>
        public virtual GenericDBSession DefaultSession 
        {
            get
            {
                //先从缓存中取Session
                GenericDBSession session = null;

                lock (SessionCache)
                {
                    session = SessionCache.Get(DEFAULT_SESSION) as GenericDBSession;

                    if (session == null)
                    {
                        session = DBSessionManager.CreateDBSession(DataSourceManager.CreateDefaultDataSource());
                        SessionCache.Insert(DEFAULT_SESSION, session);
                    }
                }

                return session;
            }
        }

        /// <summary>
        /// 根据SESSION名称取得会话对象
        /// SESSION名称与数据源配置文件中的数据源配置名称对应
        /// </summary>
        /// <param name="sessionName">会话名称</param>
        /// <returns></returns>
        public virtual IGenericDBSession GetSessionByName(string sessionName)
        {
            GenericDBSession session = null;

            lock (SessionCache)
            {
                session = SessionCache.Get(sessionName) as GenericDBSession;

                if (session == null)
                {
                    session = DBSessionManager.CreateDBSession(DataSourceManager.CreateDefaultDataSource());
                    SessionCache.Insert(sessionName, session);
                }
            }

            return session;
        }        

        /// <summary>
        /// 初始化方法
        /// </summary>
        protected virtual void Initialize()
        {
            //初始化缓存
            SessionCache = HttpRuntime.Cache;
        }

        /// <summary>
        /// 构造方法
        /// </summary>
        protected AbstractBO()
        {
            Initialize();
        }               

        /// <summary>
        /// 取得当前最大的SQU值，用于ORACLE数据库，ORACLE数据库中的SEQUENCE对象必须以SEQ_{表名}命名
        /// </summary>
        /// <returns></returns>
        public virtual string GetNextSequenceId(string tableName)
        {
            try
            {
                return Convert.ToString(
                    DefaultSession.GetScalarObjectFromCommand(
                    string.Format(@"SELECT SEQ_{0}.nextval FROM dual", tableName)));
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// 取得当前最大的SQU值，用于ORACLE数据库，ORACLE数据库中的SEQUENCE对象必须以SEQ_{表名}命名
        /// 此方法会根据Model类的自定义属性来判断模型用于哪个数据库，并根据数据库类型获取序列值
        /// </summary>
        /// <returns></returns>
        public virtual string GetNextSequenceId<TModel>()
        {
            object[] attr = typeof(TModel).GetCustomAttributes(false);
            string dbName = DBName.ORACLE;

            if (attr != null && attr.Length > 0 && attr[0].GetType() == typeof(DatabaseNameAttribute))
            {
                dbName = ((DatabaseNameAttribute)attr[0]).DatabaseName;
            }

            if (dbName.Equals(DBName.ORACLE, StringComparison.CurrentCultureIgnoreCase))
            {
                return GetNextSequenceId(typeof(TModel).Name);
            }
            else
            {
                return Guid.NewGuid().ToString();
            }            
        }

        #region IBO 成员

        public virtual bool Save(IModel entity)
        {
            throw new NotSupportedException();
        }

        public virtual bool Delete(IModel entity)
        {
            throw new NotSupportedException();
        }

        public virtual bool Update(IModel entity)
        {
            throw new NotSupportedException();
        }

        public virtual IModel FindByInstance(IModel instance)
        {
            throw new NotSupportedException();
        }

        public virtual IList<IModel> FindAllInstance()
        {
            throw new NotSupportedException();
        }

        #endregion
    }
}
