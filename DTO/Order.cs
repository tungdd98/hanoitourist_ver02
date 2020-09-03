using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Order
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int UserId { get; set; }
        public byte Status { get; set; }
        public float Total { get; set; }
        public byte TypePayment { get; set; }
        public byte MethodPayment { get; set; }
        public DateTime CreateAt { get; set; }
        public Order() { }
    }
}
