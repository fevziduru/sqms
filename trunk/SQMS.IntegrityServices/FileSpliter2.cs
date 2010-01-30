using System;
using System.IO;

namespace SQMS.IntegrityServices
{
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	class FileSplitter2
	{
		private static long m_segmentSize = 600 * 1024 * 1024;
		private static int blockSize = 1024;
		
		public int SplitFile(string fileName)
		{
			FileStream fsIn = new FileStream(fileName, FileMode.Open, FileAccess.Read);

			string basePath = System.IO.Path.GetDirectoryName(fileName);

			int fileSize = (int) fsIn.Length;
			int segments = (int) (fileSize / m_segmentSize);
			int remainder = (int) (fileSize % m_segmentSize);

			if (remainder > 0) segments++;

			byte[] buffer = new byte[blockSize];

			for (int i = 0; i < segments; i++)
			{
				FileStream fsOut = new FileStream(fileName + "." + i, FileMode.Create,FileAccess.Write);
				int blocks = (int) (m_segmentSize / blockSize);

				if ( remainder > 0 && i < segments - 1)
				{
					for ( int j = 0; j < blocks ; j++)
					{
						//probably should just check the int ret value then write those blocks
						// then if the ret value < 1024, just write the remainder & exit
						fsIn.Read(buffer, 0, blockSize);
						fsOut.Write(buffer, 0, blockSize);
					}
				}
				else
				{
					int finalBlocks = (int) (remainder / blockSize);
					int lastBlock = (int) (remainder % blockSize);
					for (int k = 0; k < finalBlocks; k++)
					{
						fsIn.Read(buffer, 0, blockSize);
						fsOut.Write(buffer,0,blockSize);
					}
					fsIn.Read(buffer, 0, lastBlock);
					fsOut.Write(buffer, 0, lastBlock);
				}
				fsOut.Flush();
				fsOut.Close();
			}
			fsIn.Close();

			return (int) segments;
		}
	}
}
