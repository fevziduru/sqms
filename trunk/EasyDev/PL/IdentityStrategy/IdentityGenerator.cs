using System;

namespace EasyDev.PL
{
    /// <summary>
    /// ��������ֵ�ķ���
    /// </summary>
    [Obsolete("�����Ѿ���ʱ��ʹ��ʵ����IGenerator�ӿڲ�ͨ��GeneratorFactory��������")]
    public class IdentityGenerator
    {
        /// <summary>
        /// ����GUID��Ϊʵ���ʶ
        /// </summary>
        /// <returns></returns>
        public static string GUIDIdentity()
        {
            return Guid.NewGuid().ToString();
        }

        /// <summary>
        /// ����ORACLE���ݱ��Ӧ��SEQUENCE
        /// </summary>
        /// <param name="session"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static string GetNextSequenceId(GenericDBSession session, string tableName)
        {
            try
            {
                return Convert.ToString(
                    session.GetScalarObjectFromCommand(
                    string.Format(@"SELECT SEQ_{0}.nextval FROM dual", tableName)));
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
