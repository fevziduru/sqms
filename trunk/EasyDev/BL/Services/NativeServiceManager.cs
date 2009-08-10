using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.BL.Services
{
    /// <summary>
    /// 本地服务管理器
    /// </summary>
    public class NativeServiceManager : IServiceManager
    {
        /// <summary>
        /// 创建本地服务
        /// </summary>
        /// <typeparam name="T">服务类型</typeparam>
        /// <returns></returns>
        public T CreateService<T>() where T : IService, new()
        {
            return new T();
        }

        public T CreateService<T>(string sessionName) where T : IService, new()
        {
            T srv = new T();
            srv.SessionName = sessionName;

            return srv;
        }

        public T CreateService<T>(T outsrv) where T : GenericService, new()
        {
            T srv = new T();
            srv.CurrentUser = outsrv.CurrentUser;

            return srv;
        }
    }
}
