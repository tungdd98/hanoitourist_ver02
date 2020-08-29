﻿using System;
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
                LoadInfoSearch();
            }
        }
        // Load tour khuyến mãi
        public void LoadTourHotKhuyenMai() 
        {
            tourHotKhuyenMai.DataSource = bus.GetTours("sale", "top 6");
            tourHotKhuyenMai.DataBind();
        }
        // Load khu vực trong nước
        public void LoadLocationNation()
        {
            locationNation.DataSource = bus.GetLocations();
            locationNation.DataBind();
        }
        // Load tour trong nước
        public void LoadTourTheoDiemDenTrongNuoc()
        {
            tourTheoDiemDenTrongNuoc.DataSource = bus.GetTours("nation", "top 12");
            tourTheoDiemDenTrongNuoc.DataBind();
        }
        // Load khu vực ngoài nước
        public void LoadLocationEnterNation()
        {
            locationEnterNation.DataSource = bus.GetLocations(1);
            locationEnterNation.DataBind();
        }
        // Load tour ngoài nước
        public void LoadTourTheoDiemDenNgoaiNuoc()
        {
            tourTheoDiemDenNgoaiNuoc.DataSource = bus.GetTours("enternation", "top 12");
            tourTheoDiemDenNgoaiNuoc.DataBind();
        }
        // Load thông tin search
        public void LoadInfoSearch()
        {
            // Điểm xuất phát
            dropDiemXuatPhat.DataSource = bus.GetLocationsIsStart(1);
            dropDiemXuatPhat.DataValueField = "Id";
            dropDiemXuatPhat.DataTextField = "Title";
            dropDiemXuatPhat.DataBind();
            // Điểm đến
            dropDiemDen.DataSource = bus.GetLocationsIsStart(0);
            dropDiemDen.DataValueField = "Id";
            dropDiemDen.DataTextField = "Title";
            dropDiemDen.DataBind();
            // Thời gian
            dropTime.DataSource = bus.GetTimeTour();
            dropTime.DataValueField = "Id";
            dropTime.DataTextField = "Title";
            dropTime.DataBind();
        }
    }
}