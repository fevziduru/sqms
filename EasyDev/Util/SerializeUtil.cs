using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.Web.UI;

namespace EasyDev.Util
{
    public class SerializeUtil
    {
        /// <summary>
        /// 实现从对象到XML串的序列化
        /// </summary>
        /// <param name="o"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string SerializeToXML(object o, Type type)
        {
            string xmlStr;
            MemoryStream streamStoreObj = new MemoryStream();

            XmlSerializer xmlS = new XmlSerializer(type);
            xmlS.Serialize(streamStoreObj, o);
            xmlStr = StreamUtil.QuickStreamReader(streamStoreObj, true);

            return xmlStr;
        }

        /// <summary>
        /// 实现从对象到二进制串的序列化
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public static string SerializeToBinaryString(object o)
        {
            string result;

            BinaryFormatter bFormatter = new BinaryFormatter();
            MemoryStream stream = new MemoryStream();
            bFormatter.Serialize(stream, o);

            result = StreamUtil.QuickStreamReader(stream, true);

            return result;
        }

        /// <summary>
        /// 实现从对象到LOS串的序列化 
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public static string SerializeToLOSString(object o)
        {
            string result;

            LosFormatter los = new LosFormatter();
            MemoryStream stream = new MemoryStream();
            los.Serialize(stream, o);

            result = StreamUtil.QuickStreamReader(stream, true);

            return result;
        }

        /// <summary>
        /// 从流中反序列化XML数据
        /// </summary>
        /// <param name="stream"></param>
        /// <returns></returns>
        /// <param name="type"></param>
        public static object DeserializeFromXMLStream(Stream stream, Type type)
        {
            object result;
            XmlSerializer xmlS = new XmlSerializer(type);
            result = xmlS.Deserialize(stream);

            return result;
        }

        /// <summary>
        /// 从流中反序列化LOS数据
        /// </summary>
        /// <param name="stream"></param>
        /// <returns></returns>
        public static object DeserializeFromLOSStream(Stream stream)
        {
            object result;
            LosFormatter los = new LosFormatter();
            result = los.Deserialize(stream);

            return result;
        }

        /// <summary>
        /// 将LOS数据反序列化为对象
        /// </summary>
        /// <param name="losString"></param>
        /// <returns></returns>
        public static object DeserializeFromLOSString(string losString)
        {
            object result;
            LosFormatter los = new LosFormatter();
            result = los.Deserialize(losString);

            return result;
        }

        /// <summary>
        /// 从流中反序化二进制串数据
        /// </summary>
        /// <param name="stream"></param>
        /// <returns></returns>
        public static object DeserializeFromBinaryStream(Stream stream)
        {
            object result;

            BinaryFormatter bFormatter = new BinaryFormatter();
            result = bFormatter.Deserialize(stream);

            return result;
        }
    }
}
