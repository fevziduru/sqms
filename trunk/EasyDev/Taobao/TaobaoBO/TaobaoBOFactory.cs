using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.Taobao.BO
{
    public class TaobaoBOFactory
    {
        public static T GetBO<T>()
            where T : ITaobaoBO, new()
        {
            T inst = new T();

            return inst;
        }
    }
}
