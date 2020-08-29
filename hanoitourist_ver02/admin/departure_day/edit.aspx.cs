using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using DAL;
using System.Data;

namespace hanoitourist_ver02.admin.departure_day
{
    public partial class edit : System.Web.UI.Page
    {
        DepartureDay dto = new DepartureDay();
        DepartureDayBus bus = new DepartureDayBus();
        TourBus tourBus = new TourBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        public void LoadData()
        {
            LoadDropList();
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            DataTable td = new DataTable();
            td = bus.GetRecord(id);

            startDay.Text = td.Rows[0]["StartDay"].ToString();
            tourId.SelectedValue = td.Rows[0]["TourId"].ToString();
            startTime.Text = td.Rows[0]["StartTime"].ToString();
        }
        public void LoadDropList()
        {
            tourId.DataSource = tourBus.Show();
            tourId.DataTextField = "Title";
            tourId.DataValueField = "Id";
            tourId.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            dto.StartDay = DateTime.Parse(startDay.Text);
            dto.StartTime = TimeSpan.Parse(startTime.Text);
            dto.TourId = tourId.SelectedValue;
            bus.Update(dto.Id, dto.TourId, dto.StartDay, dto.StartTime);
            Button1.Enabled = false;
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Cập nhật thành công!!"), true);
        }
    }
}