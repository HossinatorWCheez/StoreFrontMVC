using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechLight.DATA.EF.Models;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace TechLight.DATA.EF.Models
{
    [ModelMetadataType(typeof(CategoryMetadata))]
    public partial class Category { }

    [ModelMetadataType(typeof(TraderMetadata))]
    public partial class Trader { }

    [ModelMetadataType(typeof(OrderMetadata))]
    public partial class Order { }

    [ModelMetadataType(typeof(CustomerMetadata))]
    public partial class Customer { }

    [ModelMetadataType(typeof(ProductMetadata))]
    public partial class Product { }

    [ModelMetadataType(typeof(ProductOrderMetadata))]
    public partial class ProductOrder { }

    [ModelMetadataType(typeof(RaidStatusesMetadata))]
    public partial class RaidStatus { }

    [ModelMetadataType(typeof(StatusesMetadata))]
    public partial class Status { }
}
