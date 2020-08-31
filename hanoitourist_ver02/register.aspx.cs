using BUS;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hanoitourist_ver02
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        UserBus bus = new UserBus();
        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Enabled = false;
            if (password.Text == cfPassword.Text)
            {
                if (bus.Insert(password.Text, fullName.Text, "", "", phoneNumber.Text, email.Text, ""))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Đăng kí thành công!!", "success", "login.aspx"), true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Tài khoản đã tồn tại!!", "error", "register.aspx"), true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", Helper.ShowMessage("Mật khẩu và xác nhận mật khẩu phải trùng nhau !!", "error", "register.aspx"), true);
            }
        }
    }
}