using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using DAL;

namespace BUS
{
    public class OrderBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select * from Orders";
            return model.GetTable(sql);
        }
        public int Insert(string addOn, int addOnId, float total, byte typePayment, byte methodPayment)
        {
            string sql = "Insert into Orders(" + addOn + ", Total, TypePayment, MethodPayment) values (" + addOnId + ", " + total + ", " + typePayment + ", " + methodPayment + "); Select SCOPE_IDENTITY();";

            return model.Insert(sql);
        } 
        public void Update(int id, byte status)
        {
            string sql = "Update Orders set Status = " + status + " where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from Orders where Id = " + id;
            return model.GetTable(sql);
        }
        // Lấy số tour được đặt nhiều nhất
        public void GetTourBestOrder()
        {
            string sql = "";
        }
    }
}
