﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;

namespace hanoitourist_ver02.admin.customer_type
{
    public partial class delete : System.Web.UI.Page
    {
        CustomerType dto = new CustomerType();
        CustomerTypeBus bus = new CustomerTypeBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            bus.Delete(dto.Id);
            Response.Redirect("~/admin/customer_type/index.aspx?status=delete-success");
        }
    }
}