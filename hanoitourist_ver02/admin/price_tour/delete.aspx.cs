﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using DAL;

namespace hanoitourist_ver02.admin.price_tour
{
    public partial class delete : System.Web.UI.Page
    {
        PriceTour dto = new PriceTour();
        PriceTourBus bus = new PriceTourBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.CustomerTypeId = Int32.Parse(Request.QueryString["customerTypeId"].ToString());
            dto.TourId = Request.QueryString["tourId"].ToString();
            bus.Delete(dto.CustomerTypeId, dto.TourId);
            Button1.Enabled = false;
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Xoá thành công!!"), true);
        }
    }
}