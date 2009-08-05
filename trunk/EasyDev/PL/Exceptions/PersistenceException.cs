using System;
using System.Collections.Generic;
using System.Text;
using EasyDev.Common;

namespace EasyDev.PL
{
    public class PersistenceException : ExceptionBase, IException
    {
        public PersistenceException(string msg)
            : base(msg)
        {}
    }
}
