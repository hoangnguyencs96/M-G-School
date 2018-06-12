namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ABSENCE")]
    public partial class ABSENCE
    {
        public long AbsenceID { get; set; }

        public long? StudentID { get; set; }

        [StringLength(100)]
        public string Reasons { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }
    }
}
