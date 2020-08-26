using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;

namespace hanoitourist_ver02.admin.time
{
    public partial class edit : System.Web.UI.Page
    {
        TimeTour dto = new TimeTour();
        TimeTourBus bus = new TimeTourBus();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadData();
            }
        }

        public void LoadData()
        {
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            DataTable td = new DataTable();
            td = bus.GetRecord(id);
            title.Text = td.Rows[0]["Title"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            dto.Title = title.Text;
            bus.Update(dto.Id, dto.Title);
            Response.Redirect("~/admin/time/index.aspx");
        }
    }
}