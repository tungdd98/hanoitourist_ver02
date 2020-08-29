using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;
using System.CodeDom.Compiler;

namespace hanoitourist_ver02.admin.customer
{
    public partial class edit : System.Web.UI.Page
    {
        Customer dto = new Customer();
        CustomerBus bus = new CustomerBus();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public void LoadData()
        {
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            DataTable td = new DataTable();
            td = bus.GetRecord(id);
            name.Text = td.Rows[0]["Name"].ToString();
            nation.Text = td.Rows[0]["Nation"].ToString();
            address.Text = td.Rows[0]["Address"].ToString();
            phone.Text = td.Rows[0]["Phone"].ToString();
            email.Text = td.Rows[0]["Email"].ToString();
            content.Text = td.Rows[0]["Content"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            dto.Id = Int32.Parse(Request.QueryString["id"].ToString());
            bus.Update(dto.Id, name.Text, nation.Text, address.Text, phone.Text, email.Text, content.Text);
            Response.Redirect("~/admin/customer/index.aspx?status=update-success");
        }
    }
}