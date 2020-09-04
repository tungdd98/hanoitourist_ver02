using BUS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hanoitourist_ver02.admin.dashboard
{
    public partial class index : System.Web.UI.Page
    {
        OrderDetailBus bus = new OrderDetailBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                userOnline.Text = Membership.GetNumberOfUsersOnline().ToString();
                userVisited.Text = Application["quantity"].ToString();
            }
            DataTable dt = bus.getBestSellerTour();
            tourName.Text = dt.Rows[0]["Title"].ToString();
            tourQuantity.Text = dt.Rows[0]["tong"].ToString();
        }
    }
}