using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace EasyDev.TaobaoAPI
{
    public class Verifier
    {
        /// <summary>
        /// 验证回调地址的签名是否合法。
        /// </summary>
        /// <param name="callbackUrl">回调地址</param>
        /// <param name="appSecret">应用密钥</param>
        /// <returns>验证成功返回True，否则返回False</returns>
        public static bool VerifyTopResponse(string callbackUrl, string appSecret)
        {
            Uri uri = new Uri(callbackUrl);

            string query = uri.Query;
            if (string.IsNullOrEmpty(query)) // 没有回调参数
            {
                return false;
            }

            query = query.Trim(new char[] { '?', ' ' });
            if (query.Length == 0) // 没有回调参数
            {
                return false;
            }

            IDictionary<string, string> queryDict = new Dictionary<string, string>();
            string[] queryParams = query.Split(new char[] { '&' });

            if (queryParams != null && queryParams.Length > 0)
            {
                foreach (string queryParam in queryParams)
                {
                    string[] oneParam = queryParam.Split(new char[] { '=' });
                    if (oneParam.Length >= 2)
                    {
                        queryDict.Add(oneParam[0], oneParam[1]);
                    }
                }
            }

            StringBuilder result = new StringBuilder();
            if (queryDict.ContainsKey("top_appkey")) result.Append(queryDict["top_appkey"]);
            if (queryDict.ContainsKey("top_parameters")) result.Append(queryDict["top_parameters"]);
            if (queryDict.ContainsKey("top_session")) result.Append(queryDict["top_session"]);
            result.Append(appSecret);

            byte[] bytes = MD5.Create().ComputeHash(Encoding.UTF8.GetBytes(result.ToString()));
            string sign = System.Convert.ToBase64String(bytes);

            return queryDict.ContainsKey("top_sign") && Uri.EscapeDataString(sign) == queryDict["top_sign"];
        }

        /// <summary>
        /// 验证回调地址的签名是否合法。
        /// </summary>
        /// <param name="topParams">TOP私有参数（未经Base64解密后的）</param>
        /// <param name="topSession">TOP私有会话码</param>
        /// <param name="topSign">TOP回调签名（经过URL反编码的）</param>
        /// <param name="appKey">应用公钥</param>
        /// <param name="appSecret">应用密钥</param>
        /// <returns>验证成功返回True，否则返回False</returns>
        public static bool VerifyTopResponse(string topParams, string topSession, string topSign, string appKey, string appSecret)
        {
            StringBuilder result = new StringBuilder();
            if (appKey.ToLower() == "test" || appKey == "系统分配")
            {
                appKey = "";
                appSecret = "";
            }
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            result.Append(appKey).Append(topParams).Append(topSession).Append(appSecret);
            byte[] bytes = MD5.Create().ComputeHash(Encoding.UTF8.GetBytes(result.ToString()));

            return System.Convert.ToBase64String(bytes) == topSign;
        }
    }
}
