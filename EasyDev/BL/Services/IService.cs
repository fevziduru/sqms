using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using EasyDev.PL;
using EasyDev.SQMS;

namespace EasyDev.BL.Services
{
    public interface IService
    {
        string GenerateCode();
        string BOName { get; }
        string SessionName { get; set; }
        DataSet LoadByCondition(string cond);
        void DeleteByKeys(IDictionary<string, object> keys);
        void DeleteByKey(object key);
        DataSet LoadViewByName(string name);
        DataSet LoadAll();
        void Save(DataSet dsSave);
        DataSet LoadByKeys(IDictionary<string, object> keys, bool isCreateNew);
        DataSet LoadByKeys(IDictionary<string, object> keys);
        DataSet LoadByKey(object key, bool isCreateNew);
        DataSet LoadByKey(object key);
        string GetNextSequenceID();
        GenericDBSession GetSession(string name);
    }
}
