using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Security.Cryptography;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;

namespace EasyDev.TaobaoAPI.Core
{
    public class TaobaoInterfaceProxy
    {
        private string restUrl = "http://gw.api.tbsandbox.com/router/rest";
        private string appKey = string.Empty;
        private string appSecret = string.Empty;

        private TaobaoInterfaceProxy() 
        {
            restUrl = ConfigurationManager.AppSettings[Constants.REST_URL];
            appKey = ConfigurationManager.AppSettings[Constants.APPKEY];
            appSecret = ConfigurationManager.AppSettings[Constants.APPSECRET];
        }

        public static TaobaoInterfaceProxy GetInstance()
        {
            return new TaobaoInterfaceProxy();
        }

        /// <summary>
        /// 返回自定义错误对象XML
        /// </summary>
        /// <param name="code">错误代号</param>
        /// <param name="exp">错误对象</param>
        /// <param name="put">附加请求参数</param>
        /// <returns></returns>
        private string CustomErrorXML(string code, Exception exp)
        {
            return string.Format(Constants.ERROR_XML,
                code, 
                exp.Message.Replace("\"", "'").Replace("\'", "'").Replace("&", "＆"), exp.StackTrace.Replace("\"", "'").Replace("\'", "'").Replace("<", "＜").Replace(">", "＞").Replace("&", "＆"));
        }

        /// <summary>
        /// 组装普通文本请求参数。
        /// </summary>
        /// <param name="parameters">Key-Value形式请求参数字典</param>
        /// <returns>URL编码后的请求数据</returns>
        private string PostData(IDictionary<string, string> parameters)
        {
            StringBuilder postData = new StringBuilder();
            bool hasParam = false;

            IEnumerator<KeyValuePair<string, string>> dem = parameters.GetEnumerator();
            while (dem.MoveNext())
            {
                string name = dem.Current.Key;
                string value = dem.Current.Value;
                // 忽略参数名或参数值为空的参数
                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(value))
                {
                    if (hasParam)
                    {
                        postData.Append("&");
                    }

                    postData.Append(name);
                    postData.Append("=");
                    postData.Append(Uri.EscapeDataString(value));
                    hasParam = true;
                }
            }

            return postData.ToString();
        }

        /// <summary>
        /// 给TOP请求签名  API v2.0
        /// </summary>
        /// <param name="parameters">所有字符型的TOP请求参数</param>
        /// <param name="secret">签名密钥</param>
        /// <returns>签名</returns>
        private string CreateSign(IDictionary<string, string> parameters, string secret)
        {
            //API2.0 签名算法详见：http://open.taobao.com/dev/index.php/API%E7%AD%BE%E5%90%8D%E7%AE%97%E6%B3%95
            //md5:将secretcode同时拼接到参数字符串头、尾部进行md5加密，再转化成大写，格式是：uppercase(md5(secretkey1value1key2value2...secret)。
            //例如:uppercase(md5（secretbar2baz3foo1secret)) 
            parameters.Remove("sign");

            // 第一步：把字典按Key的字母顺序排序
            IDictionary<string, string> sortedParams = new SortedDictionary<string, string>(parameters);
            IEnumerator<KeyValuePair<string, string>> dem = sortedParams.GetEnumerator();

            // 第二步：把所有参数名和参数值串在一起
            StringBuilder query = new StringBuilder(secret);
            while (dem.MoveNext())
            {
                string key = dem.Current.Key;
                string value = dem.Current.Value;
                if (!string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(value))
                {
                    query.Append(key).Append(value);
                }
            }
            query.Append(secret);// API 2.0 新签名方法            

            // 第三步：使用MD5加密
            MD5 md5 = MD5.Create();
            byte[] bytes = md5.ComputeHash(Encoding.UTF8.GetBytes(query.ToString()));

            // 第四步：把二进制转化为大写的十六进制
            StringBuilder result = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                string hex = bytes[i].ToString("X");
                if (hex.Length == 1)
                {
                    result.Append("0");
                }
                result.Append(hex);
            }

