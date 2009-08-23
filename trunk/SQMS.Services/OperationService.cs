using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;
using EasyDev.Util;

namespace SQMS.Services
{
    public class OperationService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "OPERATION";

            base.Initialize();
        }

        public override void DeleteByKey(object key)
        {
            try
            {
                DataSet ds = LoadByKey(key.ToString());
                DataRow dr = DataSetUtil.GetFirstRowFromDataSet(ds, BOName);
                if (dr != null)
                {
                    dr["ISVOID"] = "Y";
                }

                base.Save(ds);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
