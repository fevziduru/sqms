using System.Data;

namespace EasyDev.PL
{
    public interface IDBSession
    {
        /// <summary>
        /// ȱʡ��ʼ������Դ����
        /// </summary>
        void InitDataSource();

        /// <summary>
        /// �������õ�����Դ���Ƴ�ʼ������Դ
        /// </summary>
        /// <param name="cfgName"></param>
        void InitDataSourceByName(string cfgName);

        /// <summary>
        /// �����������
        /// </summary>
        /// <param name="sqlCmdText"></param>
        IDbCommand CreateCommand(string sqlCmdText);

        /// <summary>
        /// ����
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="dsToBeUpdate"></param>
        /// <returns></returns>
        //bool Update(string tableName,DataSet dsToBeUpdate);

        string ConnectionString
        {
            get;
            set;
        }

        void OpenSession();

        DataSet GetDataSetFromCommand(IDbCommand command);

        void CloseSession();
    }
}