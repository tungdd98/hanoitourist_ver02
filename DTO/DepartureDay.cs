using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class DepartureDay
    {
        public int Id { get; set; }
        public string TourId { get; set; }
        public DateTime StartDay { get; set; }
        public TimeSpan StartTime { get; set; }
        public string TourTitle { get; set; }
    }
}
