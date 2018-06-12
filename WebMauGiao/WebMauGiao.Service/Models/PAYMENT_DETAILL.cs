namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PAYMENT_DETAILL
    {
        [Key]
        public long PaymentDetailID { get; set; }

        public long? PaymentBillID { get; set; }

        public long? PaymentID { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }

        public DateTime? Time { get; set; }
    }
}
