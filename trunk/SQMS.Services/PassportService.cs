using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL.Services;
using System.Data;
using EasyDev.Util;

namespace SQMS.Services
{
    public class PassportService : GenericService
    {
        protected override void Initialize()
        {
            this.BOName = "PASSPORT";

            base.Initialize();
        }

        /// <summary>
        /// 用户登录验证
        /// </summary>
        /// <param name="name">用户名</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        public bool Authenticate(string name, string password)
        {
            try
            {
                return DataSetUtil.GetFirstRowFromDataSet(
                    LoadByCondition(
                        string.Format("PASSPORT='{0}' AND PASSWORD='{1}'", name, password)), this.BOName) != null;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
