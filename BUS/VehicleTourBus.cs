using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BUS
{
    public class VehicleTourBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select * from VehicleTour order by Id desc";
            return model.GetTable(sql);
        }
        public void Insert(string title)
        {
            string sql = "Insert into VehicleTour values(N'" + title + "')";
            model.Execute(sql);
        }
        public void Delete(int id)
        {
            string sql = "Delete from VehicleTour where Id = " + id;
            model.Execute(sql);
        }
        public void Update(int id, string title)
        {
            string sql = "Update VehicleTour set Title = N'" + title + "' where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from VehicleTour where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
