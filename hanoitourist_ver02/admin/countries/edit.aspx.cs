using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;

namespace hanoitourist_ver02.admin.countries
{
    public partial class edit : System.Web.UI.Page
    {
        Country dto = new Country();
        CountryBus bus = new CountryBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadData();
            }
        }

        public void LoadData()
        {
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            DataTable td = new DataTable();
            td = bus.GetRecord(id);
            title.Text = td.Rows[0]["Title"].ToString();
            isNation.SelectedValue = td.Rows[0]["IsNation"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            dto.Title = title.Text;
            dto.IsNation = Byte.Parse(isNation.SelectedValue);
            bus.Update(dto.Id, dto.Title, dto.IsNation);
            Response.Redirect("~/admin/countries/index.aspx");
        }
    }
}