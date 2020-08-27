using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;

namespace hanoitourist_ver02.admin.locations
{
    public partial class edit : System.Web.UI.Page
    {
        Location dto = new Location();
        LocationBus bus = new LocationBus();
        CountryBus countryBus = new CountryBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        public void LoadData()
        {
            LoadCountry();
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            DataTable td = new DataTable();
            td = bus.GetRecord(id);

            title.Text = td.Rows[0]["Title"].ToString();
            countryId.SelectedValue = td.Rows[0]["CountryId"].ToString();
            description.Text = td.Rows[0]["Description"].ToString();
            isStart.SelectedValue = td.Rows[0]["IsStart"].ToString();
        }
        private void SaveFileUpload()
        {
            string filePath = "";
            if (thumbnail.FileName != "")
            {
                filePath = Server.MapPath("~/publics/uploads/locations/" + thumbnail.FileName);
                thumbnail.PostedFile.SaveAs(filePath);
                dto.Thumbnail = thumbnail.FileName;
            } else
            {
                dto.Thumbnail = "";
            }
        }
        public void LoadCountry()
        {
            countryId.DataSource = countryBus.Show();
            countryId.DataTextField = "Title";
            countryId.DataValueField = "Id";
            countryId.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            dto.CountryId = Int32.Parse(countryId.SelectedValue);
            dto.Title = title.Text;
            dto.Description = description.Text;
            dto.IsStart = Byte.Parse(isStart.SelectedValue);
            SaveFileUpload();
            bus.Update(dto.Id, dto.CountryId, dto.Title, dto.Thumbnail, dto.Description, dto.IsStart);
            Response.Redirect("~/admin/locations/index.aspx?status=update-success");
        }
    }
}