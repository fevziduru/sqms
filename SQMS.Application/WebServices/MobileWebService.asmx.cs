using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using EasyDev.SQMS;
using EasyDev.BL.Services;
using System.Web.Security;
using System.Threading;
using System.IO;

namespace SQMS.Application.WebServices
{
    /// <summary>
    /// UpdateDataWebService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。
    // [System.Web.Script.Services.ScriptService]
    public class MobileWebService : GenericService
    {
        private PassportService passportService = null;

        protected override void Initialize()
        {
            this.BOName = "PASSPORT";

            passportService = ServiceManager.CreateService<PassportService>();

            base.Initialize();
        }
        /// <summary>
        /// 更新质量数据
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public string UpdateQualityData(UserInfo user)
        {
            string phyDirBase = Context.Server.MapPath("/QualityData");
            //取得所有以设备命名的目录
            string[] dir = Directory.GetDirectories(phyDirBase);

            //遍历每一个设备目录
            for (int i = 0; i < dir.Length; i++)
            {
                string[] files = null;

                do
                {
                    //查找目录中的带下划线的质量数据文件
                    files = Directory.GetFiles(dir[i], "_*.txt|_*.jpg|_*.wmv|_*.user");
                    FileInfo fi = new FileInfo(files[0]);
                    IEnumerable<string> qd = files.Select(
                        p =>
                        {
                            if (p.Equals(fi.Name.Substring(0, fi.Name.Length - fi.Extension.Length)))
                                return p;
                            else
                                return "";
                        });

                    foreach (string item in qd)
                    {
                        //TODO:qd中包含一套质量数据(.txt, .jpg, .wmv)
                        //TODO:在此循环中先将质量数据改名（去除开头的下划线）以标识它们已经保存到数据库中，改名后将其保存到数据库
                    }

                } while (files.Length > 0);
            }

            return "Hello World ";
        }

        /// <summary>
        /// 移动应用登录接口
        /// </summary>
        /// <param name="passport"></param>
        /// <param name="password"></param>
        /// <param name="roleid"></param>
        /// <returns></returns>
        [WebMethod]
        public UserInfo MobileLogin(string passport, string password, string roleid)
        {
            UserInfo user = passportService.Login(passport, password, roleid);
            if (user != null)
            {
                if (Session["USER_INFO"] == null)
                {
                    Session.Add("USER_INFO", user);
                }
                else
                {
                    Session["USER_INFO"] = user;
                }

                FormsAuthenticationTicket ticket =
                                new FormsAuthenticationTicket(
                                    1,
                                    passport,
                                    DateTime.Now,
                                    DateTime.Now.AddMinutes(60),
                                    false, passport);
                
                string encryptTicket = FormsAuthentication.Encrypt(ticket);
                this.Context.Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encryptTicket));
            }

            return user;
        }

        /// <summary>
        /// 移动应用注销接口
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public string MobileLogout()
        {
            string result = "SUCCESS";
            try
            {
                FormsAuthentication.SignOut();
                if (Session["USER_INFO"] != null)
                {
                    Session.Remove("USER_INFO");
                }

                Thread.CurrentPrincipal = null;
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, null);
                cookie.Expires = DateTime.Now.AddMinutes(-1);
                Context.Response.Cookies.Add(cookie);
            }
            catch (Exception e)
            {
                result = "ERROR";
            }

            return result;
        }
    }
}
