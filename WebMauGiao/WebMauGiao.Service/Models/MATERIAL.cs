namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MATERIAL")]
    public partial class MATERIAL
    {
        public long MaterialID { get; set; }

        [StringLength(100)]
        public string MaterialName { get; set; }

        public decimal? Price { get; set; }

        public int? Unit { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }
    }
}
