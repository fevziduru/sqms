using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using EasyDev.Taobao.Models;
using System.IO;
using System.Xml.Linq;

namespace EasyDev.Taobao.Core
{
    public class XmlResponseParser
    {
        public static TModel Parse<TModel>(string xmlbody, string itemNode)
        {
            return (ParseInternal<TModel>(xmlbody, itemNode) as ResultObject<TModel>).Single;
        }

        public static List<TModel> ParseList<TModel>(string xmlbody, string listNode)
        {
            return (ParseInternal<TModel>(xmlbody, listNode) as ResultObject<TModel>).Entities;
        }

        private static object ParseInternal<TModel>(string xml, string node)
        {
            XmlAttributes rootAttrs = new XmlAttributes();
            rootAttrs.XmlRoot = new XmlRootAttribute(XElement.Parse(xml).Name.LocalName);

            XmlAttributes objAttrs = new XmlAttributes();
            objAttrs.XmlElements.Add(new XmlElementAttribute(node, typeof(User)));

            XmlAttributeOverrides attrOvrs = new XmlAttributeOverrides();
            attrOvrs.Add(typeof(ResultObject<TModel>), rootAttrs);
            attrOvrs.Add(typeof(ResultObject<TModel>), "Entities", objAttrs);

            XmlSerializer serializer = new XmlSerializer(typeof(ResultObject<TModel>), attrOvrs);
            return serializer.Deserialize(new StringReader(xml));
        }
    }
}
