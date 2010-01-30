using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.IO;
using System.Collections;
using SQMS.IntegrityServices;

namespace SQMS.IntegrityServices
{
    /// <summary>
    /// Summary description for FileJoinService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class FileJoinService : System.Web.Services.WebService
    {

        [WebMethod]
        public string BasePath()
        {
            return Context.Server.MapPath("/QualityData");
        }

        [WebMethod]
        public bool JoinFile(string deviceId, string fileName)
        {
            try
            {
                if (!CheckFileName(fileName)) return false;

                string basePath = Context.Server.MapPath("/QualityData");
                //string basePath = System.IO.Path.GetDirectoryName(fileName);
                string baseFileName = Path.GetFileNameWithoutExtension(@basePath + "\\" + fileName);
                string baseFileExtName = Path.GetExtension(@basePath + "\\" + fileName);

                SQMS.IntegrityServices.FileJoiner fj = new SQMS.IntegrityServices.FileJoiner();
                fj.JoinFile(@basePath + "\\" + fileName);


                ArrayList fileList = new ArrayList(System.IO.Directory.GetFiles(@basePath, baseFileName + @".*"));

                int baseFileNumber = fileList.Count;

                for (int i = 0; i < baseFileNumber; i++)
                {
                    if (@basePath + "\\" + baseFileName != fileList[i].ToString())
                        File.Delete(fileList[i].ToString());
                }

                if (!File.Exists(@basePath + "\\" + deviceId)) Directory.CreateDirectory(@basePath + "\\" + deviceId);

                File.Move(@basePath + "\\" + baseFileName, @basePath + "\\" + deviceId + "\\" + baseFileName);


                string[] sArray = baseFileName.Split('.');

                File.Move(@basePath + "\\" + sArray[0].ToString() + ".txt", @basePath + "\\" + deviceId + "\\" + sArray[0].ToString() + ".txt");
            }
            catch (Exception ex)
            {

                return false;
            }
            return true;

        }

        private bool CheckFileName(string filename)
        {
            if ((filename == "") || (filename == null))
            {
                return false;
            }
            return true;
        }
    }
}
