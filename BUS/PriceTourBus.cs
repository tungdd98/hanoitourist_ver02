using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;
using DTO;

namespace BUS
{
    public class PriceTourBus
    {
        Model model = new Model();
        public DataTable Show()
        {
            string sql = "Select PriceTour.*, Tours.Title as TourTitle, CustomerType.Title as CustomerTypeName from PriceTour inner join Tours on Tours.Id = PriceTour.TourId inner join CustomerType on PriceTour.CustomerTypeId = CustomerType.Id";
            return model.GetTable(sql);
        }
        public bool Insert(float originalPrice, float price, int customerTypeId, string tourId)
        {
            string sql = "Insert into PriceTour values(" + originalPrice + ", " + price + ", " + customerTypeId + ", '" + tourId + "')";
            string sqlCheck = "Select count(*) from PriceTour where CustomerTypeId = " + customerTypeId + " and TourId = '" + tourId + "'";
            if (model.CheckExits(sqlCheck))
            {
                return false;
            }
            model.Execute(sql);
            return true;
        }
        public void Delete(int customerTypeId, string tourId)
        {
            string sql = "Delete from PriceTour where CustomerTypeId = " + customerTypeId + ", TourId = '" + tourId + "'";
            model.Execute(sql);
        }
        public void Update(float originalPrice, float price, int customerTypeId, string tourId)
        {
            string sql = "Update PriceTour set OriginalPrice = " + originalPrice + ", Price = " + price + " where CustomerTypeId = " + customerTypeId + " and TourId = '" + tourId + "'";
            model.Execute(sql);
        }
        public DataTable GetRecord(int customerTypeId, string tourId)
        {
            string sql = "Select * from PriceTour where CustomerTypeId = " + customerTypeId + " and TourId = '" + tourId + "'";
            return model.GetTable(sql);
        }
    }
}
