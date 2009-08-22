using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.PL.IdentityStrategy
{
    public class CommonIdentityGenerator : IGenerator
    {
        public CommonIdentityGenerator() { }

        #region IGenerator 成员

        public string Generate()
        {
            return Guid.NewGuid().ToString();
        }

        #endregion
    }
}
