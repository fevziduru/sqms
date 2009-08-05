using System;
using System.Collections.Generic;
using System.Text;
using EasyDev.Common;

namespace EasyDev.PL
{
    public class DALCoreException : ExceptionBase, IException
    {
        public DALCoreException(string msg)
            : base(msg)
        { }
    }
}
