using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EasyDev.TaobaoAPI.Models
{
    public class ResultObject<TModel>
    {
        public List<TModel> Entities { get; set; }

        public ResultObject() { }

        public TModel Single
        {
            get 
            {
                if (Entities != null && Entities.Count > 0)
                {
                    return Entities[0];
                }
                else
                {
                    return default(TModel);
                }
            }
        }
    }
}
