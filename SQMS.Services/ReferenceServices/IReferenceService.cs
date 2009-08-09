using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace SQMS.Services.ReferenceServices
{
    /// <summary>
    /// 在实现FetchData的时候，在SQL中必须要有两个列，分别命名为value和text，大小写无关
    /// </summary>
    public interface IReferenceService
    {
        DataTable FetchReferenceData();
    }
}
