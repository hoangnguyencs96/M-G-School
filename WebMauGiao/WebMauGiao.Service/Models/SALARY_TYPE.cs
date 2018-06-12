namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SALARY_TYPE
    {
        [Key]
        public long SalaryTypeID { get; set; }

        [StringLength(100)]
        public string SalaryTypeName { get; set; }
    }
}
