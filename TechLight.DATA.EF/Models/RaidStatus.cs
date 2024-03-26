using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class RaidStatus
    {
        public RaidStatus()
        {
            Products = new HashSet<Product>();
        }

        public int RaidStatusId { get; set; }
        public string RaidStatusDesc { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; }
    }
}
