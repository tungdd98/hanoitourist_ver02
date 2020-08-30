using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DTO;

namespace hanoitourist_ver02.admin.user
{
    public partial class index : System.Web.UI.Page
    {
        UserBus bus = new UserBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowItems();
        }

        public void ShowItems()
        {
            GridView1.DataSource = bus.Show();
            GridView1.DataBind();
        }

        public void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowItems();
        }
    }
}