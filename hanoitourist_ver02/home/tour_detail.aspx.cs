using BUS;
using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hanoitourist_ver02.home
{
    public partial class tour_detail : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            List<Tour> tourDetail = new List<Tour>();
            tourDetail = bus.GetTours("", "", "where Id = '" + id + "'");
            title.Text = tourDetail[0].Title;
            textBreadcrumb.Text = tourDetail[0].Title;
            idTourDetail.Text = tourDetail[0].Id;
            startAt.Text = tourDetail[0].DepartureName;
            goTo.Text = tourDetail[0].DestinationName;
            timeStart.Text = tourDetail[0].TimeName;
            vehicle.Text = tourDetail[0].VehicleName;
            slots.Text = tourDetail[0].Place.ToString();
            schedule.Text = tourDetail[0].Schedule;
            description.Text = tourDetail[0].Description;
            content.Text = tourDetail[0].Content;
            thumbnail.ImageUrl = "~/publics/uploads/tours/" + tourDetail[0].Thumbnail;

            departureDay.DataSource = tourDetail[0].DepartureDay;
            departureDay.DataBind();
            detailPrice.DataSource = tourDetail[0].DepartureDay;
            detailPrice.DataBind();
        }
    }
}