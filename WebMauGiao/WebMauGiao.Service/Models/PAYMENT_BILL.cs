namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PAYMENT_BILL
    {
        [Key]
        public long PaymentBillID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public long? EmployeeID { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }

        public decimal? Amount { get; set; }

        public bool? Status { get; set; }
    }
}
