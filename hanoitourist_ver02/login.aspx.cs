using BUS;
using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

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
            DataTable user = bus.Search(name.Text, Helper.GetMD5(passwords.Text));
            if (user != null)
            {
                int rule = Int32.Parse(user.Rows[0]["Permission"].ToString());
                Session["Email"] = name.Text;
                Session["Name"] = user.Rows[0]["Name"].ToString();
                Session["Rule"] = rule;
                Session["UserId"] = user.Rows[0]["Id"].ToString();

                if (rule == 1)
                {
                    Response.Redirect("admin/dashboard/index.aspx");
                }
                else
                {
                    Response.Redirect("home/index.aspx");
                }
            }
        }
    }
}