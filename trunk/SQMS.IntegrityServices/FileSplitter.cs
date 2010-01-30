using System;
using System.IO;
using System.Text;


namespace SQMS.IntegrityServices
{
    //public delegate void ProgressNotifyHandler (object sender, EventArgs e);
    public delegate void ProgressNotifyHandler ( int i );

    /// <summary>
    /// Summary description for FileSplitter2.
    /// </summary>
    public class FileSplitter
    {
        private static readonly long MAXSEGSIZE = 600 * 1024 * 1024;
        private static readonly long MINSEGSIZE = 4096;
        private static readonly int MAXBUFSIZE = 10240;
        private static readonly int MINBUFSIZE = 4096;
        private int m_blockSize = 4096; //arbitrary
        private long m_segmentSize = DefaultSize; //in megabytes
        //not used ... yet.
        private string m_outputPath = string.Empty;

        public static readonly long DefaultSize = 2 * 1024 * 1024;
        public event ProgressNotifyHandler ProgressNotify;

        /// <summary>
        /// Simply splits a file name in the current directory using 
        /// the original filename as a prefix appending numeric
        /// in sequence starting with 0.
        /// </summary>
        /// <param name="fileName">file name to split up</param>
        /// <returns>number of segments created</returns>
        public int SplitFile( string fileName )
        {
            FileStream fsIn = new FileStream(fileName, FileMode.Open, FileAccess.Read);

            string basePath = System.IO.Path.GetDirectoryName(fileName);

            int fileSize = (int) fsIn.Length;
            int segments = (int) (fileSize / m_segmentSize);
            int remainder = (int) (fileSize % m_segmentSize);

            if (remainder > 0) segments++;

            byte[] buffer = new byte[m_blockSize];

            int bytesRead = 0;
            try 
            {
                for (int i = 0; i < segments; i++)
                {
                    FileStream fsOut = new FileStream(fileName + "." + i, FileMode.Create,FileAccess.Write);
                    int blocks = (int) (m_segmentSize / m_blockSize);

                    for ( int j = 0; j < blocks ; j++)
                    {
                        bytesRead = fsIn.Read(buffer, 0, m_blockSize);
                        fsOut.Write(buffer, 0, bytesRead);
                    }
                    fsOut.Close();
                    OnProgessNotify ( Utilities.GetPercentComplete(  i+1 , segments ) );
                }

                return (int) segments;
            }
            finally 
            {
                OnProgessNotify( 100 );
                if ( fsIn != null ) fsIn.Close();
            }
        }

        /// <summary>
        /// The internal buffer size used - defaults to 4K
        /// </summary>
        public int BufferSize 
        {
            get { return m_blockSize;}
            set 
            { 
                if ( value >= MINBUFSIZE && value <= MAXBUFSIZE)
                    m_blockSize = value;
                if ( value > MAXBUFSIZE )
                    m_blockSize = MAXBUFSIZE;
                if ( value < MINBUFSIZE )
                    m_blockSize = MINBUFSIZE;
            }
        }

        /// <summary>
        /// Size of output files
        /// </summary>
        public long SegmentSize 
        {
            get { return m_segmentSize;}
            set 
            { 
                if ( value >= MINSEGSIZE && value <= MAXSEGSIZE )
                    m_segmentSize = value; 
                if ( value > MAXSEGSIZE )
                    m_segmentSize = MAXSEGSIZE;
                if ( value < MINSEGSIZE )
                    m_segmentSize = MINSEGSIZE;
            }
        }

        /// <summary>
        /// Output Path where split file will go
        /// This is not used
        /// </summary>
        private string OutputPath 
        {
            get { return m_outputPath; }
            set { m_outputPath = value; }
        }



        protected virtual void OnProgessNotify( int i)
        {
            if ( ProgressNotify != null )
            {
                try 
                {
                    ProgressNotify( i );
                }
                catch //catch & sqaush the exceptions...
                {}
            }

        }


        public void TestMethod ()
        {
            OnProgessNotify( 10 );
        }


        /// <summary>
        /// Test Method...
        /// </summary>
        //[STAThread]
        static int Main(string[] args)
        {
            if ( args.Length < 1 || args[0] == null || args[0] == "")
            {
                Console.WriteLine("Invalid command line;\nNeed filename");
                return 1;
            }
            //int segments = fileSplitter.SplitFile(@"C:\Data\My Videos\Monsters.WMV");
            FileSplitter fileSplitter = new FileSplitter();
            int segments = fileSplitter.SplitFile ( args[0] );
            return 0;
        }
    }
}
