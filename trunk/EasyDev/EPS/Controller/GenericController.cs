using EasyDev.EPS.BusinessObject;
using EasyDev.EPS.Portal;
using System.Web;
using System.Web.Caching;
using System;
using System.Web.Routing;
using System.Web.Mvc;

namespace EasyDev.EPS
{
    [HandleError]
    public class GenericController : System.Web.Mvc.Controller
    {
        private static readonly string DEFAULT_BO = "DEFAULT_BO";

        protected virtual bool IsPostBack
        {
            get 
            {
                return HttpContext.Request.RequestType.Equals("POST", StringComparison.CurrentCultureIgnoreCase);
            }
        }

        /// <summary>
        /// 获取ROUTE中的ID参数值
        /// </summary>
        protected virtual string ID
        {
            get
            {
                if (RouteData.Values.ContainsKey("id"))
                {
                    return Convert.ToString(RouteData.Values["id"]);
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        /// <summary>
        /// 业务对象缓存
        /// </summary>
        protected virtual Cache BOCache { get; set; }

        public GenericController()
        {   
            Initialize();
        }
                
        protected virtual void Initialize()
        {
            BOCache = HttpRuntime.Cache;
        }

        /// <summary>
        /// 获取通用业务对象
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <returns></returns>
        [OutputCache(Duration=60)]
        protected virtual GenericBO<TModel> GetDefaultBO<TModel>() where TModel : IModel, new()
        {
            GenericBO<TModel> defaultBo = null;

            lock (BOCache)
            {
                defaultBo = BOCache[DEFAULT_BO] as GenericBO<TModel>;

                if (defaultBo == null)
                {
                    defaultBo = BOFactory.CreateBO<GenericBO<TModel>>();

                    //缓存通用业务对象
                    BOCache.Insert(DEFAULT_BO, defaultBo);
                }
            }

            return defaultBo;
        }

        /// <summary>
        /// 获取业务对象
        /// </summary>
        /// <typeparam name="TBO"></typeparam>
        /// <returns></returns>
        [OutputCache(Duration = 60)]
        protected virtual TBO GetBO<TBO>() where TBO : AbstractBO, new()
        {
            TBO bo = null;

            lock (BOCache)
            {
                bo = BOCache[typeof(TBO).Name] as TBO;

                if (bo == null)
                {
                    bo = BOFactory.CreateBO<TBO>();
                    BOCache.Insert(typeof(TBO).Name, bo);
                }
            }
            
            return bo;
        }
    }
}
