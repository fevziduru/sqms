using System;

namespace EasyDev.PL.IdentityStrategy
{
    public class IdentityGenerator
    {
        /// <summary>
        /// 生成GUID作为实体标识
        /// </summary>
        /// <returns></returns>
        public static string GUIDIdentity()
        {
            return Guid.NewGuid().ToString();
        }

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
