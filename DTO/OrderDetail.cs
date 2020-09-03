using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class OrderDetail
    {
        public int OrderId { get; set; }
        public string TourId { get; set; }
        public int CustomerTypeId { get; set; }
        public int DepartureDayId { get; set; }
        public int Quantity { get; set; }
        public OrderDetail() { }
        public OrderDetail(int orderId, string tourId, int customerTypeId, int departureDayId, int quantity)
        {
            OrderId = orderId;
            TourId = tourId;
            CustomerTypeId = customerTypeId;
            DepartureDayId = departureDayId;
            Quantity = quantity;
        }
    }
}
