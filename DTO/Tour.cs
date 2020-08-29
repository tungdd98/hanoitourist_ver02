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
        // Thuộc tính suy diễn
        public List<PriceTour> PriceTour { get; set; }
        public List<DepartureDay> DepartureDay { get; set; }
        public float Price { get; set; }
        public float OriginalPrice { get; set; }
        public float Sale { get; set; }
        public Tour() { }

        public Tour(string id, string title, string thumbnail, string description, string content, int place, string schedule, string departureName, string destinationName, string timeName, string vehicleName, float originalPrice, float price, float sale, List<DepartureDay> departureDay)
        {
            Id = id;
            Title = title;
            Thumbnail = thumbnail;
            Description = description;
            Content = content;
            Place = place;
            Schedule = schedule;
            DepartureName = departureName;
            DestinationName = destinationName;
            TimeName = timeName;
            VehicleName = vehicleName;
            OriginalPrice = originalPrice;
            Price = price;
            Sale = sale;
            DepartureDay = departureDay;
        }
    }
}
