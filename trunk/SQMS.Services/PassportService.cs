using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;

namespace SQMS.Services
{
    class PassportService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "PASSPORT";

            base.Initialize();
        }
    }
}
