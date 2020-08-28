using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BUS
{
    public class DepartureDayBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select DepartureDay.*, Tours.Title as TourTitle from DepartureDay inner join Tours on Tours.Id = DepartureDay.TourId order by Id desc";
            return model.GetTable(sql);
        }
        public void Insert(string tourId, DateTime startDay, TimeSpan startTime)
        {
            string sql = "Insert into DepartureDay values(N'" + tourId + "','" + startDay + "','" + startTime + "')";
            model.Execute(sql);
        }
        public void Delete(int id)
        {
            string sql = "Delete from DepartureDay where Id = " + id;
            model.Execute(sql);
        }
        public void Update(int id, string tourId, DateTime startDay, TimeSpan startTime)
        {
            string sql = "Update DepartureDay set TourId = '" + tourId + "', StartDay = '" + startDay + "', StartTime = '" + startTime + "' where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from DepartureDay where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
