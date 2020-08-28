using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;

namespace hanoitourist_ver02.admin.price_tour
{
    public partial class edit : System.Web.UI.Page
    {
        PriceTour dto = new PriceTour();
        PriceTourBus bus = new PriceTourBus();
        CustomerTypeBus customerTypeBus = new CustomerTypeBus();
        TourBus tourBus = new TourBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDropList();
                int _customerTypeId = Int32.Parse(Request.QueryString["customerTypeId"].ToString());
                string _tourId = Request.QueryString["tourId"].ToString();
                DataTable td = new DataTable();
                td = bus.GetRecord(_customerTypeId, _tourId);
                originalPrice.Text = td.Rows[0]["OriginalPrice"].ToString();
                price.Text = td.Rows[0]["Price"].ToString();
                customerTypeId.SelectedValue = td.Rows[0]["CustomerTypeId"].ToString();
                tourId.SelectedValue = td.Rows[0]["TourId"].ToString();
            }
        }
        public void LoadDropList()
        {
            // CustomerType
            customerTypeId.DataSource = customerTypeBus.Show();
            customerTypeId.DataTextField = "Title";
            customerTypeId.DataValueField = "Id";
            customerTypeId.DataBind();
            customerTypeId.Enabled = false;
            // Tour
            tourId.DataSource = tourBus.Show();
            tourId.DataTextField = "Title";
            tourId.DataValueField = "Id";
            tourId.DataBind();
            tourId.Enabled = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.CustomerTypeId = Int32.Parse(Request.QueryString["customerTypeId"].ToString());
            dto.TourId = Request.QueryString["tourId"].ToString();
            dto.OriginalPrice = float.Parse(originalPrice.Text);
            dto.Price = float.Parse(price.Text);
            dto.CustomerTypeId = Int32.Parse(customerTypeId.SelectedValue);
            bus.Update(dto.OriginalPrice, dto.Price, dto.CustomerTypeId, dto.TourId);
            Response.Redirect("~/admin/price_tour/index.aspx?status=update-success");
        }
    }
}