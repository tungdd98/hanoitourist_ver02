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
    public partial class create : System.Web.UI.Page
    {
        PriceTour dto = new PriceTour();
        PriceTourBus bus = new PriceTourBus();
        CustomerTypeBus customerTypeBus = new CustomerTypeBus();
        TourBus tourBus = new TourBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDropList();
            }
        }
        public void LoadDropList()
        {
            // CustomerType
            customerTypeId.DataSource = customerTypeBus.Show();
            customerTypeId.DataTextField = "Title";
            customerTypeId.DataValueField = "Id";
            customerTypeId.DataBind();
            // Tour
            tourId.DataSource = tourBus.Show();
            tourId.DataTextField = "Title";
            tourId.DataValueField = "Id";
            tourId.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.OriginalPrice = float.Parse(originalPrice.Text);
            dto.Price = float.Parse(price.Text);
            dto.CustomerTypeId = Int32.Parse(customerTypeId.SelectedValue);
            dto.TourId = tourId.SelectedValue;
            bus.Insert(dto.OriginalPrice, dto.Price, dto.CustomerTypeId, dto.TourId);
            Response.Redirect("~/admin/price_tour/index.aspx?status=add-success");
        }
    }
}