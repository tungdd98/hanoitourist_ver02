using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BUS
{
    public class PriceTourBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select PriceTour.*, Tours.Title as TourTitle, CustomerType.Title as CustomerTypeName from PriceTour inner join Tours on Tours.Id = PriceTour.TourId inner join CustomerType on PriceTour.CustomerTypeId = CustomerType.Id order by PriceTour.Id desc";
            return model.GetTable(sql);
        }
        public void Insert(float originalPrice, float price, int customerTypeId, string tourId)
        {
            string sql = "Insert into PriceTour values(" + originalPrice + ", " + price + ", " + customerTypeId + ", '" + tourId + "')";
            model.Execute(sql);
        }
        public void Delete(int id)
        {
            string sql = "Delete from PriceTour where Id = " + id;
            model.Execute(sql);
        }
        public void Update(int id, float originalPrice, float price, int customerTypeId, string tourId)
        {
            string sql = "Update PriceTour set OriginalPrice = " + originalPrice + ", Price = " + price + ", CustomerTypeId = " + customerTypeId + ", TourId = '" + tourId + "' where Id = " + id;
            model.Execute(sql);
        }
        public DataTable GetRecord(int id)
        {
            string sql = "Select * from PriceTour where Id = " + id;
            return model.GetTable(sql);
        }
    }
}
