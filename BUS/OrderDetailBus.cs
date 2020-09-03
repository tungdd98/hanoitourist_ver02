using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL;

namespace BUS
{
    public class OrderDetailBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select * from OrderDetail";
            return model.GetTable(sql);
        }
        public void Insert(int orderId, string tourId, int customerTypeId, int departureDayId, int quantity)
        {
            string sql = "Insert into OrderDetail values(" + orderId + ", '" + tourId + "', " + customerTypeId + ", " + departureDayId + ", " + quantity + ")";

            model.Execute(sql);
        }
    }
}
