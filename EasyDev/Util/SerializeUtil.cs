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
        /// ʵ�ִӶ���XML�������л�
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
        /// ʵ�ִӶ��󵽶����ƴ������л�
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
        /// ʵ�ִӶ���LOS�������л� 
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
        /// �����з����л�XML����
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
        /// �����з����л�LOS����
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
        /// ��LOS���ݷ����л�Ϊ����
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
        /// �����з��򻯶����ƴ�����
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
