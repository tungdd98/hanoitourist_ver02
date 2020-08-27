using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Tour
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public int DepartureLocationId { get; set; }
        public int DestinationLocationId { get; set; }
        public int TimeId { get; set; }
        public int VehicleId { get; set; }
        public int Place { get; set; }
        public string Schedule { get; set; }
        public string DepartureName { get; set; }
        public string DestinationName { get; set; }
        public string TimeName { get; set; }
        public string VehicleName { get; set; }
    }
}
