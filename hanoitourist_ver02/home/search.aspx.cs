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
        string departureId, destinationId, startDay, timeStart, price, nation, textSearch;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                textSearch = Request.QueryString["search"].ToString();
                if (textSearch == "")
                {
                    GetQuery();
                    date.Text = startDay == "" ? "" : "ngày " + "<strong class='text-mid-blue'>" + startDay + "</strong>";
                    departureName.Text = "từ " + "<strong class='text-mid-blue'>" + bus.GetLocationDetail(departureId).Rows[0]["Title"].ToString() + "</strong>";
                    destinationName.Text = "đến " + "<strong class='text-mid-blue'>" + bus.GetLocationDetail(destinationId).Rows[0]["Title"].ToString() + "</strong>";

                    string query = "where Tours.DepartureLocationId = " + departureId + " " +
                        "and Tours.DestinationLocationId = " + destinationId + " ";

                    if (timeStart != "")
                    {
                        query += "and Tours.TimeId = " + timeStart + " ";
                    }

                    tourSearch.DataSource = bus.GetTours(nation, "", query, price, startDay);
                    tourSearch.DataBind();
                } else
                {
                    string query = "where Tours.Title like '%" + textSearch + "%' or Tours.Id like '%" + textSearch + "' ";
                    tourSearch.DataSource = bus.GetTours("", "", query);
                    tourSearch.DataBind();
                    keySearch.Text = "với từ khoá " + "<i class='text-mid-blue'>" + textSearch + "</i>";
                }
                textCountResult.Text = tourSearch.Items.Count.ToString();
            }
        }
        public void GetQuery()
        {
            departureId = Request.QueryString["departureId"].ToString();
            destinationId = Request.QueryString["destinationId"].ToString();
            startDay = Request.QueryString["date"].ToString();
            timeStart = Request.QueryString["time"].ToString();
            price = Request.QueryString["price"].ToString();
            nation = Request.QueryString["nation"].ToString();
        }
    }
}