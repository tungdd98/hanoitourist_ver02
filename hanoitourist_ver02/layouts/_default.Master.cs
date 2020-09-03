using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DTO;

namespace hanoitourist_ver02.layouts
{
    public partial class _admin : System.Web.UI.MasterPage
    {
        HomeBus bus = new HomeBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNavigation();
            }
            if (Session["Email"] != null)
            {
                userLogin.Text = Session["Name"].ToString();
                register.Visible = false;
                login.Visible = false;
                userLogin.Visible = true;
                logout.Visible = true;
            }
            else
            {
                userLogin.Visible = false;
                logout.Visible = false;
                register.Visible = true;
                login.Visible = true;
            }
            Application_Start();
            Session_Start();
            userOnline.Text = "Số người đang truy cập : " + Membership.GetNumberOfUsersOnline().ToString();
            userVisited.Text = "Số lượt truy cập trang web : " + Application["quantity"].ToString();
        }
        public void LoadNavigation()
        {
            // Menu du lịch trong nước
            ListNav.DataSource = bus.GetCountries(0);
            ListNav.DataBind();
            // Menu du lịch nước ngoài
            ListNav2.DataSource = bus.GetCountries(1);
            ListNav2.DataBind();
        }
        void Application_Start()
        {
            Application.Lock();
            System.IO.StreamReader sr;
            sr = new System.IO.StreamReader(Server.MapPath("quantity.txt"));
            string quantity = sr.ReadLine();
            sr.Close();
            Application.UnLock();
            Application["quantity"] = quantity;
        }

        void Session_Start()
        {
            Application["quantity"] = int.Parse(Application["quantity"].ToString()) + 1;
            System.IO.StreamWriter sw;
            sw = new System.IO.StreamWriter(Server.MapPath("quantity.txt"));
            sw.Write(Application["quantity"].ToString());
            sw.Close();
        }
    }
}