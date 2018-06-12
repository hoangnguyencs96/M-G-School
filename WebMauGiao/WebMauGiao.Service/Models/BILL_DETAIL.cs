namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BILL_DETAIL
    {
        [Key]
        public long BillDetailID { get; set; }

        public long? BillID { get; set; }

        public long? FeeID { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }

        public DateTime? Time { get; set; }

        public long? StudentID { get; set; }
    }
}
