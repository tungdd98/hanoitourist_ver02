using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Helper
    {
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
    }
}
