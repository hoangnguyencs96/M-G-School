namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SALARY_PAYMENT
    {
        [Key]
        public long SalaryPaymentID { get; set; }

        public long? EmployeeID { get; set; }

        public long? SalaryID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Date { get; set; }

        [Column(TypeName = "date")]
        public DateTime? PaidDate { get; set; }

        public bool? Status { get; set; }
    }
}
