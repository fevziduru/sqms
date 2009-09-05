using System;
using System.Web.UI;
using EasyDev.BL;
using EasyDev.Presentation;
using System.Data;
using EasyDev.Util;
using System.Threading;
using System.Configuration;
using log4net;
using EasyDev.SQMS;
using SQMS.Application.Views.Components;
using System.Web.UI.WebControls;

namespace SQMS.Application
{
        public class SQMSPage<T> : Page
            where T : IService, new()
        {
                private ILog logger = LogManager.GetLogger(typeof(SQMSPage<T>));

                public string ResourceIdentity
                {
                        get
                        {
                                if (Request.QueryString["p"] == null)
                                        return "";
                                else
                                        return ConvertUtil.ToStringOrDefault(Request.QueryString["p"]);
                        }
                }

                /// <summary>
                /// 操作栏
                /// </summary>
                public OperationBar OperationBar
                {
                        get
                        {
                                if (this.Master != null && this.Master.FindControl("__OperationBar__") != null)
                                {
                                        return this.Master.FindControl("__OperationBar__") as OperationBar;
                                }
                                else
                                {
                                        return null;
                                }
                        }
                }

                public string ResourceName
                {
                        get
                        {
                                return ConvertUtil.ToStringOrDefault(Request.QueryString["p"]);
                        }
                }

                public string ID
                {
                        get;
                        set;
                }

                /// <summary>
                /// 本地服务管理器
                /// </summary>
                private NativeServiceManager serviceManager = null;

                /// <summary>
                /// 服务管理器
                /// </summary>
                public NativeServiceManager ServiceManager
                {
                        get
                        {
                                if (this.serviceManager == null)
                                {
                                        this.serviceManager = ServiceManagerFactory.CreateServiceManager<NativeServiceManager>();
                                }

                                return this.serviceManager;
                        }
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
                                                        //Response.Redirect(FormsAuthentication.LoginUrl + "?status=q&p=__pub__");
                                                }
                                        }
                                }
                                else
                                {
                                        //TODO: UserInfo为空的处理
                                        //Response.Redirect(FormsAuthentication.LoginUrl + "?status=q&p=__pub__");
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
                private static object _initOperationBar = new object();

                /// <summary>
                /// 初始化操作栏事件
                /// </summary>
                public event EventHandler<EventArgs> OnInitializeOperationBar
                {
                        add
                        {
                                Events.AddHandler(_initOperationBar, value);
                        }
                        remove
                        {
                                Events.RemoveHandler(_initOperationBar, value);
                        }
                }

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
                        this.Error += new EventHandler(SQMSPage_Error);
                        this.ID = ConvertUtil.ToStringOrDefault(Request.Params["id"]);

                        //初始化页面成员数据
                        this.OnPreInitializeView += new EventHandler<EventArgs>(OnPreInitializeViewEventHandler);
                        //初始化页面视图（UI控件）
                        this.OnInitializeView += new EventHandler<EventArgs>(OnInitializeViewEventHandler);
                        //加载视图数据
                        this.OnLoadData += new EventHandler<EventArgs>(OnLoadDataEventHandler);
                        //初始化操作拦
                        this.OnInitializeOperationBar += new EventHandler<EventArgs>(OnInitializeOperationBarEventHandler);

                        base.OnLoad(e);

                        if (Events[_initPage] != null)  //OnPreInitializeView
                        {
                                (Events[_initPage] as EventHandler<EventArgs>)(this, new EventArgs());
                        }

                        //if (Events[_recoveryUI] != null)    //OnRecoveryUI
                        //{
                        //        (Events[_recoveryUI] as EventHandler<EventArgs>)(this, e);
                        //}

                        InitOperationByPermission();    //初始化操作按钮

                        if (Events[_initOperationBar] != null)  //OnInitializeOperationBar
                        {
                                (Events[_initOperationBar] as EventHandler<EventArgs>)(this, e);
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

                private void InitOperationByPermission()
                {
                        if (this.OperationBar != null && this.OperationBar.Visible)
                        {
                                if (CurrentUser != null)
                                {
                                        DataRow[] ops = CurrentUser.Permissions.Select("residentity='" + this.ResourceIdentity + "'");
                                        if (ops.Length > 0)
                                        {
                                                for (int i = 0; i < ops.Length; i++)
                                                {
                                                        this.OperationBar.Buttons.Add(ConvertUtil.ToStringOrDefault(ops[i]["opidentity"]),
                                                            new Button() { Text = ConvertUtil.ToStringOrDefault(ops[i]["opname"]), Width = 100 });
                                                }
                                        }
                                }
                        }
                }

                protected virtual void OnInitializeOperationBarEventHandler(object sender, EventArgs e)
                {
                        //DO NOTHING HERE, IT WILL BE OVERRIDDEN BY SUB CLASS
                }

                /// <summary>
                /// 统一异常处理
                /// </summary>
                /// <param name="sender"></param>
                /// <param name="e"></param>
                void SQMSPage_Error(object sender, EventArgs e)
                {
                        if (ConvertUtil.ToStringOrDefault(ConfigurationManager.AppSettings["global_exception_handler"]).Equals("true"))
                        {
                                Exception ex = Server.GetLastError();
                                string errorId = ex.Message.Length == 0 ? "_default_exception" : ex.Message;
                                this.ErrorPage = ConfigurationManager.AppSettings["ErrorPage"] + "?id=" + errorId;

                                logger.DebugFormat("[YinPSoft-Debug-{0}] - {1}", DateTime.Now.ToString(), ex.Message);
                                logger.DebugFormat("[YinPSoft-Debug-{0}] - {1}", DateTime.Now.ToString(), ex.StackTrace);

                                Response.Redirect(this.ErrorPage);
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

                /// <summary>
                /// 判断当前页面（资源）是否被授予指定的操作
                /// </summary>
                /// <param name="opname"></param>
                /// <returns></returns>
                public bool IsAuthorizedOperation(string opid)
                {
                        try
                        {
                                if (CurrentUser != null)
                                {
                                        DataRow[] drSet = CurrentUser.Permissions.Select(
                                            string.Format("residentity='{0}' and opid='{1}'", ResourceName, opid));

                                        return drSet.Length > 0;
                                }
                                else
                                {
                                        //TODO: UserInfo为空的处理
                                        return false;
                                }
                        }
                        catch (Exception e)
                        {
                                throw e;
                        }
                }
        }
}
