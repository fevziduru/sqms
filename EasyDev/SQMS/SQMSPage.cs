using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using EasyDev.BL.Services;
using EasyDev.Presentation.Actions;
using System.ComponentModel;
using System.Data;
using EasyDev.Util;
using System.Threading;

namespace EasyDev.SQMS
{
    public class SQMSPage<T> : Page
        where T : IService, new()
    {
        public string ID
        {
            get;
            set;
        }

        protected virtual IService Service
        {
            get;
            private set;
        }

        public SQMSPage()
        {
            Initialize();
        }

        protected virtual void Initialize()
        {
            this.Service = ServiceManagerFactory.
                CreateServiceManager<NativeServiceManager>().CreateService<T>();
        }

        public UserInfo CurrentUser
        {
            get
            {
                UserInfo userinfo = null;
                if (Session["USER_INFO"] != null)
                {
                    userinfo = Session["USER_INFO"] as UserInfo;
                }
                else if (Thread.CurrentPrincipal.Identity.IsAuthenticated)
                {
                    UserIdentity identity = Thread.CurrentPrincipal.Identity as UserIdentity;
                    if (identity != null)
                    {
                        if (identity.UserInfo != null)
                        {
                            userinfo = identity.UserInfo;
                        }
                        else
                        {
                            //TODO: UserInfo为空的处理
                        }
                    }
                }
                else
                {
                    //TODO: UserInfo为空的处理
                }

                return userinfo;
            }
        }


        #region 事件
        private static object _saving = new object();
        private static object _saved = new object();
        private static object _deleting = new object();
        private static object _deleted = new object();
        private static object _loading = new object();
        private static object _loaded = new object();

        /// <summary>
        /// 加载数据后处理事件
        /// </summary>
        public event EventHandler<OperationEventArgs> Loaded
        {
            add
            {
                Events.AddHandler(_loaded, value);
            }
            remove
            {
                Events.RemoveHandler(_loaded, value);
            }
        }

        /// <summary>
        /// 加载数据后处理事件
        /// </summary>
        public event EventHandler<OperationEventArgs> Loading
        {
            add
            {
                Events.AddHandler(_loading, value);
            }
            remove
            {
                Events.RemoveHandler(_loading, value);
            }
        }

        /// <summary>
        /// 删除后处理事件
        /// </summary>
        public event EventHandler<OperationEventArgs> Deleted
        {
            add
            {
                Events.AddHandler(_deleted, value);
            }
            remove
            {
                Events.RemoveHandler(_deleted, value);
            }
        }

        /// <summary>
        /// 删除前处理事件
        /// </summary>
        public event EventHandler<OperationEventArgs> Deleting
        {
            add
            {
                Events.AddHandler(_deleting, value);
            }
            remove
            {
                Events.RemoveHandler(_deleting, value);
            }
        }

        /// <summary>
        /// 保存前处理事件
        /// </summary>
        public event EventHandler<OperationEventArgs> Saving
        {
            add
            {
                Events.AddHandler(_saving, value);
            }
            remove
            {
                Events.RemoveHandler(_saving, value);
            }
        }

        /// <summary>
        /// 保存后处理事件
        /// </summary>
        public event EventHandler<OperationEventArgs> Saved
        {
            add
            {
                Events.AddHandler(_saved, value);
            }
            remove
            {
                Events.RemoveHandler(_saved, value);
            }
        }

        private static object _recoveryUI = new object();

        /// <summary>
        /// 恢复界面事件
        /// </summary>
        public event EventHandler<EventArgs> OnRecoveryUI
        {
            add
            {
                Events.AddHandler(_recoveryUI, value);
            }
            remove
            {
                Events.RemoveHandler(_recoveryUI, value);
            }
        }

        private static object _initPage = new object();

        /// <summary>
        /// 初始化页面对象事件
        /// </summary>
        public event EventHandler<EventArgs> OnPreInitializeView
        {
            add
            {
                Events.AddHandler(_initPage, value);
            }
            remove
            {
                Events.RemoveHandler(_initPage, value);
            }
        }

        private static object _loadData = new object();

        /// <summary>
        /// 加载数据事件 
        /// </summary>
        public event EventHandler<EventArgs> OnLoadData
        {
            add
            {
                Events.AddHandler(_loadData, value);
            }
            remove
            {
                Events.RemoveHandler(_loadData, value);
            }
        }

        private static object _initUI = new object();

        /// <summary>
        /// 初始化界面UI事件
        /// </summary>
        public event EventHandler<EventArgs> OnInitializeView
        {
            add
            {
                Events.AddHandler(_initUI, value);
            }
            remove
            {
                Events.RemoveHandler(_initUI, value);
            }
        }

        #endregion

        //protected delegate void OnSaveCallbackHandler(DataSet ds);
        //protected delegate void OnDeleteCallbackHander(DataSet ds);
        //protected delegate DataSet OnLoadByPrimaryCallbackHandler(object key);

        /// <summary>
        /// 保存处理方法，此方法会触发保存前处理事件和保存后处理事件
        /// </summary>
        /// <param name="ds">要保存的数据集</param>
        /// <param name="callback">保存处理方法代理</param>
        //protected virtual void OnSave(DataSet ds, OnSaveCallbackHandler save)
        //{
        //    OperationEventArgs args = new OperationEventArgs(ds);

        //    if (Events[_saving] != null)
        //    {
        //        ((EventHandler<OperationEventArgs>)Events[_saving])(this, args);
        //    }

        //    save(ds);
        //    args.Data = ds;

        //    if (Events[_saved] != null)
        //    {
        //        ((EventHandler<OperationEventArgs>)Events[_saved])(this, args);
        //    }
        //}

        /// <summary>
        /// 删除处理方法，此方法会触发删除前处理事件和删除后处理事件
        /// </summary>
        /// <param name="ds">要删除的数据</param>
        /// <param name="delete">删除处理方法代理</param>
        //protected virtual void OnDelete(DataSet ds, OnDeleteCallbackHander delete)
        //{
        //    OperationEventArgs args = new OperationEventArgs(ds);
        //    if (Events[_deleting] != null)
        //    {
        //        ((EventHandler<OperationEventArgs>)Events[_deleting])(this, args);
        //    }

        //    delete(ds);
        //    args.Data = ds;

        //    if (Events[_deleted] != null)
        //    {
        //        ((EventHandler<OperationEventArgs>)Events[_deleted])(this, args);
        //    }
        //}

        /// <summary>
        /// 加载数据处理方法
        /// </summary>
        /// <param name="ds"></param>
        /// <param name="load"></param>
        //protected virtual DataSet OnLoadByPrimary(object key, OnLoadByPrimaryCallbackHandler load)
        //{
        //    OperationEventArgs args = new OperationEventArgs(key);
        //    if (Events[_loading] != null)
        //    {
        //        ((EventHandler<OperationEventArgs>)Events[_loading])(this, args);
        //    }

        //    args.Data = load(key);

        //    if (Events[_loaded] != null)
        //    {
        //        ((EventHandler<OperationEventArgs>)Events[_loaded])(this, args);
        //    }

        //    return args.Data;
        //}

        #region Page Method
        /// <summary>
        /// 界面元素数据
        /// </summary>
        protected DataSet ViewData
        {
            get
            {
                DataSet dstmp = ViewState["Page_UIData"] as DataSet;
                if (dstmp == null)
                {
                    return new DataSet();
                }
                return dstmp;
            }
            set
            {
                if (ViewState["Page_UIData"] == null)
                {
                    ViewState.Add("Page_UIData", value);
                }
                else
                {
                    ViewState["Page_UIData"] = value;
                }
            }
        }

        /// <summary>
        /// 从界面元素获取数据
        /// </summary>
        protected virtual void GetViewData() { }

        /// <summary>
        /// 页面加载事件,页面生存周期
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            this.ID = ConvertUtil.EmptyOrString(Request.Params["id"]);

            //初始化页面成员数据
            this.OnPreInitializeView += new EventHandler<EventArgs>(OnPreInitializeViewEventHandler);
            //初始化页面视图（UI控件）
            this.OnInitializeView += new EventHandler<EventArgs>(OnInitializeViewEventHandler);
            //加载视图数据
            this.OnLoadData += new EventHandler<EventArgs>(OnLoadDataEventHandler);

            base.OnLoad(e);

            if (Events[_initPage] != null)  //OnPreInitializeView
            {
                (Events[_initPage] as EventHandler<EventArgs>)(this, new EventArgs());
            }

            if (Events[_recoveryUI] != null)    //OnRecoveryUI
            {
                (Events[_recoveryUI] as EventHandler<EventArgs>)(this, e);
            }

            if (!Page.IsPostBack)
            {
                if (Events[_loadData] != null)  //OnLoadData
                {
                    (Events[_loadData] as EventHandler<EventArgs>)(this, e);
                }

                if (Events[_initUI] != null)    //OnInitializeView
                {
                    (Events[_initUI] as EventHandler<EventArgs>)(this, e);
                }
            }
            else
            {

            }
        }

        /// <summary>
        /// 初始化页面成员数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void OnPreInitializeViewEventHandler(object sender, EventArgs e)
        { 
            //DO NOTHING HERE, IT WILL BE OVERRIDDEN BY SUB CLASS
        }

        /// <summary>
        /// 初始化页面视图（UI控件）
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void OnInitializeViewEventHandler(object sender, EventArgs e)
        {
            //DO NOTHING HERE, IT WILL BE OVERRIDDEN BY SUB CLASS
        }

        /// <summary>
        /// 加载视图数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void OnLoadDataEventHandler(object sender, EventArgs e)
        {
            //DO NOTHING HERE, IT WILL BE OVERRIDDEN BY SUB CLASS
        }
        #endregion
    }
}
