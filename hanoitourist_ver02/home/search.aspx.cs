using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

namespace hanoitourist_ver02.home
{
    public partial class search : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string departureId = Request.QueryString["departureId"].ToString();
                string destinationId = Request.QueryString["destinationId"].ToString();
                string startDay = Request.QueryString["date"].ToString();
                string timeStart = Request.QueryString["time"].ToString();
                string price = Request.QueryString["price"].ToString();

                date.Text = startDay == "" ? "" : "ngày " + startDay;
                departureName.Text = bus.GetLocationDetail(departureId).Rows[0]["Title"].ToString();
                destinationName.Text = bus.GetLocationDetail(destinationId).Rows[0]["Title"].ToString();

                string query = "where Tours.DepartureLocationId = " + departureId + " " +
                    "and Tours.DestinationLocationId = " + destinationId + " ";

                if(timeStart != "")
                {
                    query += "and Tours.TimeId = " + timeStart + " ";
                }

                tourSearch.DataSource = bus.GetTours("", "", query, price, startDay);
                tourSearch.DataBind();
            }
        }
    }
}