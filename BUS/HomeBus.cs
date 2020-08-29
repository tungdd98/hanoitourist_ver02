using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BUS
{
    public class HomeBus
    {
        Model model = new Model();
        // Lấy danh sách menu
        public List<Country> GetCountries(byte isNation)
        {
            string sql = "Select * from Countries where IsNation = " + isNation;
            List<Country> countries = new List<Country>();
            DataTable tb = new DataTable();
            tb = model.GetTable(sql);
            foreach (DataRow row in tb.Rows)
            {
                DataTable tbLocation = new DataTable();
                tbLocation = model.GetTable("Select * from Locations where CountryId = " + row["Id"].ToString());
                List<Location> locations = new List<Location>();
                foreach (DataRow rowLocation in tbLocation.Rows)
                {
                    locations.Add(new Location(
                            Int32.Parse(rowLocation["Id"].ToString()),
                            rowLocation["Title"].ToString(),
                            byte.Parse(rowLocation["IsStart"].ToString()))
                        );
                }
                countries.Add(new Country(
                        Int32.Parse(row["Id"].ToString()),
                        row["Title"].ToString(),
                        byte.Parse(row["IsNation"].ToString()),
                        locations
                    ));
            }
            return countries;
        }
        // Lấy danh sách tour
        public List<Tour> GetTours(string option = "", string perPage = "", string query = "", string sortOrder = "")
        {
            string sql = "Select " + perPage + " Tours.*, " +
                "DepartureName = (Select Title from Locations where Tours.DepartureLocationId = Locations.Id), " +
                "DestinationName = (Select Title from Locations where Tours.DestinationLocationId = Locations.Id), " +
                "TimeName = (Select Title from TimeTour where Tours.TimeId = TimeTour.Id), " +
                "VehicleName = (Select Title from VehicleTour where Tours.VehicleId = VehicleTour.Id), " +
                "IsNation = (Select IsNation from Countries inner join Locations on Countries.Id = Locations.CountryId where Locations.Id = Tours.DestinationLocationId) " +
                "from Tours " +
                query + " " +
                "order by Tours.Id desc";

            List<Tour> tours = new List<Tour>();
            DataTable tb = new DataTable();
            tb = model.GetTable(sql);

            foreach (DataRow row in tb.Rows)
            {
                // Lấy giá tour
                DataTable priceTour = new DataTable();
                priceTour = model.GetTable("Select MIN(Price) as Price, OriginalPrice from PriceTour where TourId = '" + row["Id"] + "' Group by OriginalPrice");

                float originalPrice = float.Parse(priceTour.Rows[0]["OriginalPrice"].ToString());
                float price = float.Parse(priceTour.Rows[0]["Price"].ToString());
                float sale = 0;

                if (originalPrice > price)
                {
                    sale = 100 - (price / originalPrice) * 100;
                }

                // Lấy ngày tháng đặt tour
                DataTable tbDepartureDay = new DataTable();
                tbDepartureDay = model.GetTable("Select StartDay from DepartureDay where TourId = '" + row["Id"] + "' order by StartDay desc");
                List<DepartureDay> departureDays = new List<DepartureDay>();
                foreach (DataRow rowDepartureDay in tbDepartureDay.Rows)
                {
                    departureDays.Add(new DepartureDay(
                            DateTime.Parse(rowDepartureDay["StartDay"].ToString())
                        ));
                }
                // Lấy khu vực
                byte isNation = byte.Parse(row["IsNation"].ToString());

                Tour tour = new Tour(
                        row["Id"].ToString(),
                        row["Title"].ToString(),
                        row["Thumbnail"].ToString(),
                        row["Description"].ToString(),
                        row["Content"].ToString(),
                        Int32.Parse(row["Place"].ToString()),
                        row["Schedule"].ToString(),
                        row["DepartureName"].ToString(),
                        row["DestinationName"].ToString(),
                        row["TimeName"].ToString(),
                        row["VehicleName"].ToString(),
                        float.Parse(priceTour.Rows[0]["OriginalPrice"].ToString()),
                        float.Parse(priceTour.Rows[0]["Price"].ToString()),
                        sale,
                        departureDays
                    );

                switch (option)
                {
                    case "sale":
                        if (sale > 0)
                        {
                            tours.Add(tour);
                        }
                        break;
                    case "date":
                        if (departureDays.Count > 0)
                        {
                            int compare = DateTime.Compare(departureDays.ElementAt(0).StartDay, DateTime.Today);
                            if (compare == 0)
                            {
                                tours.Add(tour);
                            }
                        }
                        break;
                    case "nation":
                        if(isNation == 0)
                        {
                            tours.Add(tour);
                        }
                        break;
                    case "enternation":
                        if (isNation == 1)
                        {
                            tours.Add(tour);
                        }
                        break;
                    default:
                        tours.Add(tour);
                        break;
                }
            }
            // Sort
            switch(sortOrder)
            {
                case "priceDesc":
                    for(int i = 0; i < tours.Count - 1; i++)
                    {
                        for(int j = i + 1; j < tours.Count; j++)
                        {
                            if(tours[i].Price < tours[j].Price)
                            {
                                Tour temp = tours[i];
                                tours[i] = tours[j];
                                tours[j] = temp;
                            }
                        }
                    }
                    break;
                case "priceAsc":
                    for (int i = 0; i < tours.Count - 1; i++)
                    {
                        for (int j = i + 1; j < tours.Count; j++)
                        {
                            if (tours[i].Price > tours[j].Price)
                            {
                                Tour temp = tours[i];
                                tours[i] = tours[j];
                                tours[j] = temp;
                            }
                        }
                    }
                    break;
            }
            return tours;
        }
        // Lấy danh sách location
        public DataTable GetLocations(byte isNation = 0)
        {
            string sql = "Select Locations.*, Countries.IsNation from Locations inner join Countries on Locations.CountryId = Countries.Id where Countries.IsNation = " + isNation;
            return model.GetTable(sql);
        }
        // Lấy thông tin location detail
        public DataTable GetLocationDetail(string id)
        {
            string sql = "Select * from Locations where Id = " + id;
            return model.GetTable(sql);
        }
        // Lấy thông tin location điểm đến/ điểm đi
        public DataTable GetLocationsIsStart(byte isStart = 0)
        {
            string sql = "Select * from Locations where IsStart = " + isStart;
            return model.GetTable(sql);
        }
        // Lấy thông tin thời gian 
        public DataTable GetTimeTour()
        {
            string sql = "Select * from TimeTour order by Id desc";
            return model.GetTable(sql);
        }
    }
}
