using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI.BizObjects
{
    public class BizObjectFactory
    {
        public static T GetBO<T>()
            where T : ITaobaoBO, new()
        {
            T inst = new T();

            return inst;
        }
    }
}
