using System;
using System.IO;
using System.Collections;
using System.Text.RegularExpressions;

namespace SQMS.IntegrityServices
{
	/// <summary>
	/// Summary description for FileJoiner.
	/// </summary>
	public class FileJoiner
	{
		private int m_blockSize = 4096; //arbitrary
        private bool m_beenCleaned = false;

        public event ProgressNotifyHandler ProgressNotify;


		static void Main ( string[] args )
		{
			//TestCase2();
			TestCase1();
		}


		/// <summary>
		/// Takes a file name in the series and uses existing filename to
		/// create a joined version in the same directory.
		/// ie. m.zip.0 m.zip.1....   becomes m.zip
		/// </summary>
		/// <param name="fileName">1st file in series</param>
		public void JoinFile ( string fileName )
		{
			this.JoinFile( fileName, null );

		}

		/// <summary>
		/// Takes the 1st file in the series and uses 
		/// outFile as the output filename.
		/// </summary>
		/// <param name="fileName">1st file in series</param>
		/// <param name="outFile">target file name</param>
		public void JoinFile ( string fileName, string outFile )
		{
			string basePath = System.IO.Path.GetDirectoryName( fileName );
			string baseFileName = Path.GetFileNameWithoutExtension( fileName );
			int baseFileNumber = Utilities.GetFileNumber ( fileName );
			if ( baseFileNumber != 0 ) 
			{
				throw new ArgumentException ( "Invalid starting file name - must end in '0'", "fileName");
			}
			ArrayList fileList = new ArrayList(System.IO.Directory.GetFiles( basePath, baseFileName + @".*" ));
			CleanArrayList(fileList);
			if ( outFile == null ) outFile = basePath + @"\" + baseFileName;
			JoinFile( (string[]) fileList.ToArray( typeof(string) ), outFile );
		}


		/// <summary>
		/// Simply takes an array of file names and just creates 1 output file
		/// by concatenation.  It uses the list of files in the order they are
		/// in the string[].
		/// </summary>
		/// <param name="fileList">an array of file names that will be joined together as one</param>
		/// <param name="outFile">output file name</param>
		public void JoinFile ( string[] fileList, string outFile )
		{
            fileList = CleanArrayList ( fileList );
			FileInfo[] fileInfo = new FileInfo[fileList.Length];
			for ( int i = 0; i < fileList.Length; i++ )
			{
				fileInfo[i] = new FileInfo( fileList[i] );
				if ( ! fileInfo[i].Exists )
					throw new IOException( String.Format("file {0} doesn't exist", fileList[i] ) );
			}
			//open outfile exclusively
			FileStream fsOut = null;
			try 
			{
				fsOut = File.Open( outFile, FileMode.Create, FileAccess.Write, FileShare.None);

				int bytesRead = 0;
				byte[] buffer = new byte[m_blockSize];
				for ( int i = 0; i < fileList.Length; i++ )
				{
					FileStream fsIn = null;
					try 
					{
						fsIn = File.Open( fileInfo[i].FullName, FileMode.Open, FileAccess.Read, FileShare.Read);
						while ( 0 < (bytesRead = fsIn.Read( buffer, 0, m_blockSize )) )
						{
							fsOut.Write( buffer, 0, bytesRead );
						}
                        OnProgessNotify( Utilities.GetPercentComplete ( i, fileList.Length ));
					}
					finally 
					{
						if ( fsIn != null ) fsIn.Close();
					}
				}
				fsOut.Flush();
			}
			finally 
			{
				if ( fsOut != null ) fsOut.Close();
                OnProgessNotify( 100 );
            }

		}

		/// <summary>
		/// Removes file names that don't end in a number m.zip.0 
		/// Crude, Regex is the right way.
		/// </summary>
		/// <param name="arrList"></param>
		private void CleanArrayList ( ArrayList arrList )
		{
            if ( ! m_beenCleaned )
            {
                for ( int i = 0; i < arrList.Count; i++)
                {
                    if ( Utilities.GetFileNumber ( (string) arrList[i] ) == -1 )
                    {
                        arrList.Remove( arrList[i] );
                    }
                }
                arrList.Sort( new FileListComparer() );
            }
            m_beenCleaned = true;

		}

        private string[] CleanArrayList ( string[] fileList )
        {
            ArrayList arrList = new ArrayList( fileList );
            CleanArrayList ( arrList );
            return (string[]) arrList.ToArray( typeof(string) );

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


		#region Tests
		static void TestCase1 ()
		{
			FileJoiner fj = new FileJoiner();
			string[] files = new string[12];
			files[0] = @"c:\temp\m.zip.0";
			files[1] = @"c:\temp\m.zip.7";
			files[2] = @"c:\temp\m.zip.2";
			files[3] = @"c:\temp\m.zip.3";
			files[4] = @"c:\temp\m.zip.1";
            files[5] = @"c:\temp\m.zip.4";
            files[6] = @"c:\temp\m.zip.5";
            files[7] = @"c:\temp\m.zip.6";
            files[8] = @"c:\temp\m.zip.8";
            files[9] = @"c:\temp\m.zip.9";
            files[10] = @"c:\temp\m.zip.10";
            files[11] = @"c:\temp\m.zip.11";

            string resultFile = @"c:\temp\out.zip";
			fj.JoinFile( files, resultFile );

		}
		static void TestCase2 ()
		{
			FileJoiner fj = new FileJoiner();
			fj.JoinFile( @"c:\temp\m.zip.0");

		}
		#endregion

	}

	/// <summary>
	/// Class used to sort the array of filenames assuming they are filenames
	/// that contain a numeric as the last set of characters "after" the file extension.
	/// </summary>
	class FileListComparer : IComparer
	{
		#region IComparer Members

		public int Compare(object x, object y)
		{
			if ( Utilities.GetFileNumber( (string)x) < Utilities.GetFileNumber( (string)y) )
				return -1;
			if ( Utilities.GetFileNumber( (string)x) > Utilities.GetFileNumber( (string)y) )
				return 1;
			return 0;
		}

		#endregion

	}

	


}
