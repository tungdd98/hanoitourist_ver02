using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;

namespace hanoitourist_ver02.admin.time
{
    public partial class create : System.Web.UI.Page
    {
        TimeTour dto = new TimeTour();
        TimeTourBus bus = new TimeTourBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Title = title.Text;
            bus.Insert(dto.Title);
            Response.Redirect("~/admin/time/index.aspx?status=add-success");
        }
    }
}