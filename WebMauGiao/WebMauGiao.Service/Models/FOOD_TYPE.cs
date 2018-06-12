namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FOOD_TYPE
    {
        [Key]
        public long FoodTypeID { get; set; }

        [StringLength(100)]
        public string FoodTypeName { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }
    }
}
