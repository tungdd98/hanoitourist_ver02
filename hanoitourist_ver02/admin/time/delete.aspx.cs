using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using DAL;

namespace hanoitourist_ver02.admin.time
{
    public partial class delete : System.Web.UI.Page
    {
        TimeTour dto = new TimeTour();
        TimeTourBus bus = new TimeTourBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            bus.Delete(dto.Id);
            Button1.Enabled = false;
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Xoá thành công!!"), true);
        }
    }
}