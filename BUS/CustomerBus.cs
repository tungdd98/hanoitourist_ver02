using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class CustomerBus
    {
        Model model = new Model();

        public DataTable Show()
        {
            string sql = "Select * from Customers";
            return model.GetTable(sql);
        }
        public void Insert( string name, string Nation, string Address, string Phone, string Email, string Content)
        {
            string sql = "Insert into Customers values(N'" + name + "',N'" + Nation + "','" + Address + "',N'" + Phone + "','" + Email + "','"+ Content+"'"+ ")";
            model.Execute(sql);
        }

        public void Delete(int id)
        {
            string sql = "Delete from Customers where Id = " + id;
            model.Execute(sql);
        }

        public void Update(int id, string name, string Nation, string Address, string Phone, string Email, string Content)
        {
            string sql = "Update Customers set Name = N'" + name + "', Nation = '" + Nation +"'," + "Address = '" + Address + "'," + " Phone = '" + Phone + "'," + " Email = '" + Email + "'," + " Content = '" + Content  + "' where Id = " + id;
            model.Execute(sql);
        }

        public DataTable GetRecord(int id)
        {
            string sql = "Select * from Customers where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
