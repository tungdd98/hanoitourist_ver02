using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Helper
    {
        public static string ShowMessage(string message)
        {
            string script = "window.onload = function(){ swAlert('";
            script += message;
            script += "')};";
            script += "setTimeout(() => window.location.href = 'index.aspx', 1000)";
            return script;
        }
    }
}
