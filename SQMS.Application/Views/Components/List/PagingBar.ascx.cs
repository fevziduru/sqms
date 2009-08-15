using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasyDev.Util;
using EasyDev.Presentation.Actions;
using System.Collections;

namespace SQMS.Application.Views.Components.List
{
    public partial class PagingBar : System.Web.UI.UserControl
    {
        public enum AlternatelyModeEnum
        {
            UrlQueryString,
            PostBack
        }

        public static readonly string URL_PARAM_CURRENT_PAGE = "pageno";
        private int rowsCount = 0;
        /// <summary>
        /// 获取或设置带分页记录的总数
        /// </summary>
        public int RowsCount
        {
            get { return rowsCount; }
            set { rowsCount = value; }
        }
        private int pageSize = 10;
        /// <summary>
        /// 获取或设置每页记录数
        /// </summary>
        public int PageSize
        {
            get { return pageSize; }
            set { pageSize = value; }
        }

        private int pageCount = 0;
        /// <summary>
        /// 获取页面总数
        /// </summary>
        public int PageCount
        {
            get
            {
                if (this.pageCount == 0)
                {
                    this.pageCount = ConvertUtil.ToInt(Math.Ceiling((decimal)(this.RowsCount / this.PageSize)));
                }
                return pageCount;
            }
        }
        private int currentPage = 1;
        /// <summary>
        /// 获取或设置当前页码
        /// </summary>
        public int CurrentPage
        {
            get
            {
                if (this.AlternatelyMode == AlternatelyModeEnum.PostBack)
                {
                    this.currentPage = ConvertUtil.ToInt(this.ViewState["__CurrentPage"]);
                }
                else if (this.AlternatelyMode == AlternatelyModeEnum.UrlQueryString)
                {
                    this.currentPage = ConvertUtil.ToInt(this.Request.QueryString[URL_PARAM_CURRENT_PAGE]);
                }
                if (this.currentPage < 1)
                {
                    this.currentPage = 1;
                }
                if (this.currentPage > this.PageCount)
                {
                    this.currentPage = this.PageCount;
                }
                return currentPage;
            }
            set
            {
                this.currentPage = value;
                if (this.AlternatelyMode == AlternatelyModeEnum.PostBack)
                {
                    this.ViewState["__CurrentPage"] = this.currentPage;
                }
            }
        }
        private AlternatelyModeEnum alternatelyMode = AlternatelyModeEnum.UrlQueryString;
        /// <summary>
        /// 获取或设置分页模式
        /// </summary>
        public AlternatelyModeEnum AlternatelyMode
        {
            get { return alternatelyMode; }
            set { alternatelyMode = value; }
        }
        private static object _currentPageChanging = new object();
        /// <summary>
        /// 分页时引发的事件，在该事件处理函数中自行处理分页
        /// </summary>
        public event CommandEventHandler CurrentPageChanging
        {
            add
            {
                Events.AddHandler(_currentPageChanging, value);
            }
            remove
            {
                Events.RemoveHandler(_currentPageChanging, value);
            }
        }
            
        public void Init()
        {
            divPagingBar.Controls.Clear();
            ArrayList outputIndexes = new ArrayList();
            int start = this.CurrentPage - 2;
            int end = this.CurrentPage + 2;
            if (start < 1)
            {
                end = end + 1 - start;
                start = 1;
            }
            if (end > this.PageCount)
            {
                start = start - (end - this.PageCount);
                end = this.PageCount;
            }
            for (int i = start; i <= end; i++)
            {
                outputIndexes.Add(this.CurrentPage - 1 + i);
            }
            if (!this.CurrentPage.Equals(1))
            {
                this.divPagingBar.Controls.Add(this.createNumbericPageIndex(1));
                if (this.CurrentPage - 1 > 1)
                {
                    Label l = new Label();
                    l.Text = "...";
                    this.divPagingBar.Controls.Add(l);
                }
            }
            foreach (object obj in outputIndexes)
            {
                int index = ConvertUtil.ToInt(obj);
                if (index == this.CurrentPage)
                {
                    Label l = new Label();
                    l.Text = ConvertUtil.ToStringOrDefault(index);
                    this.divPagingBar.Controls.Add(l);
                }
                else
                {
                    this.divPagingBar.Controls.Add(this.createNumbericPageIndex(index));
                }
            }
            if (end != this.PageCount)
            {
                if (PageCount - end > 1)
                {
                    Label l = new Label();
                    l.Text = "...";
                    this.divPagingBar.Controls.Add(l);
                }
                this.divPagingBar.Controls.Add(this.createNumbericPageIndex(this.PageCount));
            }
        }
        private WebControl createNumbericPageIndex(int pageNo)
        {
            switch (this.AlternatelyMode)
            {
                case AlternatelyModeEnum.PostBack:
                    return this.createNumbericPageIndexPostBack(pageNo);
                default:
                    return this.createNumbericPageIndexUrl(pageNo);
            }
        }
        private WebControl createNumbericPageIndexPostBack(int pageNo)
        {
            LinkButton lnkBtnPageIndex = new LinkButton();
            lnkBtnPageIndex.Text = ConvertUtil.ToStringOrDefault(pageNo);
            lnkBtnPageIndex.CommandArgument = ConvertUtil.ToStringOrDefault(pageNo);
            lnkBtnPageIndex.Click +=new EventHandler(lnkBtnPageIndex_Click);
            return lnkBtnPageIndex;
        }

        protected void lnkBtnPageIndex_Click(object sender, EventArgs e)
        {
            LinkButton lnkBtn = (LinkButton)sender;
            this.CurrentPage = ConvertUtil.ToInt(lnkBtn.CommandArgument);
            if (Events[_currentPageChanging] != null)
            {
                CommandEventArgs arg = new CommandEventArgs("", this.CurrentPage);
                ((CommandEventHandler)Events[_currentPageChanging])(sender, arg);
            }
            this.Init();
        }

        private WebControl createNumbericPageIndexUrl(int pageNo)
        {
            HyperLink lnk = new HyperLink();
            lnk.Text = ConvertUtil.ToStringOrDefault(pageNo);
            lnk.NavigateUrl = (this.Request.Url.AbsoluteUri.IndexOf("?") > -1)
                ? "&" + URL_PARAM_CURRENT_PAGE + "=" + pageNo
                : "?" + URL_PARAM_CURRENT_PAGE + "=" + pageNo;
            return lnk;
        }
    }
}