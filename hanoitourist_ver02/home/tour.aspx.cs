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
    public partial class tour : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        public string id = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                id = Request.QueryString["id"].ToString();
                LoadTours();
                LoadDetail();
            }
        }
        public void LoadTours()
        {
            string query = "where Tours.DestinationLocationId = " + id;
            tourList.DataSource = bus.GetTours("", "", query);
            tourList.DataBind();
        }
        public void LoadDetail()
        {
            DataTable detail = bus.GetLocationDetail(id);
            textBreadcrumb.Text = detail.Rows[0]["Title"].ToString();
            title.Text = detail.Rows[0]["Title"].ToString();
            description.Text = detail.Rows[0]["Description"].ToString();
        }
        protected void buttonDesc_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            string query = "where Tours.DestinationLocationId = " + id;
            tourList.DataSource = bus.GetTours("", "", query, "priceDesc");
            tourList.DataBind();
        }

        protected void buttonAsc_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            string query = "where Tours.DestinationLocationId = " + id;
            tourList.DataSource = bus.GetTours("", "", query, "priceAsc");
            tourList.DataBind();
        }
    }
}