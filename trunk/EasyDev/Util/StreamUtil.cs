using System;
using System.IO;
using System.Text;

namespace EasyDev.Util
{
    public class StreamUtil
    {
        /// <summary>
        /// ��������ȡ
        /// </summary>
        /// <param name="stream">�������ݵ�������</param>
        /// <param name="isCloseStream">�������ݺ��Ƿ�ر���</param>
        /// <returns></returns>
        public static string QuickStreamReader(Stream stream, bool isCloseStream)
        {
            try
            {
                string tmp = string.Empty;
                using (BufferedStream bstream = new BufferedStream(stream))
                {
                    using (StreamReader reader = new StreamReader(bstream))
                    {
                        tmp = reader.ReadToEnd();
                    }
                }

                return tmp;
            }
            catch (IOException e)
            {
                throw e;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// �����ж�ȡ���ݲ�����BASE64����
        /// </summary>
        /// <param name="stream">�������ݵ�������</param>
        /// <param name="isCloseStream">�������ݺ��Ƿ�ر���</param>
        /// <returns></returns>
        public static string QuickStreamReaderWithBase64(Stream stream, bool isCloseStream)
        {
            return System.Convert.ToBase64String(QuickStreamReaderWithUTF8Encoded(stream, isCloseStream));
        }

        /// <summary>
        /// �����ж�ȡ���ݲ�����UTF8����
        /// </summary>
        /// <param name="stream">�������ݵ�������</param>
        /// <param name="isCloseStream">�������ݺ��Ƿ�ر���</param>
        /// <returns></returns>
        public static byte[] QuickStreamReaderWithUTF8Encoded(Stream stream, bool isCloseStream)
        {
            return Encoding.UTF8.GetBytes(QuickStreamReader(stream, isCloseStream));
        }

        /// <summary>
        /// ������д����
        /// </summary>
        /// <param name="stream">Ҫд�����ݵĻ���������</param>
        /// <param name="data">Ҫд�������</param>
        /// <param name="isCloseStream">�Ƿ�ر�������</param>
        /// <returns></returns>
        public static void QuickStreamWriter(Stream stream, string data, bool isCloseStream)
        {
            try
            {
                using (BufferedStream bstream = new BufferedStream(stream))
                {
                    using (StreamWriter writer = new StreamWriter(bstream))
                    {
                        writer.AutoFlush = true;
                        writer.Write(data);
                    }
                }
            }
            catch (IOException e)
            {
                throw e;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        /// <summary>
        /// ������д����
        /// </summary>
        /// <param name="stream">Ҫд�����ݵĻ���������</param>
        /// <param name="data">Ҫд�������</param>
        /// <param name="isCloseStream">�Ƿ�ر�������</param>
        /// <returns></returns>
        public static void QuickStreamWriter(Stream stream, byte[] data, bool isCloseStream)
        {
            QuickStreamWriter(stream, Encoding.UTF8.GetString(data), isCloseStream);
        }
    }
}
