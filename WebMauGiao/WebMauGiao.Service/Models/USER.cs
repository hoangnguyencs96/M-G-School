namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("USER")]
    public partial class USER
    {
        public long UserID { get; set; }

        [StringLength(100)]
        public string UserName { get; set; }

        [StringLength(100)]
        public string PassWord { get; set; }

        public long? EmployeeID { get; set; }

        public bool? Status { get; set; }

        public int? UserType { get; set; }
    }
}
