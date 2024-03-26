using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class Category
    {
        public Category()
        {
            Products = new HashSet<Product>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
        public string? CategoryDesc { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
