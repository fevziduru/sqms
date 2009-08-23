using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace EasyDev.Util
{
    /// <summary>
    /// 
    /// </summary>
    public class TypeUtil
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public static IDictionary<string, PropertyInfo> GetProperties(Type t)
        {
            PropertyInfo[] properties = t.GetProperties();
            IDictionary<string, PropertyInfo> result = new Dictionary<string, PropertyInfo>();

            for (int i = 0; i < properties.Length; i++)
            {
                result.Add(properties[i].Name, properties[i]);
            }

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static IDictionary<string, PropertyInfo> GetProperties<T>()
        {
            return GetProperties(typeof(T));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tObject"></param>
        /// <param name="propName"></param>
        /// <returns></returns>
        public static object GetValueFromTypeInstance(Type tObject, string propName)
        {
            IDictionary<string, PropertyInfo> items = GetProperties(tObject);
            object result = null;

            foreach (KeyValuePair<string, PropertyInfo> item in items)
            {
                if (item.Key.Equals(propName, StringComparison.CurrentCultureIgnoreCase))
                {
                    result = item.Value.GetValue(tObject, null);
                }
            }

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="TObject"></typeparam>
        /// <param name="propName"></param>
        /// <returns></returns>
        public static object GetValueFromTypeInstance<TObject>(string propName)
        {
            return GetValueFromTypeInstance(typeof(TObject), propName);
        }

        /// <summary>
        /// 判断类型t中是否有attr这个自定义属性
        /// </summary>
        /// <param name="t"></param>
        /// <param name="attr"></param>
        /// <returns></returns>
        public static bool IsTypeContainsAttribute(Type t, Type attr)
        {
            return !(t.GetCustomAttributes(false).FirstOrDefault(p => p.GetType().Equals(attr)) == null);            
        }

        /// <summary>
        /// 判断类型TObject中是否有TAttribute这个自定义属性
        /// </summary>
        /// <typeparam name="TObject"></typeparam>
        /// <typeparam name="TAttribute"></typeparam>
        /// <returns></returns>
        public static bool IsTypeContainsAttribute<TObject, TAttribute>() 
            where TAttribute : Attribute
        {
            return IsTypeContainsAttribute(typeof(TObject), typeof(TAttribute));
        }

        /// <summary>
        /// 判断类型tobject中的名为propName的属性是否有类型为tattr的属性
        /// 返回空则不存在
        /// </summary>
        /// <param name="tobject"></param>
        /// <param name="propName"></param>
        /// <param name="tattr"></param>
        /// <returns></returns>
        public static object IsPropertyContainsAttribute(Type tobject, string propName, Type tattr)
        {
            IDictionary<string, PropertyInfo> properties = GetProperties(tobject);
            PropertyInfo prop = properties.FirstOrDefault(p => p.Key == propName).Value;
            object[] attrs = prop.GetCustomAttributes(false);
            object result = null;

            if (attrs != null)
            {
                result = attrs.FirstOrDefault(p => p.GetType().Equals(tattr));
            }

            return result;
        }

        public static object IsPropertyContainsAttribute(Type type, PropertyInfo property, Type tattr)
        {
            return IsPropertyContainsAttribute(type, property.Name, tattr);
        }

        /// <summary>
        /// 判断类型TObject中的名为propName的属性是否有类型为TAttribute的属性
        /// 返回空则不存在
        /// </summary>
        /// <typeparam name="TObject"></typeparam>
        /// <typeparam name="TAttribute"></typeparam>
        /// <param name="propName"></param>
        /// <returns></returns>
        public static object IsPropertyContainsAttribute<TObject, TAttribute>(string propName) 
            where TAttribute : Attribute
        {
            return IsPropertyContainsAttribute(typeof(TObject), propName, typeof(TAttribute));
        }

        /// <summary>
        /// 从类型tObject的名为propName的成员中找到类型为tAttr的自定义属性，并取得这个自定义属性中名为fieldName的公共成员的值
        /// </summary>
        /// <param name="tObject"></param>
        /// <param name="propName"></param>
        /// <param name="tAttr"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static object GetValueFromAttributeOfProperty(Type tObject, string propName, Type tAttr, string fieldName)
        {
            object attr = IsPropertyContainsAttribute(tObject, propName, tAttr);

            if (attr != null)
            {
                return attr.GetType().GetProperty(fieldName).GetValue(attr,null);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 从类型TObject的名为propName的成员中找到类型为TAttribute的自定义属性，并取得这个自定义属性中名为fieldName的公共成员的值
        /// </summary>
        /// <typeparam name="TObject"></typeparam>
        /// <typeparam name="TAttribute"></typeparam>
        /// <param name="propName"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static object GetValueFromAttributeOfProperty<TObject, TAttribute>(string propName, string fieldName) 
            where TAttribute : Attribute
        {
            return GetValueFromAttributeOfProperty(typeof(TObject), propName, typeof(TAttribute), fieldName);
        }
    }
}
