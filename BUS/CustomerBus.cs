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
            string sql = "Select * from Customers ";
            return model.GetTable(sql);
        }
        public void Insert(string name, string nation, string address, string phone, string email, string content)
        {
            string sql = "Insert into Customers values(N'" + name + "',N'" + nation + "',N'" + address + "',N'" + phone + "',N'" + email + "',N'" + content + "')";
            model.Execute(sql);
        }
        public void Delete(int id)
        {
            string sql = "Delete from Customers where Id = " + id;
            model.Execute(sql);
        }
        public void Update(int id, string name, string nation, string address, string phone, string email, string content)
        {
            string sql = "Update Customers set Name = N'" + name + "', Nation = '" + nation + "', Address = '" + address + "', Phone = '" + phone + "', Email = N'" + email  + "', Content = N'" + content + "'" + " where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from Customers where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
