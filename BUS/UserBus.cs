using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class UserBus
    {
        Model model = new Model();

        public DataTable Show()
        {
            string sql = "Select * from Users";
            return model.GetTable(sql);
        }
        public void Insert(string password, string name, string Nation, string Address, string Phone, string Email, string Content)
        {
            string sql = "Insert into Users values(N'" + password + "',N'" + name + "',N'" + Nation + "','" + Address + "',N'" + Phone + "','" + Email + "','" + Content + "',"+ 0 + ")";
            model.Execute(sql);
        }

        public void Delete(int id)
        {
            string sql = "Delete from Users where Id = " + id;
            model.Execute(sql);
        }

        public void Update(int id, string name, string Nation, string Address, string Phone, string Email, string Content)
        {
            string sql = "Update Users set Name = N'" + name + "', Nation = '" + Nation + "'," + "Address = '" + Address + "'," + " Phone = '" + Phone + "'," + " Email = '" + Email + "'," + " Content = '" + Content + "' where Id = " + id;
            model.Execute(sql);
        }
        public DataTable Search(string email, string password)
        {
            string sql = "select * from Users where Email = '" + email + "' and Password = '" + password + "'";
            return model.GetTable(sql);
        }
        public bool checkRule(string email)
        {
            string sql = "select * from Users where Email= '" + email + "' and Permission = 1";
            return model.CheckExits(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from Users where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
