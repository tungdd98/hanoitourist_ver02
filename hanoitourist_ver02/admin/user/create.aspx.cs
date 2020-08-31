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

namespace hanoitourist_ver02.admin.user
{
    public partial class create : System.Web.UI.Page
    {
        User dto = new User();
        UserBus bus = new UserBus();
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
            DataTable da =  bus.Search(email.Text, passwords.Text);

            if(passwords.Text == cfPasswords.Text && da == null)
            {
                dto.Password = passwords.Text;
                bus.Insert(dto.Name, dto.Password, dto.Nation, dto.Address, dto.Phone, dto.Email, dto.Content);
                Button1.Enabled = false;
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Thêm mới thành công!!"), true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "WarningMessage", Helper.ShowMessage("Thêm mới thất bại!!"), true);
            }


        }
    }
}