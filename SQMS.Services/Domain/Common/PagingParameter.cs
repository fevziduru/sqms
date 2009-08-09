using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SQMS.Services.Domain.Common
{
    public class PagingParameter
    {
        private int pageSize;

        public int PageSize
        {
            get { return pageSize; }
            set
            {
                if (value < 1)
                {
                    pageSize = 1;
                }
                else
                {
                    pageSize = value;
                }
            }
        }
        private int pageNo;

        public int PageNo
        {
            get { return pageNo; }
            set
            {
                if (value < 1)
                {
                    pageNo = 1;
                }
                else
                {
                    pageNo = value;
                }
            }
        }

        public PagingParameter(int no, int size)
        {
            this.pageNo = no;
            this.PageSize = size;
        }

    }
}
