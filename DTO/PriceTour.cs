using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PriceTour
    {
        public float OriginalPrice { get; set; }
        public float Price { get; set; }
        public int CustomerTypeId { get; set; }
        public string TourId { get; set; }
        public string CustomerName { get; set; }
        public PriceTour() { }

        public PriceTour(float originalPrice, float price, string customerName, int customerTypeId)
        {
            OriginalPrice = originalPrice;
            Price = price;
            CustomerName = customerName;
            CustomerTypeId = customerTypeId;
        }
    }
}
