using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;

namespace EasyDev.BL
{
    /// <summary>
    /// ҵ�����ӿ�
    /// </summary>
    public interface IGenericBizObject
    {
        /// <summary>
        /// ��ͼ����
        /// </summary>
        DataSet Views
        { get; }

        /// <summary>
        /// ģ�����ݣ�ҵ��������������
        /// </summary>
        DataSet BOData
        { get; set; }

        /// <summary>
        /// ����ͬ�������������е�״̬�Զ�ͬ�����ݵ����ݿ�
        /// </summary>
        void Synchronize();

        /// <summary>
        /// ���ģ���Ƿ�Ϊ��
        /// </summary>
        /// <returns></returns>
        bool IsModelEmpty();

        /// <summary>
        /// ���ģ���Ƿ�Ϊ��
        /// </summary>
        /// <returns></returns>
        bool IsEmpty();

        /// <summary>
        /// ȡ��ģ�����ݵĵ�һ��
        /// </summary>
        /// <returns></returns>
        DataRow GetFirstRow();

        /// <summary>
        /// ȡ��ģ�����ݼ��ĵ�һ�����ݱ�
        /// </summary>
        /// <returns></returns>
        DataTable GetFirstTable();

        /// <summary>
        /// ���ģ������
        /// </summary>
        void Clear();

        /// <summary>
        /// ����ҵ������Ӧ���������ݼ�¼
        /// </summary>
        /// <returns></returns>
        bool LoadAll();

        /// <summary>
        /// ������������ҵ����������
        /// </summary>
        /// <param name="keyValue"></param>
        /// <returns></returns>
        bool LoadByPrimaryKey(object keyValue);

        /// <summary>
        /// ������������ҵ����������(���������)
        /// </summary>
        /// <param name="keyValues"></param>
        /// <returns></returns>
        bool LoadByPrimaryKeys(IDictionary<string, object> keyValues);

        /// <summary>
        /// ������������ģ������
        /// </summary>
        /// <param name="whereCond"></param>
        /// <returns></returns>
        bool LoadByCondition(string whereCond);

        /// <summary>
        /// �����µ����ݼ�¼
        /// </summary>
        /// <returns></returns>
        DataRow Create();

        /// <summary>
        /// ������ͼ���ƴ���ͼ��������ͼ���ݲ�����ǰ��ͼ��ӵ���ͼ������
        /// </summary>
        /// <param name="viewName"></param>
        /// <returns></returns>
        DataSet LoadViewByName(string viewName);

        /// <summary>
        /// ������������ͼ,������ͼ���ݲ�����ǰ��ͼ��ӵ���ͼ������
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="cond"></param>
        /// <returns></returns>
        DataSet LoadViewByCondition(string viewName, string cond);

        /// <summary>
        /// ����ͼ�������Ƴ���ͼ
        /// </summary>
        /// <param name="viewName"></param>
        void RemoveFromViews(string viewName);

        /// <summary>
        /// ��������ɾ������
        /// </summary>
        /// <param name="key"></param>
        void DeleteByPrimaryKey(object key);

        /// <summary>
        /// ���ݶ�����ɾ������
        /// </summary>
        /// <param name="keys"></param>
        void DeleteByPrimaryKeys(IDictionary<string, object> keys);

        /// <summary>
        /// ������ɾ������
        /// </summary>
        /// <param name="cond"></param>
        void DeleteByCondition(string cond);

        /// <summary>
        /// ��ORACLE���ݿ���ȡSEQ��
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        string GetNextSequenceID(string tableName);
    }
}
