using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Country
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public byte IsNation { get; set; }
        public List<Location> Location { get; set; }
        public Country() { }

        public Country(int id, string title, byte isNation, List<Location> location)
        {
            Id = id;
            Title = title;
            IsNation = isNation;
            Location = location;
        }
    }
}
