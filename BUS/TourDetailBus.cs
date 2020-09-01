using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class TourDetailBus
    {
        Model model = new Model();
        public DataTable getTourDetail()
        {
            string sql = "";

            return model.GetTable(sql);
        }
    }
}
