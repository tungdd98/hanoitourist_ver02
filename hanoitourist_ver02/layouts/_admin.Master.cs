using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hanoitourist_ver02.layouts
{
    public partial class _default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                userName.Text = Session["UserName"].ToString();
            }
        }
       
        protected void Button1_Click1(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Response.Redirect("~/home/index.aspx");
        }
    }
}