using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.Web.UI;

namespace EasyDev.Util
{
        [Obsolete("�˹������еķ������Ѿ��ж�Ӧ����չ����ʵ��")]
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
                        return o.XmlSerialization(type);
                }

                /// <summary>
                /// ʵ�ִӶ��󵽶����ƴ������л�
                /// </summary>
                /// <param name="o"></param>
                /// <returns></returns>
                public static string SerializeToBinaryString(object o)
                {
                        return o.BinaryStringSerialization();
                }

                /// <summary>
                /// ʵ�ִӶ���LOS�������л� 
                /// </summary>
                /// <param name="o"></param>
                /// <returns></returns>
                public static string SerializeToLOSString(object o)
                {
                        return o.LOSStringSerialization();
                }

                /// <summary>
                /// �����з����л�XML����
                /// </summary>
                /// <param name="stream"></param>
                /// <returns></returns>
                /// <param name="type"></param>
                public static object DeserializeFromXMLStream(Stream stream, Type type)
                {
                        return stream.XmlDeserialization(type);
                }

                /// <summary>
                /// �����з����л�LOS����
                /// </summary>
                /// <param name="stream"></param>
                /// <returns></returns>
                public static object DeserializeFromLOSStream(Stream stream)
                {
                        return stream.LOSDeserialization();
                }

                /// <summary>
                /// ��LOS���ݷ����л�Ϊ����
                /// </summary>
                /// <param name="losString"></param>
                /// <returns></returns>
                public static object DeserializeFromLOSString(string losString)
                {
                        return losString.LOSDeserialization();
                }

                /// <summary>
                /// �����з��򻯶����ƴ�����
                /// </summary>
                /// <param name="stream"></param>
                /// <returns></returns>
                public static object DeserializeFromBinaryStream(Stream stream)
                {
                        return stream.BinaryDeserialization();
                }
        }
}
