namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BILL")]
    public partial class BILL
    {
        public long BillID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public long? EmployeeID { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }

        public decimal? Amount { get; set; }

        public long? StudentID { get; set; }
    }
}
