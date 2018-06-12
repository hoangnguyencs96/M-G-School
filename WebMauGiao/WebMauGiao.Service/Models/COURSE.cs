namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("COURSE")]
    public partial class COURSE
    {
        [Key]
        public long CoursesID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartTime { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndTime { get; set; }

        public bool? Status { get; set; }

        [StringLength(20)]
        public string Schedule { get; set; }
    }
}
