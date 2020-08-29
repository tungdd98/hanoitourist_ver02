using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DTO;

namespace hanoitourist_ver02.home
{
    public partial class index : System.Web.UI.Page
    {
        HomeBus bus = new HomeBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTourHotKhuyenMai();
                LoadLocationNation();
                LoadTourTheoDiemDenTrongNuoc();
                LoadLocationEnterNation();
                LoadTourTheoDiemDenNgoaiNuoc();
            }
        }
        public void LoadTourHotKhuyenMai() 
        {
            tourHotKhuyenMai.DataSource = bus.GetTours("sale");
            tourHotKhuyenMai.DataBind();
        }
        public void LoadLocationNation()
        {
            locationNation.DataSource = bus.GetLocations();
            locationNation.DataBind();
        }
        public void LoadTourTheoDiemDenTrongNuoc()
        {
            tourTheoDiemDenTrongNuoc.DataSource = bus.GetTours("nation", 12);
            tourTheoDiemDenTrongNuoc.DataBind();
        }
        public void LoadLocationEnterNation()
        {
            locationEnterNation.DataSource = bus.GetLocations(1);
            locationEnterNation.DataBind();
        }
        public void LoadTourTheoDiemDenNgoaiNuoc()
        {
            tourTheoDiemDenNgoaiNuoc.DataSource = bus.GetTours("enternation", 12);
            tourTheoDiemDenNgoaiNuoc.DataBind();
        }
    }
}