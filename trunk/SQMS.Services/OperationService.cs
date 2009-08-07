using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;

namespace SQMS.Services
{
    public class OperationService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "Operation";

            base.Initialize();
        }
    }
}
