using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SQMS.Services;

namespace SQMS.Application.Views.Common
{

    public class sGridItemList
    {
        private List<sGridItemCB> cblist;
        private RoleService rserv;
        private string rid;

        public sGridItemList(RoleService serv)
        {
            this.cblist = new List<sGridItemCB>();
            this.rserv = serv;
        }

        public sGridItemList(RoleService serv,string rid)
        {
            this.cblist = new List<sGridItemCB>();
            this.rserv = serv;
            this.rid = rid;
        }

        public sGridItemTemplate GetsGridItem(DataControlRowType type, string opid, string opname)
        {
            sGridItemTemplate t;

            switch (type)
            {
                case DataControlRowType.DataRow:
                    t = new sGridItemTemplate(DataControlRowType.DataRow,opname, opid, this.rserv, this.rid,this.cblist);
            	    break;

                case DataControlRowType.Header:
                    t = new sGridItemTemplate(DataControlRowType.Header, opname, opid, this.rserv, this.rid,this.cblist);
                    break;

                case DataControlRowType.Separator:
                    t = new sGridItemTemplate(DataControlRowType.Separator, opname, opid, this.rserv, this.rid, this.cblist);
                    break;

                default:
                    t = null;
                    break;
            }

            return t;
        }

        public void SaveOthers(string roid)
        {
            foreach (sGridItemCB scb in this.cblist)
            {
                this.rserv.ResPermissionService.SetPermission(scb.resid, scb.opid, roid, scb.chked);
            }

            cblist.Clear();
        }
         
    }

    public struct sGridItemCB
    {
        public string resid;
        public string opid;
        public bool chked;
    }

}
