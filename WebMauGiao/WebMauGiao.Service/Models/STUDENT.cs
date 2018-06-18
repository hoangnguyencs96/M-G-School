namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("STUDENT")]
    public partial class STUDENT
    {
        public long StudentID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(200)]
        public string Image { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateOfBirth { get; set; }

        public bool? Sex { get; set; }

        [StringLength(200)]
        public string Address { get; set; }

        [StringLength(100)]
        public string Parent { get; set; }

        [StringLength(20)]
        public string ParentPhone { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }

        public bool? Status { get; set; }

        public long? ClassID { get; set; }

        public decimal? Height { get; set; }

        public decimal? Weight { get; set; }

        public decimal? BMI { get; set; }

        [StringLength(50)]
        public string Folk { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        public long? PriorityID { get; set; }

        [StringLength(100)]
        public string Religious { get; set; }
    }
}
