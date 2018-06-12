namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SALARY")]
    public partial class SALARY
    {
        public long SalaryID { get; set; }

        [StringLength(100)]
        public string SalaryName { get; set; }

        public decimal? MonthlyAmount { get; set; }

        public long? SalaryTypeID { get; set; }
    }
}
