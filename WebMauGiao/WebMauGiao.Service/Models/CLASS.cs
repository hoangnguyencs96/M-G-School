namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CLASS")]
    public partial class CLASS
    {
        public long ClassID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public int? Grade { get; set; }

        public long? EmployeeID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartTime { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndTime { get; set; }
    }
}
