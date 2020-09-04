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
    public partial class confirm : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        OrderBus orderBus = new OrderBus();
        CustomerBus customerBus = new CustomerBus();
        OrderDetailBus orderDetailBus = new OrderDetailBus();
        TourBus tourBus = new TourBus();
        public static List<Cart> carts;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carts = new List<Cart>();
                if (Session["carts"] == null)
                {
                    Response.Redirect("~/home/index.aspx");
                }
                else
                {
                    carts = Session["carts"] as List<Cart>;
                }

                myCartList.DataSource = carts;
                myCartList.DataBind();
                lbTotalMoney.Text = Convert.ToDecimal(Session["Total"]).ToString("#,##"); ;
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            byte typePayment = 0,
                methodPayment = 0;

            if (rdoType1.Checked)
            {
                typePayment = 1;
            }

            if (rdoMethod1.Checked)
            {
                methodPayment = 1;
            }

            bool isSuccess = true;
            foreach (Cart cart in carts)
            {
                int place = cart.Place,
                    slot = 0;
                foreach (CartDepartureDay cartDeparture in cart.CartDepartureDays)
                {
                    foreach (CartPrice cartPrice in cartDeparture.CartPrices)
                    {
                        if (cartPrice.Quantity > 0)
                        {
                            slot += cartPrice.Quantity;
                            if (slot > place)
                            {
                                isSuccess = false;
                                break;
                            }
                        }
                    }
                }
            }

            if (!isSuccess)
            {
                Response.Write("<script>alert('Xin lỗi số lượng tour khách hàng đặt vượt quá giới hạn!!')</script>");
            }
            else
            {
                int orderId;
                if (Session["Email"] != null)
                {
                    orderId = orderBus.Insert(
                        "UserId",
                        int.Parse(Session["UserId"].ToString()),
                        float.Parse(Session["Total"].ToString()),
                        typePayment,
                        methodPayment
                    );
                }
                else
                {
                    int customerId = customerBus.InsertReturn(
                        name.Text,
                        nation.Text,
                        address.Text,
                        phone.Text,
                        email.Text,
                        content.Text
                    );

                    orderId = orderBus.Insert(
                        "CustomerId",
                        customerId,
                        float.Parse(Session["Total"].ToString()),
                        typePayment,
                        methodPayment
                    );
                }
                foreach (Cart cart in carts)
                {
                    int place = cart.Place,
                        slot = 0;
                    foreach (CartDepartureDay cartDeparture in cart.CartDepartureDays)
                    {
                        foreach (CartPrice cartPrice in cartDeparture.CartPrices)
                        {
                            if (cartPrice.Quantity > 0)
                            {
                                slot += cartPrice.Quantity;
                                orderDetailBus.Insert(
                                    orderId,
                                    cart.TourId,
                                    cartPrice.CustomerTypeId,
                                    cartDeparture.DepartureDayId,
                                    cartPrice.Quantity
                                );
                            }
                        }
                    }
                    tourBus.DecrementPlace(cart.TourId, place - slot);
                }

                Session["carts"] = null;
                Session["Total"] = 0;
                // Gửi mail
                string gmail = Session["Email"] == null ? email.Text : Session["Email"].ToString();
                Response.Redirect("~/home/finish.aspx");
            }
        }
    }
}