using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Orders = new HashSet<Order>();
        }

        public string CustomerId { get; set; } = null!;
        public string Username { get; set; } = null!;
        public int? AccountLvl { get; set; }
        public string? AccountRegion { get; set; }
        public decimal? AccountRep { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
