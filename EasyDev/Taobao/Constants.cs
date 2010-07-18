using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.Taobao
{
    public static class Constants
    {
        public static readonly string ERROR_XML = @"<error_response>
            <args list=""true""><arg><key>post</key><value>{2}</value></arg></args>
            <code>{0}</code>
            <msg>{1}</msg>
            <sub_code></sub_code>
            <sub_msg></sub_msg>
            </error_response>";

        public static readonly string REST_URL = "REST_URL";
        public static readonly string APPKEY = "APPKEY";
        public static readonly string APPSECRET = "APPSECRET";

    }
}
