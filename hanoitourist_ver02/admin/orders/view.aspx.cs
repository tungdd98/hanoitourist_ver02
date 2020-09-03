using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using DAL;
using System.Data;

namespace hanoitourist_ver02.admin.orders
{
    public partial class view : System.Web.UI.Page
    {
        OrderDetailBus bus = new OrderDetailBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        public void LoadData()
        {
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            DataTable tb = new DataTable();
            tb = bus.GetRecord(id);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            lbOrderId.Text = tb.Rows[0]["OrderId"].ToString();
        }
        public void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}