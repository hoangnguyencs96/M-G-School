namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DEPARTMENT")]
    public partial class DEPARTMENT
    {
        public long DepartmentID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        public long? BossID { get; set; }

        [StringLength(100)]
        public string Fax { get; set; }

        [StringLength(20)]
        public string Phone { get; set; }
    }
}
