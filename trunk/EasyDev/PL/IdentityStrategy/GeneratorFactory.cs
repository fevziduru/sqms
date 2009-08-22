using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.PL.IdentityStrategy
{
    public class GeneratorFactory
    {
        public static T CreateGenerator<T>() 
            where T: IGenerator, new ()
        {
            return new T();
        }
    }
}
