using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class CartPrice
    {
        public float Price { get; set; }
        public int CustomerTypeId { get; set; }
        public string CustomerName { get; set; }
        public int Quantity { get; set; }
        public CartPrice() { }
        public CartPrice(float price, int customerTypeId, string customerName, int quantity)
        {
            Price = price;
            CustomerTypeId = customerTypeId;
            CustomerName = customerName;
            Quantity = quantity;
        }
    }
    public class CartDepartureDay
    {
        public int DepartureDayId { get; set; }
        public DateTime StartDay { get; set; }
        public TimeSpan StartTime { get; set; }
        public float Total { get; set; }
        public List<CartPrice> CartPrices { get; set; }
        public CartDepartureDay() { }
        public CartDepartureDay(int departureDayId, DateTime startDay, TimeSpan startTime, List<CartPrice> cartPrices, float total)
        {
            DepartureDayId = departureDayId;
            StartDay = startDay;
            StartTime = startTime;
            CartPrices = cartPrices;
            Total = total;
        }
    }
    public class Cart
    {
        public string TourId { get; set; }
        public string Title { get; set; }
        public string DepartureName { get; set; }
        public string TimeName { get; set; }
        public string VehicleName { get; set; }
        public int Place { get; set; }
        public string Thumbnail { get; set; }
        public List<CartDepartureDay> CartDepartureDays { get; set; }
        public Cart() { }

        public Cart(string tourId, string title, string departureName, string timeName, string vehicleName, int place, string thumbnail, List<CartDepartureDay> cartDepartureDays)
        {
            TourId = tourId;
            Title = title;
            DepartureName = departureName;
            TimeName = timeName;
            VehicleName = vehicleName;
            Place = place;
            Thumbnail = thumbnail;
            CartDepartureDays = cartDepartureDays;
        }

        public override string ToString()
        {
            return Title + ": CartDepartureDays" + CartDepartureDays.Count + " ; " ;
        }
    }
}
