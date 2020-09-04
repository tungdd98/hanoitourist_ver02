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
        public List<PriceTour> PriceTour { get; set; }

        public DepartureDay() { }

        public DepartureDay(int id, DateTime startDay, TimeSpan startTime, List<PriceTour> list, string tourId)
        {
            Id = id;
            StartDay = startDay;
            StartTime = startTime;
            PriceTour = list;
            TourId = tourId;
        }

    }
}
