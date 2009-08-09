using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using EasyDev.BL.Services;
using SQMS.Services.ReferenceServices;

namespace SQMS.Services
{
    public class EquipmentRefService : GenericService, IReferenceService
    {
        protected override void Initialize()
        {
            this.BOName = "EQUIPMENT";
            base.Initialize();
        }

        public DataTable FetchData()
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand(
                    @"select equid value, equname text, equcode 设备编号, equname 设备名称 from equipment");
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
