using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PriceTour
    {
        public int Id { get; set; }
        public float OriginalPrice { get; set; }
        public float Price { get; set; }
        public int CustomerTypeId { get; set; }
        public string TourId { get; set; }
    }
}
