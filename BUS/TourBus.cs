using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BUS
{
    public class TourBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select Tours.*, " +
                "DepartureName = (Select Title from Locations where Tours.DepartureLocationId = Locations.Id), " +
                "DestinationName = (Select Title from Locations where Tours.DestinationLocationId = Locations.Id), " +
                "TimeName = (Select Title from TimeTour where Tours.TimeId = TimeTour.Id), " +
                "VehicleName = (Select Title from VehicleTour where Tours.VehicleId = VehicleTour.Id) " +
                "from Tours " +
                "order by Id desc";
            return model.GetTable(sql);
        }
        public bool Insert(string id, string title, string thumbnail, string description, string content, int departureLocationId, int destinationLocationId, int timeId, int vehicleId, int place, string schedule)
        {
            string sql = "Insert into Tours values('" + id + "'," +
                "N'" + title + "'," +
                "'" + thumbnail + "'," +
                "N'" + description + "'," +
                "N'" + content + "'," +
                departureLocationId + "," +
                destinationLocationId + "," +
                + timeId + "," +
                vehicleId + "," +
                place + "," +
                "N'" + schedule + "')";
            string sqlCheck = "Select count(*) from Tours where Id = '" + id + "'";
            if (model.CheckExits(sqlCheck))
            {
                return false;
            }
            model.Execute(sql);
            return true;
        }
        public void Delete(string id)
        {
            string sql = "Delete from Tours where Id = '" + id + "'";
            model.Execute(sql);
        }
        public void Update(string id, string title, string thumbnail, string description, string content, int departureLocationId, int destinationLocationId, int timeId, int vehicleId, int place, string schedule)
        {
            string sql = "Update Tours set " +
                "Title = N'" + title + "'," +
                "Thumbnail = '" + thumbnail + "'," +
                "Description = N'" + description + "'," +
                "Content = N'" + content + "'," +
                "DepartureLocationId = " + departureLocationId + "," +
                "DestinationLocationId = " + destinationLocationId + "," +
                "TimeId = " + timeId + "," +
                "VehicleId = " + vehicleId + "," +
                "Place = " + place + "," +
                "Schedule = N'" + schedule + "' " +
                "where Id = '" + id + "'";
            model.Execute(sql);
        }
        public DataTable GetRecord(string id)
        {
            string sql = "Select * from Tours where Id = '" + id + "'";
            return model.GetTable(sql);
        }
        public void DecrementPlace(string id, int slot)
        {
            string sql = "Update Tours set Place = " + slot + " where Id = '" + id + "'";

            model.Execute(sql);
        }
    }
}
