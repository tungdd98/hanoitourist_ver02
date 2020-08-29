using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;
using DAL;

namespace hanoitourist_ver02.admin.vehicle
{
    public partial class edit : System.Web.UI.Page
    {
        VehicleTour dto = new VehicleTour();
        VehicleTourBus bus = new VehicleTourBus();
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            dto.Title = title.Text;
            bus.Update(dto.Id, dto.Title);
            Button1.Enabled = false;
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Cập nhật thành công!!"), true);
        }
    }
}