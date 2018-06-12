namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PERMISSON")]
    public partial class PERMISSON
    {
        [Key]
        public long PermissionID { get; set; }

        [StringLength(50)]
        public string PermissionName { get; set; }

        [Column(TypeName = "ntext")]
        public string Describe { get; set; }
    }
}
