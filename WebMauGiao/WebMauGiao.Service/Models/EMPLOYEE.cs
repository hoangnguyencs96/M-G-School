namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EMPLOYEE")]
    public partial class EMPLOYEE
    {
        public long EmployeeID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        public bool? Sex { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateOfBirth { get; set; }

        [StringLength(200)]
        public string Image { get; set; }

        [Required]
        [StringLength(20)]
        public string Phone { get; set; }

        [StringLength(20)]
        public string IdentityID { get; set; }

        [StringLength(200)]
        public string Address { get; set; }

        [StringLength(100)]
        public string Religion { get; set; }

        [StringLength(200)]
        public string Hometown { get; set; }

        [StringLength(100)]
        public string Degree { get; set; }

        [StringLength(100)]
        public string Major { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartTime { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndTime { get; set; }

        public bool? Status { get; set; }

        [StringLength(100)]
        public string Nationality { get; set; }

        public long? DepartmentID { get; set; }

        [StringLength(100)]
        public string Role { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }

        public decimal? DealSalary { get; set; }
    }
}
