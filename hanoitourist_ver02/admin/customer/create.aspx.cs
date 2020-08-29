using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BUS;
using System.Data;

namespace hanoitourist_ver02.admin.customer
{
    public partial class create : System.Web.UI.Page
    {
        Customer dto = new Customer();
        CustomerBus bus = new CustomerBus();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dto.Name = name.Text;
            dto.Nation = nation.Text;
            dto.Address = address.Text;
            dto.Phone = phone.Text;
            dto.Email = email.Text;
            dto.Content = content.Text;
            bus.Insert(dto.Name, dto.Nation, dto.Address, dto.Phone, dto.Email, dto.Content);
            Response.Redirect("~/admin/customer/index.aspx?status=add-success");
        }
    }
}