using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.PL.Common
{
    [Serializable]
    public class QueryObject 
    {
        public string SelectClause
        {
            get;
            set;
        }

        public string FromClause
        {
            get;
            set;
        }
    }
}
