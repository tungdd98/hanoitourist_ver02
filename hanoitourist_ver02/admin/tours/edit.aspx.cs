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

namespace hanoitourist_ver02.admin.tours
{
    public partial class edit : System.Web.UI.Page
    {
        Tour dto = new Tour();
        TourBus bus = new TourBus();
        TimeTourBus timeBus = new TimeTourBus();
        VehicleTourBus vehicleBus = new VehicleTourBus();
        LocationBus locationBus = new LocationBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropDown();
                string id = Request.QueryString["id"].ToString();
                DataTable td = new DataTable();
                td = bus.GetRecord(id);
                title.Text = td.Rows[0]["Title"].ToString();
                description.Text = td.Rows[0]["Description"].ToString();
                content.Text = td.Rows[0]["Content"].ToString();
                departureLocationId.SelectedValue = td.Rows[0]["DepartureLocationId"].ToString();
                destinationLocationId.SelectedValue = td.Rows[0]["DestinationLocationId"].ToString();
                timeId.SelectedValue = td.Rows[0]["TimeId"].ToString();
                vehicleId.SelectedValue = td.Rows[0]["VehicleId"].ToString();
                place.Text = td.Rows[0]["Place"].ToString();
                schedule.Text = td.Rows[0]["Schedule"].ToString();
            }
        }
        public void LoadDropDown()
        {
            // Điểm khởi hành
            departureLocationId.DataSource = locationBus.GetLocationByWhere(1);
            departureLocationId.DataTextField = "Title";
            departureLocationId.DataValueField = "Id";
            departureLocationId.DataBind();
            // Điểm đến
            destinationLocationId.DataSource = locationBus.GetLocationByWhere();
            destinationLocationId.DataTextField = "Title";
            destinationLocationId.DataValueField = "Id";
            destinationLocationId.DataBind();
            // Thời gian
            timeId.DataSource = timeBus.Show();
            timeId.DataTextField = "Title";
            timeId.DataValueField = "Id";
            timeId.DataBind();
            // Phương tiện
            vehicleId.DataSource = vehicleBus.Show();
            vehicleId.DataTextField = "Title";
            vehicleId.DataValueField = "Id";
            vehicleId.DataBind();
        }
        private void SaveFileUpload()
        {
            string filePath = "";
            if (thumbnail.FileName != "")
            {
                filePath = Server.MapPath("~/publics/uploads/tours/" + thumbnail.FileName);
                thumbnail.PostedFile.SaveAs(filePath);
                dto.Thumbnail = thumbnail.FileName;
            }
            else
            {
                dto.Thumbnail = "";
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveFileUpload();
            dto.Id = Request.QueryString["id"].ToString();
            dto.Title = title.Text;
            dto.Description = description.Text;
            dto.Content = content.Text;
            dto.Place = Int32.Parse(place.Text);
            dto.Schedule = schedule.Text;
            dto.DepartureLocationId = Int32.Parse(departureLocationId.SelectedValue);
            dto.DestinationLocationId = Int32.Parse(destinationLocationId.SelectedValue);
            dto.TimeId = Int32.Parse(timeId.SelectedValue);
            dto.VehicleId = Int32.Parse(vehicleId.SelectedValue);
            bus.Update(dto.Id, dto.Title, dto.Thumbnail, dto.Description, dto.Content, dto.DepartureLocationId, dto.DestinationLocationId, dto.TimeId, dto.VehicleId, dto.Place, dto.Schedule);
            Button1.Enabled = false;
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Cập nhật thành công!!"), true);
        }
    }
}