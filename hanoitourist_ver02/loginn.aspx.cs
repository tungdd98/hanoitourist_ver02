using BUS;
using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hanoitourist_ver02
{
    public partial class loginn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        UserBus bus = new UserBus();
        protected void Button1_Click1(object sender, EventArgs e)
        {
            DataTable check = bus.Search(name.Text, passwords.Text);
            if (check != null)
            {
                int rule = Int32.Parse(check.Rows[0]["Permission"].ToString());
                Session["Email"] = name.Text;
                if (rule == 1)
                {
                    Response.Redirect("admin/dashboard/index.aspx");
                }
                else
                {
                    Response.Redirect("home/index.aspx");
                }
            }
            else
            {

            }
        }
    }
}