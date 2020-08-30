﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class User
    {
        public int Id { get; set; }

        public string Password { get; set; }

        public string Name { get; set; }

        public string Nation { get; set; }

        public string Address { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public string Content { get; set; }

        public byte? Permission { get; set; }
    }
}
