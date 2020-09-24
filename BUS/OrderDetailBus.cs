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
        public DataTable GetRecord(int id)
        {
            string sql = "Select OrderDetail.*, CustomerTypeName = (Select Title from CustomerType where OrderDetail.CustomerTypeId = CustomerType.Id), StartDay = (Select StartDay from DepartureDay where OrderDetail.DepartureDayId = DepartureDay.Id) from OrderDetail where OrderDetail.OrderId = " + id;
            return model.GetTable(sql);
        }
        public DataTable getBestSellerTour()
        {
            string sql = "select top 1 Title, SUM(Quantity) as tong from OrderDetail inner join Tours on OrderDetail.TourId = Tours.Id group by Title order by tong desc";
            return model.GetTable(sql);
        }
    }
}
