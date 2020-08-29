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
    public partial class create : System.Web.UI.Page
    {
        DepartureDay dto = new DepartureDay();
        DepartureDayBus bus = new DepartureDayBus();
        TourBus tourBus = new TourBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadTour();
            }
        }
        public void LoadTour()
        {
            tourId.DataSource = tourBus.Show();
            tourId.DataTextField = "Title";
            tourId.DataValueField = "Id";
            tourId.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.StartDay = DateTime.Parse(startDay.Text);
            dto.StartTime = TimeSpan.Parse(startTime.Text);
            dto.TourId = tourId.SelectedValue;
            bus.Insert(dto.TourId, dto.StartDay, dto.StartTime);
            Button1.Enabled = false;
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Thêm mới thành công!!"), true);
        }
    }
}