using System;
using System.Collections.Generic;

namespace TechLight.DATA.EF.Models
{
    public partial class Order
    {
        public Order()
        {
            ProductOrders = new HashSet<ProductOrder>();
        }

        public int OrderId { get; set; }
        public string CustomerId { get; set; } = null!;
        public DateTime OrderDate { get; set; }
        public string Username { get; set; } = null!;

        public virtual Customer Customer { get; set; } = null!;
        public virtual ICollection<ProductOrder> ProductOrders { get; set; }
    }
}
