using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using DTO;

namespace hanoitourist_ver02.home
{
    public partial class checkout : System.Web.UI.Page
    {
        Model bus = new Model();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["cart"] == null)
            {
            }
        }
        // Lấy danh sách giỏ hàng
        public void AddCart(string tourId)
        {
            
        }
    }
}