            return result.ToString();
        }

        /// <summary>
        /// TOP API POST 执行带文件上传的请求。
        /// </summary>
        /// <param name="url">请求容器URL</param>
        /// <param name="appkey">AppKey</param>
        /// <param name="appSecret">AppSecret</param>
        /// <param name="method">API接口方法名</param>
        /// <param name="session">调用私有的sessionkey</param>
        /// <param name="textParams">请求参数</param>
        /// <param name="fileParams">请求文件参数</param>
        /// <returns></returns>
        private string Post(string url, string appkey, string appSecret, string method, string session, IDictionary<string, string> textParams, IDictionary<string, FileItem> fileParams)
        {
            try
            {
                // 如果没有文件参数，则走普通POST请求
                if (fileParams == null || fileParams.Count == 0)
                {
                    return Post(url, appkey, appSecret, method, session, textParams);
                }

                #region -----API系统参数----

                textParams.Add("app_key", appkey);//应用key
                textParams.Add("method", method);//API接口名称。如taobao.item.get。
                textParams.Add("session", session);//用户会话码。无需用户登录的时候可以不传。 
                textParams.Add("timestamp", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));//时间戳，格式为yyyy-mm-dd hh:mm:ss，例如：2008-01-25 20:23:30。淘宝API服务端允许客户端请求时间误差为10分钟。 
                textParams.Add("format", "xml");//响应格式。xml,json。                 
                textParams.Add("v", "2.0");//API版本号
                textParams.Add("sign_method", "md5");//签名类型
                textParams.Add("sign", CreateSign(textParams, appSecret));//生成签名

                #endregion

                string result = string.Empty;

                System.Net.ServicePointManager.DefaultConnectionLimit = 20;

                #region ---- 完成 HTTP POST 带文件的请求----

                string boundary = DateTime.Now.Ticks.ToString("X"); // 随机分隔线

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                req.Method = "POST";
                req.KeepAlive = true;
                req.UserAgent = "SpaceTimeApp2.0";
                req.Timeout = 600000;
                req.ContentType = "multipart/form-data;charset=utf-8;boundary=" + boundary;

                Stream reqStream = req.GetRequestStream();
                byte[] itemBoundaryBytes = Encoding.UTF8.GetBytes("\r\n--" + boundary + "\r\n");
                byte[] endBoundaryBytes = Encoding.UTF8.GetBytes("\r\n--" + boundary + "--\r\n");

                // 组装文本请求参数
                string textTemplate = "Content-Disposition:form-data;name=\"{0}\"\r\nContent-Type:text/plain\r\n\r\n{1}";
                IEnumerator<KeyValuePair<string, string>> textEnum = textParams.GetEnumerator();
                while (textEnum.MoveNext())
                {
                    string textEntry = string.Format(textTemplate, textEnum.Current.Key, textEnum.Current.Value);
                    byte[] itemBytes = Encoding.UTF8.GetBytes(textEntry);
                    reqStream.Write(itemBoundaryBytes, 0, itemBoundaryBytes.Length);
                    reqStream.Write(itemBytes, 0, itemBytes.Length);
                }

                // 组装文件请求参数
                string fileTemplate = "Content-Disposition:form-data;name=\"{0}\";filename=\"{1}\"\r\nContent-Type:{2}\r\n\r\n";
                IEnumerator<KeyValuePair<string, FileItem>> fileEnum = fileParams.GetEnumerator();
                while (fileEnum.MoveNext())
                {
                    string key = fileEnum.Current.Key;
                    FileItem fileItem = fileEnum.Current.Value;
                    string fileEntry = string.Format(fileTemplate, key, fileItem.GetFileName(), fileItem.GetMimeType());
                    byte[] itemBytes = Encoding.UTF8.GetBytes(fileEntry);
                    reqStream.Write(itemBoundaryBytes, 0, itemBoundaryBytes.Length);
                    reqStream.Write(itemBytes, 0, itemBytes.Length);

                    byte[] fileBytes = fileItem.GetContent();
                    reqStream.Write(fileBytes, 0, fileBytes.Length);
                }

                reqStream.Write(endBoundaryBytes, 0, endBoundaryBytes.Length);
                reqStream.Close();

                HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();

                Encoding encoding = Encoding.GetEncoding(rsp.CharacterSet);

                Stream stream = null;
                StreamReader reader = null;

                stream = rsp.GetResponseStream();
                reader = new StreamReader(stream, encoding);

                result = reader.ReadToEnd();

                if (reader != null) reader.Close();
                if (stream != null) stream.Close();
                if (rsp != null) rsp.Close();

                #endregion

                return Regex.Replace(result, @"[\x00-\x08\x0b-\x0c\x0e-\x1f]", "");
            }
            catch (Exception exp)
            {
                return CustomErrorXML("8004", exp);
            }
        }

        /// <summary>
        /// TOP API POST 请求
        /// </summary>
        /// <param name="url">请求容器URL</param>
        /// <param name="appkey">AppKey</param>
        /// <param name="appSecret">AppSecret</param>
        /// <param name="method">API接口方法名</param>
        /// <param name="session">调用私有的sessionkey</param>
        /// <param name="param">请求参数</param>
        /// <returns>返回字符串</returns>
        private string Post(string url, string appkey, string appSecret, string method, string session, IDictionary<string, string> param)
        {
            try
            {

                //给参数增加 -- API系统参数 此处详见文档：http://open.taobao.com/dev/index.php/API%E6%96%87%E6%A1%A3#API.E7.B3.BB.E7.BB.9F.E5.8F.82.E6.95.B0

                #region -----API系统参数----

                param.Add("app_key", appkey);//应用key
                param.Add("method", method);//API接口名称。如taobao.item.get。
                param.Add("session", session);//用户会话码。无需用户登录的时候可以不传。 
                param.Add("timestamp", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));//时间戳，格式为yyyy-mm-dd hh:mm:ss，例如：2008-01-25 20:23:30。淘宝API服务端允许客户端请求时间误差为10分钟。 
                param.Add("format", "xml");//响应格式。xml,json。                 
                param.Add("v", "2.0");//API版本号
                param.Add("sign_method", "md5");//签名类型
                param.Add("sign", CreateSign(param, appSecret));//生成签名

                #endregion

                string result = string.Empty;

                #region ---- 完成 HTTP POST 请求----

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                req.Method = "POST";
                req.KeepAlive = true;
                req.UserAgent = "SpaceTimeApp2.0";
                req.Timeout = 300000;
                req.ContentType = "application/x-www-form-urlencoded;charset=utf-8";

                byte[] postData = Encoding.UTF8.GetBytes(PostData(param));
                Stream reqStream = req.GetRequestStream();
                reqStream.Write(postData, 0, postData.Length);
                reqStream.Close();

                HttpWebResponse rsp = (HttpWebResponse)req.GetResponse();
                Encoding encoding = Encoding.GetEncoding(rsp.CharacterSet);

                Stream stream = null;
                StreamReader reader = null;

                stream = rsp.GetResponseStream();
                reader = new StreamReader(stream, encoding);

                result = reader.ReadToEnd();

                if (reader != null) reader.Close();
                if (stream != null) stream.Close();
                if (rsp != null) rsp.Close();

                #endregion

                return Regex.Replace(result, @"[\x00-\x08\x0b-\x0c\x0e-\x1f]", "");
            }
            catch (Exception exp)
            {
                //自定错误消息格式
                return CustomErrorXML("8001", exp);
            }
        }

        /// <summary>
        /// TOP API POST 请求（无sessionkey）
        /// </summary>
        /// <param name="method">API接口方法名</param>
        /// <param name="parameters">请求参数</param>
        /// <returns>返回字符串</returns>
        public string Invoke(string method, IDictionary<string, string> parameters)
        {
            return Invoke(this.restUrl, method, "", parameters);
        }

        // <summary>
        /// TOP API POST 请求
        /// </summary>
        /// <param name="url">请求容器URL</param>
        /// <param name="method">API接口方法名</param>
        /// <param name="session">调用私有的sessionkey</param>
        /// <param name="param">请求参数</param>
        /// <returns>返回字符串</returns>
        public string Invoke(string url, string method, string session, IDictionary<string, string> param)
        {
            return Post(url, this.appKey, this.appSecret, method, session, param);
        }

    }
}
