using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class Status
    {
        public Status()
        {
            Products = new HashSet<Product>();
        }

        public int StatusId { get; set; }
        public string StatusName { get; set; } = null!;
        public string? StatusDesc { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
