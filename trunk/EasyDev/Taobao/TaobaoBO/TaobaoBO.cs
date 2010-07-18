using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EasyDev.Taobao.Core;
using System.Collections;

namespace EasyDev.Taobao.BO
{
    public abstract class TaobaoBO : ITaobaoBO
    {
        private IAPI methods = null;
        protected TaobaoInterfaceProxy proxy;
        protected IDictionary<string, string> parameters;

        #region ITaobaoBO Members

        public IAPI Methods
        {
            get
            {
                return methods;
            }
            set
            {
                this.methods = value;
            }
        }

        #endregion

        public TaobaoBO() 
        {
            Initialize();
        }

        protected virtual void Initialize()
        {
            proxy = TaobaoInterfaceProxy.GetInstance();
            parameters = new Dictionary<string, string>();
        }

        protected virtual void ClearParameters()
        {
            if (parameters.Count > 0)
            {
                parameters.Clear();
            }
        }
    }
}
