using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BUS;
using DTO;
using DAL;

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
            LoadDropDiemDen();
            // Thời gian
            dropTime.DataSource = bus.GetTimeTour();
            dropTime.DataValueField = "Id";
            dropTime.DataTextField = "Title";
            dropTime.DataBind();
        }
        public void LoadDropDiemDen(byte isNation = 0)
        {
            dropDiemDen.Items.Clear();
            dropDiemDen.Items.Add(new ListItem("Bạn muốn đi đâu?", ""));
            dropDiemDen.DataSource = bus.GetLocationsIsStart(0, isNation);
            dropDiemDen.DataValueField = "Id";
            dropDiemDen.DataTextField = "Title";
            dropDiemDen.DataBind();
        }
        protected void Button_Search(object sender, EventArgs e)
        {
            if(textSearch.Text == "")
            {
                Response.Write("<script>alert('Vui lòng nhập thông tin cần tìm kiếm.')</script>");
            } else
            {
                Response.Redirect("~/home/search.aspx?search=" + textSearch.Text);
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string departureId = dropDiemXuatPhat.SelectedValue;
            string destinationId = dropDiemDen.SelectedValue;
            string time = dropTime.SelectedValue;
            string date = startDay.Text;
            string price = dropPrice.SelectedValue;
            string nation = "";

            if(radioTourNation.Checked)
            {
                nation = "nation";
            } else if(radioTourEnterNation.Checked)
            {
                nation = "enternation";
            }

            if (departureId == "" || destinationId == "")
            {
                Response.Write("<script>alert('Vui lòng điền đủ thông tin điểm khởi hành và điểm đến.')</script>");
            }
            else
            {
                Response.Redirect("~/home/search.aspx?departureId=" + departureId + "&destinationId=" + destinationId + "&time=" + time + "&date=" + date + "&price=" + price + "&nation=" + nation + "&search=");
            }
        }

        protected void radioTourNation_CheckedChanged(object sender, EventArgs e)
        {
            LoadDropDiemDen(0);
        }

        protected void radioTourEnterNation_CheckedChanged(object sender, EventArgs e)
        {
            LoadDropDiemDen(1);
        }
    }
}