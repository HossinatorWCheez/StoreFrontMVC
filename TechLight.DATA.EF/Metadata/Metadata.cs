using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace TechLight.DATA.EF.Models
{
    public class CategoryMetadata
    {
        public int CategoryId { get; set; }

        [Required]
        [StringLength(50, ErrorMessage = "Name cannot exceed 50 characters")]
        [Display(Name = "Cateogry Name")]
        [DataType(DataType.Text)]
        public string CategoryName { get; set; } = null!;

        [StringLength(500, ErrorMessage = "Name cannot exceed 500 characters")]
        [Display(Name = "Description")]
        [UIHint("MultilineText")]
        [DataType(DataType.MultilineText)]
        public string? CategoryDesc { get; set; }
    }

    public class TraderMetadata
    {
        public int TraderId { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Name cannot exceed 100 characters")]
        [Display(Name = "Trader Name")]
        [DataType(DataType.Text)]
        public string TraderName { get; set; } = null!;

        [Required]
        [StringLength(150, ErrorMessage = "Address cannot exceed 150 characters")]
        public string Address { get; set; } = null!;

        [Required]
        [StringLength(100, ErrorMessage = "City cannot exceed 100 characters")]
        [DataType(DataType.Text)]
        public string City { get; set; } = null!;

        [StringLength(2, ErrorMessage = "State cannot exceed 2 characters")]
        [DataType(DataType.Text)]
        public string? State { get; set; }

        [StringLength(5, ErrorMessage = "Zip cannot exceed 5 characters")]
        [DataType(DataType.PostalCode)]
        public string? Zip { get; set; }

        [StringLength(24, ErrorMessage = "Phone cannot exceed 24 characters")]
        [DataType(DataType.PhoneNumber)]
        public string? Phone { get; set; }
    }

    public class OrderMetadata
    {
        public int OrderId { get; set; }
        public string CustomerId { get; set; } = null!;

        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        [Display(Name = "Order Date")]
        public DateTime OrderDate { get; set; }

        [Required]
        [StringLength(100)]
        public string Username { get; set; } = null!;
    }

    public class CustomerMetadata
    {
        public string CustomerId { get; set; } = null!;

        [Required]
        [StringLength (50)]
        public string Username { get; set; } = null!;

        [Display(Name = "Level")]
        [Range(0, int.MaxValue)]
        public int? AccountLvl { get; set; }

        [StringLength (50)]
        [DataType(DataType.Text)]
        public string? AccountRegion { get; set; }

        [Display(Name = "Reputation")]
        [Range(0, (double)decimal.MaxValue)]
        public decimal? AccountRep { get; set; }
    }

    public class ProductMetadata
    {
        public int ProductId { get; set; }

        [Required]
        [StringLength(100)]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; } = null!;

        [Required]
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:c}")]
        [Range(0, (double)decimal.MaxValue)]
        public decimal Price { get; set; }

        [StringLength(500)]
        [Display(Name = "Description")]
        public string? ProductDesc { get; set; }

        [Required]
        [Display(Name = "In stock")]
        [Range (0, int.MaxValue)]
        public int UnitsInStock { get; set; }

        public int StatusId { get; set; }
        public int CategoryId { get; set; }
        public int? TraderId { get; set; }
        public int? RaidStatusId { get; set; }

        [StringLength(100)]
        [Display(Name = "Image")]
        public string? ProductImage { get; set; }
    }

    public class ProductOrderMetadata
    {
        public int ProductOrderId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }

        [Range(0, short.MaxValue)]
        public short? Quantity { get; set; }

        [Range (0, (double)decimal.MaxValue)]
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:c}")]
        public decimal? Price { get; set; }
    }

    public class RaidStatusesMetadata
    {
        public int RaidStatusId { get; set; }

        [StringLength (100)]
        [Display(Name = "Description")]
        [DataType(DataType.Text)]
        public string RaidStatusDesc { get; set; } = null!;
    }

    public class StatusesMetadata
    {
        public int StatusId { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Status Name")]
        public string StatusName { get; set; } = null!;

        [StringLength(250)]
        [Display(Name ="Description")]
        [UIHint("MultilineText")]
        [DataType(DataType.MultilineText)]
        public string? StatusDesc { get; set; }
    }
}
