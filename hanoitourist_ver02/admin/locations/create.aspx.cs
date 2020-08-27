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
    public partial class create : System.Web.UI.Page
    {
        Location dto = new Location();
        LocationBus bus = new LocationBus();
        CountryBus countryBus = new CountryBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadCountry();
            }
        }
        public void LoadCountry()
        {
            countryId.DataSource = countryBus.Show();
            countryId.DataTextField = "Title";
            countryId.DataValueField = "Id";
            countryId.DataBind();
        }
        private void SaveFileUpload()
        {
            string filePath = "";
            if(thumbnail.FileName != "")
            {
                filePath = Server.MapPath("~/publics/uploads/locations/" + thumbnail.FileName);
                thumbnail.PostedFile.SaveAs(filePath);
                dto.Thumbnail = thumbnail.FileName;
            } else
            {
                dto.Thumbnail = "";
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveFileUpload();
            dto.CountryId = Int32.Parse(countryId.SelectedValue);
            dto.Title = title.Text;
            dto.Description = description.Text;
            dto.IsStart = Byte.Parse(isStart.SelectedValue);
            bus.Insert(dto.CountryId, dto.Title, dto.Thumbnail, dto.Description, dto.IsStart);
            Response.Redirect("~/admin/locations/index.aspx?status=add-success");
        }
    }
}