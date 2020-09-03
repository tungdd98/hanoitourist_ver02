using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;

namespace hanoitourist_ver02.home
{
    public partial class checkout : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        public static List<Cart> carts;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carts = new List<Cart>();
                if (Session["carts"] == null)
                {
                    Session["carts"] = carts;
                }
                else
                {
                    carts = Session["carts"] as List<Cart>;
                }

                // Kiểm tra action
                if (!String.IsNullOrEmpty(Request.QueryString["action"]))
                {
                    switch (Request.QueryString["action"])
                    {
                        case "add":
                            AddCart();
                            break;
                        case "delete":
                            DeleteCart();
                            break;
                        case "destroy":
                            Destroy();
                            carts = null;
                            break;
                    }
                }
                FetchData();
                GetTotalMoney();
            }
        }
        // Hiển thị giỏ hàng
        public void FetchData()
        {
            cartList.DataSource = carts;
            cartList.DataBind();
            myCartList.DataSource = carts;
            myCartList.DataBind();
        }
        // Thêm mới sản phẩm vào giỏ
        public void AddCart()
        {
            string tourId = Request.QueryString["id"];
            bool isExisted = false;

            foreach (Cart cart in carts)
            {
                if (cart.TourId == tourId)
                {
                    isExisted = true;
                    break;
                }
            }

            if (!isExisted)
            {
                List<Tour> tours = bus.GetTours("", "", "where Tours.Id = '" + tourId + "'");
                Tour tour = tours[0];

                int quantity = tour.DepartureDay.Count == 1 ? 1 : 0;
                float total = 0;
                
                List<CartDepartureDay> cartDepartureDays = new List<CartDepartureDay>();
                foreach (DepartureDay itemDepatureDay in tour.DepartureDay)
                {
                    List<CartPrice> cartPrices = new List<CartPrice>();
                    foreach (PriceTour itemPriceTour in tour.PriceTour)
                    {
                        cartPrices.Add(new CartPrice(
                            itemPriceTour.Price,
                            itemPriceTour.CustomerTypeId,
                            itemPriceTour.CustomerName,
                            quantity
                        ));
                        total += quantity * itemPriceTour.Price;
                    }
                    cartDepartureDays.Add(new CartDepartureDay(
                        itemDepatureDay.Id,
                        itemDepatureDay.StartDay,
                        itemDepatureDay.StartTime,
                        cartPrices,
                        total
                    ));
                }

                carts.Add(new Cart(
                    tourId,
                    tour.Title,
                    tour.DepartureName,
                    tour.TimeName,
                    tour.VehicleName,
                    tour.Place,
                    tour.Thumbnail,
                    cartDepartureDays
                ));
            }
        }
        // Xoá toàn bộ giỏ
        public void Destroy()
        {
            Session["carts"] = null;
            Session["Total"] = 0;
            Session["TotalQuantity"] = 0;
        }
        // Xoá sản phẩm trong giỏ hàng
        public void DeleteCart()
        {
            string tourId = Request.QueryString["id"];
            carts.RemoveAll(cart => cart.TourId == tourId);
        }
        // Cập nhật giỏ hàng
        public void UpdateCart(int idxTourId, int idxDayId, int idxPriceId, int quantity, float total)
        {
            carts[idxTourId].CartDepartureDays[idxDayId].CartPrices[idxPriceId].Quantity = quantity;
            carts[idxTourId].CartDepartureDays[idxDayId].Total = total;
        }
        // Tính tổng tiền giỏ hàng
        public void GetTotalMoney()
        {
            float totalMoney = 0;
            if(carts.Count > 0)
            {
                foreach (Cart cart in carts)
                {
                    foreach (CartDepartureDay cartDepartureDay in cart.CartDepartureDays)
                    {
                        totalMoney += cartDepartureDay.Total;
                    }
                }
            }
            
            Session["Total"] = totalMoney;
            Session["TotalQuantity"] = carts.Count;
            lbTotalMoney.Text = Convert.ToDecimal(Session["Total"]).ToString("#,##"); ;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            foreach (ListViewItem itemCart in cartList.Items)
            {
                ListView cartListDays = (ListView)(itemCart.FindControl("cartListDays"));
                int idxTourId = itemCart.DataItemIndex;
                foreach (ListViewItem itemDay in cartListDays.Items)
                {
                    ListView cartListPrices = (ListView)(itemDay.FindControl("cartListPrices"));
                    int idxDayId = itemDay.DataItemIndex;
                    float totalItem = 0;
                    foreach (ListViewItem itemPrice in cartListPrices.Items)
                    {
                        int idxPriceId = itemPrice.DataItemIndex;
                        TextBox txtQuantity = (TextBox)(itemPrice.FindControl("txtQuantity"));
                        int quantity = int.Parse(txtQuantity.Text);
                        float price = float.Parse(carts[idxTourId].CartDepartureDays[idxDayId].CartPrices[idxPriceId].Price.ToString());
                        totalItem += quantity * price;


                        UpdateCart(idxTourId, idxDayId, idxPriceId, quantity, totalItem);
                    }
                }
            }

            Session["carts"] = carts;
            FetchData();
            GetTotalMoney();
        }
    }
}