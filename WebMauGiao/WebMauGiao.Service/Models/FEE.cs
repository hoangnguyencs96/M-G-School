namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FEE")]
    public partial class FEE
    {
        public long FeeID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        public decimal? Price { get; set; }

        public decimal? PromotionPrice { get; set; }

        public int? Amount { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }
    }
}
