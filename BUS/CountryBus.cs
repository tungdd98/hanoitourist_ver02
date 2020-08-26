using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BUS
{
    public class CountryBus
    {
        Model model = new Model();

        public DataTable Show()
        {
            string sql = "Select * from Countries order by Id desc";
            return model.GetTable(sql);
        }
        public void Insert(string title, byte isNation)
        {
            string sql = "Insert into Countries values(N'" + title + "'," + isNation + ")";
            model.Execute(sql);
        }

        public void Delete(int id)
        {
            string sql = "Delete from Countries where Id = " + id;
            model.Execute(sql);
        }

        public void Update(int id, string title, byte isNation)
        {
            string sql = "Update Countries set Title = N'" + title + "', IsNation = " + isNation + " where Id = " + id;
            model.Execute(sql);
        }

        public DataTable GetRecord(int id)
        {
            string sql = "Select * from Countries where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
