namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FUND")]
    public partial class FUND
    {
        public long FundID { get; set; }

        [StringLength(10)]
        public string FundName { get; set; }

        public decimal? Amount { get; set; }

        public long? EmployeeID { get; set; }
    }
}
