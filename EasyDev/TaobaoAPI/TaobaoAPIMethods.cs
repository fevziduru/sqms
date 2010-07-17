using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace EasyDev.TaobaoAPI
{
    public interface IAPI
    { }

    public class UserAPI : IAPI
    {
        public static readonly string GET_SUBSCRIBE = "taobao.appstore.subscribe.get";
        public static readonly string GET_USER = "taobao.user.get";
        public static readonly string GET_USERS = "taobao.users.get";

        public UserAPI() { }
    }
}
