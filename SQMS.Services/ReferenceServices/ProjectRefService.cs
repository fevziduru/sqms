using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.BL;
using System.Data;

namespace SQMS.Services.ReferenceServices
{
    public class ProjectRefService : GenericService, IReferenceService
    {
        protected override void Initialize()
        {
            this.BOName = "PROJECT";
            base.Initialize();
        }

        public DataTable FetchReferenceData()
        {
            try
            {
                return DefaultSession.GetDataTableFromCommand(
                    @"select projectid value, projectname text, projectcode 项目编号, projectname 项目名称 from PROJECT");
            }
            catch (Exception e)
            {
                throw;
            }
        }
    }
}
