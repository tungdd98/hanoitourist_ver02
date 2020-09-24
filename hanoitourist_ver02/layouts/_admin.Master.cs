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
            if (Session["Email"] != null)
            {
                userName.Text = Session["Name"].ToString();
                if (Int32.Parse(Session["Rule"].ToString()) != 1)
                {
                    Response.Redirect("~/home/index.aspx");
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Session["Email"] = null;
            Response.Redirect("~/home/index.aspx");
        }
    }
}