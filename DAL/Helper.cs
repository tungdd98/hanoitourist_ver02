using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Helper
    {
        // Show thông báo 
        public static string ShowMessage(string message, string type = "success", string href = "index.aspx")
        {
            string script = "window.onload = function(){ swAlert('";
            script += message;
            script += "', '";
            script += type;
            script += "')};";
            script += "setTimeout(() => window.location.href =" + "'" + href + "',1000)";
            return script;
        }
        // Mã hoá password
        public static string GetMD5(string str)
        {

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));
            StringBuilder sbHash = new StringBuilder();

            foreach (byte b in bHash)
            {
                sbHash.Append(String.Format("{0:x2}", b));
            }

            return sbHash.ToString();
        }
    }
}
