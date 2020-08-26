using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BUS
{
    public class CustomerTypeBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select * from CustomerType order by Id desc";
            return model.GetTable(sql);
        }
        public void Insert(string title)
        {
            string sql = "Insert into CustomerType values(N'" + title + "')";
            model.Execute(sql);
        }
        public void Delete(int id)
        {
            string sql = "Delete from CustomerType where Id = " + id;
            model.Execute(sql);
        }
        public void Update(int id, string title)
        {
            string sql = "Update CustomerType set Title = N'" + title + "' where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from CustomerType where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
