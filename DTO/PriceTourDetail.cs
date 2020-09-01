using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class PriceTourDetail
    {
        public string startDate { get; set; }
        public string startTime { get; set; }
        public List<PriceTour> prices { get; set; }
    }
}
