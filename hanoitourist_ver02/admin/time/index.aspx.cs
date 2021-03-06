﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;

namespace hanoitourist_ver02.admin.time
{
    public partial class index : System.Web.UI.Page
    {
        TimeTourBus bus = new TimeTourBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ShowItems();
            }
        }

        public void ShowItems()
        {
            GridView1.DataSource = bus.Show();
            GridView1.DataBind();
        }

        public void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowItems();
        }
    }
}