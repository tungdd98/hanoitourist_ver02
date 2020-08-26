using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;

namespace hanoitourist_ver02.admin.vehicle
{
    public partial class delete : System.Web.UI.Page
    {
        VehicleTour dto = new VehicleTour();
        VehicleTourBus bus = new VehicleTourBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            bus.Delete(dto.Id);
            Response.Redirect("~/admin/vehicle/index.aspx");
        }
    }
}