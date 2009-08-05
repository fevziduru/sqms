using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO.Compression;
using System.IO;

namespace EasyDev.Util
{
    public class CompressUtil
    {
        /// <summary>
        /// 采用GZIP算法对数据进行压缩
        /// </summary>
        /// <param name="toCompressData">要压缩的数据</param>
        /// <returns>UTF8编码的压缩结果</returns>
        public static string Compress(byte[] toCompressData)
        {
            MemoryStream stream = new MemoryStream();
            GZipStream zipStream = new GZipStream(stream, CompressionMode.Compress, false);
            try
            {
                zipStream.Write(toCompressData, 0, toCompressData.Length);
            }
            catch (CompressException e)
            {
                throw e;
            }
            finally
            {
                if (zipStream != null)
                {
                    zipStream.Flush();
                }

                if (stream != null)
                {
                    stream.Close();
                }
            }

            return Encoding.UTF8.GetString(stream.ToArray());
        }

        /// <summary>
        /// 对UTF8编码的压缩数据进行解压缩
        /// </summary>
        /// <param name="toExtractData">要解压的数据</param>
        /// <returns>UTF8编码的解压缩数据</returns>
        public static string Extract(byte[] toExtractData)
        {
            GZipStream zipStream = new GZipStream(new MemoryStream(toExtractData),
                CompressionMode.Decompress,true);
            
            StreamReader reader = null;
            string result = "";
            try
            {
                reader = new StreamReader(zipStream);
                result = reader.ReadToEnd();
            }
            catch (ExtractException e)
            {
                throw e;
            }
            finally
            {
                if (zipStream != null)
                {
                    zipStream.Flush();
                }
            }

            return result;
        }

        /// <summary>
        /// 采用GZIP算法对数据进行压缩
        /// </summary>
        /// <param name="toCompressData">要压缩的数据</param>
        /// <returns>UTF8编码的压缩结果</returns>
        public static string Compress(string toCompressData)
        {
            return Compress(Encoding.UTF8.GetBytes(toCompressData));
        }

        /// <summary>
        /// 对UTF8编码的压缩数据进行解压缩
        /// </summary>
        /// <param name="toExtractData">要解压的数据</param>
        /// <returns>UTF8编码的解压缩数据</returns>
        public static string Extract(string toExtractData)
        {
            return Extract(Encoding.UTF8.GetBytes(toExtractData));
        }
    }
}
