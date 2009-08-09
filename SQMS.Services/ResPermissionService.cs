using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using EasyDev.BL.Services;
using EasyDev.Util;

namespace SQMS.Services
{
    public class ResPermissionService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "RESPERMISSION";
            base.Initialize();
        }

        public void SetPermission(string resid, string opid, string roleid, bool right)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add("RESID", resid);
            dic.Add("OPID", opid);
            dic.Add("ROLEID", roleid);

            if (right == true)
            {
                //add
                DataSet ds = this.LoadByKeys(dic, true);
                DataRow dr = DataSetUtil.GetFirstRowFromDataSet(ds, "RESPERMISSION");
                dr["RESID"] = resid;
                dr["OPID"] = opid;
                dr["ROLEID"] = roleid;
                this.Save(ds);
            }
            else
            {
                //del
                this.DeleteByKeys(dic);
            }

        }

    }

}
