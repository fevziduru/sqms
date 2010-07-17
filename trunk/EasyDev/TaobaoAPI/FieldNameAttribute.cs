using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI
{
    public class FieldAttribute : Attribute
    {
        public string FieldName { get; set; }

        public FieldAttribute() { }

        public FieldAttribute(string _fieldName) { FieldName = _fieldName; }
    }
}
