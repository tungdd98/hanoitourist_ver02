using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;

namespace hanoitourist_ver02.admin.countries
{
    public partial class create : System.Web.UI.Page
    {
        Country dto = new Country();
        CountryBus bus = new CountryBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Title = title.Text;
            dto.IsNation = Byte.Parse(isNation.SelectedValue);
            bus.Insert(dto.Title, dto.IsNation);
            Response.Redirect("~/admin/countries/index.aspx");
        }
    }
}