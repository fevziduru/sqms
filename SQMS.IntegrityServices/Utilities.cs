using System;
using System.IO;
using System.Collections;
using System.Text.RegularExpressions;

namespace SQMS.IntegrityServices
{
    internal class Utilities
    {
        /// <summary>
        /// Simple utility just to get me the numeric value
        /// </summary>
        /// <param name="fileName">Filename to parse for the ".0" characters.</param>
        /// <returns>numeric value of the file; -1 if invalid or not numeric</returns>
        public static int GetFileNumberOld ( string fileName )
        {
            try 
            {
                int i = fileName.LastIndexOf('.');
                string s = fileName.Substring( i + 1, fileName.Length - i - 1 );
                return int.Parse ( fileName.Substring( i + 1, fileName.Length - i - 1 ));
            }
            catch //(Exception ex )
            {
                return -1;
            }
        }

        /// <summary>
        /// Simple utility just to get me the numeric value
        /// </summary>
        /// <param name="fileName">Filename to parse for the ".0" characters.</param>
        /// <returns>numeric value of the file; -1 if invalid or not numeric</returns>
        public static int GetFileNumber ( string fileName )
        {
            Regex regex = new Regex(
                @"\d+$", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.IgnorePatternWhitespace );

            try 
            {
                Match match = regex.Match( fileName);
                if ( match.Groups.Count > 1 )
                {
                    throw new ApplicationException( String.Format("bad match on file {0} trying to get filenumber", fileName));
                }
                if ( match.Groups.Count < 1 )
                    return -1;

                Group group = match.Groups[0];
                return int.Parse(group.Value);
            }
            catch
            {
                return -1;
            }
        }

        public static int GetPercentComplete ( int x, int y )
        {
            try 
            {
                return 100 * x/y ;
            }
            catch
            {
                return 0;
            }
        }
    }
}
