using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

namespace hanoitourist_ver02.home
{
    public partial class viewmore : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string type = Request.QueryString["type"].ToString();
                tourViewMore.DataSource = bus.GetTours(type);
                tourViewMore.DataBind();
                switch(type)
                {
                    case "sale":
                        titleViewMore.InnerText = "Hot tour - tour khuyến mãi";
                        textBreadcrumb.Text = "Hot tour - tour khuyến mãi";
                        break;
                    case "nation":
                        titleViewMore.InnerText = "Tour trong nước";
                        textBreadcrumb.Text = "Tour trong nước";
                        break;
                    case "enternation":
                        titleViewMore.InnerText = "Tour nước ngoài";
                        textBreadcrumb.Text = "Tour nước ngoài";
                        break;
                }
            }
        }
    }
}