namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FOOD")]
    public partial class FOOD
    {
        public long FoodID { get; set; }

        [StringLength(100)]
        public string FoodName { get; set; }

        public long? FoodTypeID { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }
    }
}
