using EasyDev.Common;

namespace EasyDev.PL
{
    /// <summary>
    /// �־ò��쳣����
    /// </summary>
    public class PersistenceException : ExceptionBase, IException
    {
        public PersistenceException(string msg)
            : base(msg)
        {}
    }
}
