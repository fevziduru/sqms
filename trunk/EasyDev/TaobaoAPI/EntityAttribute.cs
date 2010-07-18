using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI
{
    [AttributeUsage(AttributeTargets.Class)]
    public class EntityAttribute : Attribute
    {
        public string EntityName { get; set; }

        public EntityAttribute() { }

        public EntityAttribute(string en) { EntityName = en; }
    }
}
