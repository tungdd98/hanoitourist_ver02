using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

namespace hanoitourist_ver02.layouts
{
    public partial class _admin : System.Web.UI.MasterPage
    {
        HomeBus bus = new HomeBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadNavigation();
            }
        }
        public void LoadNavigation()
        {
            ListNav.DataSource = bus.GetCountries(0);
            ListNav.DataBind();
        }
    }
}