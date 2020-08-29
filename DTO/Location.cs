using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Location
    {
        public int Id { get; set; }
        public int CountryId { get; set; }
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Description { get; set; }
        public byte IsStart { get; set; }
        public string CountryName { get; set; }

        public Location() { }
        public Location(int id, string title, byte isStart)
        {
            Id = id;
            Title = title;
            IsStart = isStart;
        }
    }
}
