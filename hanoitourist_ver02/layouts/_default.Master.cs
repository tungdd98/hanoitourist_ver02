using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                userLogin.Text = Session["Email"].ToString();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Response.Redirect("index.aspx");
        }
    }
}