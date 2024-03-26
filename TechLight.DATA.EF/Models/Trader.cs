using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class Trader
    {
        public Trader()
        {
            Products = new HashSet<Product>();
        }

        public int TraderId { get; set; }
        public string TraderName { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string City { get; set; } = null!;
        public string? State { get; set; }
        public string? Zip { get; set; }
        public string? Phone { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
