using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.Taobao.Models;
using EasyDev.Taobao.Core;

namespace EasyDev.Taobao.BO
{
    public class UserBO : TaobaoBO
    {
        public UserBO() { }

        public UserSubscribe GetUserSubscribe(string nick, decimal lease_id)
        {
            ClearParameters();

            parameters.Add("nick", nick);
            parameters.Add("lease_id", lease_id.ToString());

            string result = proxy.Invoke(UserAPI.GET_SUBSCRIBE, parameters);
            
            return new UserSubscribe() ;
        }

        public User GetUser(string nick, string alipay_no, string fields)
        {
            ClearParameters();

            parameters.Add("nick", nick);
            parameters.Add("alipay_no", alipay_no);
            parameters.Add("fields", fields);

            string result = proxy.Invoke(UserAPI.GET_USER, parameters);
            return XmlResponseParser.Parse<User>(result, "user");
        }

        public List<User> GetUsers(string nicks, string fields)
        {
            ClearParameters();

            parameters.Add("nicks", nicks);
            parameters.Add("fields", fields);
            string result = proxy.Invoke(UserAPI.GET_USERS, parameters);

            return XmlResponseParser.ParseList<User>(result, "users");
        }
    }
}
