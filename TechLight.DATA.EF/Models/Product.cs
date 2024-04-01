using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class Product
    {
        public Product()
        {
            ProductOrders = new HashSet<ProductOrder>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public decimal Price { get; set; }
        public string? ProductDesc { get; set; }
        public int UnitsInStock { get; set; }
        public int StatusId { get; set; }
        public int CategoryId { get; set; }
        public int? TraderId { get; set; }
        public int? RaidStatusId { get; set; }
        public string? ProductImage { get; set; }

        public virtual Category? Category { get; set; }
        public virtual RaidStatus? RaidStatus { get; set; }
        public virtual Status? Status { get; set; }
        public virtual Trader? Trader { get; set; }
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
    }
}
