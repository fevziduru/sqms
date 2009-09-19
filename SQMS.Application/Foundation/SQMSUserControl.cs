using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using EasyDev.SQMS;
using System.Threading;
using EasyDev.BL;
using System.Data;
using EasyDev.Util;
using System.Configuration;
using EasyDev.Applications.SQMS;

namespace SQMS.Application.Foundation
{
        public class SQMSUserControl<T> : UserControl
                 where T : IService, new()
        {
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

                protected virtual IService Service
                {
                        get;
                        private set;
                }

                protected virtual void Initialize()
                {
                        this.Service = ServiceManagerFactory.
                            CreateServiceManager<NativeServiceManager>().CreateService<T>();
                }

                /// <summary>
                /// 界面元素数据
                /// </summary>
                public DataSet ViewData
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

                public SQMSUserControl()
                {
                        Initialize();
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
                                this.Page.ErrorPage = ConfigurationManager.AppSettings["ErrorPage"] + "?id=" + errorId;
                                Response.Redirect(this.Page.ErrorPage);
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
        }
}
