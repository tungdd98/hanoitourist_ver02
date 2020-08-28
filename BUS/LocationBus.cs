using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BUS
{
    public class LocationBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select Locations.*, Countries.Title as CTitle from Locations inner join Countries on Locations.CountryId = Countries.Id order by Locations.Id desc";
            return model.GetTable(sql);
        }
        public void Insert(int countryId, string title, string thumbnail, string description, byte isStart)
        {
            string sql = "Insert into Locations values(" + countryId + ",N'" + title + "','" + thumbnail + "',N'" + description + "'," + isStart + ")";
            model.Execute(sql);
        }
        public void Delete(int id)
        {
            string sql = "Delete from Locations where Id = " + id;
            model.Execute(sql);
        }
        public void Update(int id, int countryId, string title, string thumbnail, string description, byte isStart)
        {
            string sql = "Update Locations set Title = N'" + title + "', IsStart = " + isStart + ", CountryId = " + countryId + ", Thumbnail = '" + thumbnail + "', Description = N'" + description + "'" + " where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from Locations where Id = " + id;
            return model.GetTable(sql);
        }
        public DataTable GetLocationByWhere(int isStart = 0)
        {
            string sql = "Select * from Locations where IsStart = " + isStart;
            return model.GetTable(sql);
        }
    }
}
