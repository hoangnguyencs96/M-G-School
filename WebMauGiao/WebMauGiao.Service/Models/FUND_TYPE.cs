namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FUND_TYPE
    {
        [Key]
        public long FundTypeID { get; set; }

        [StringLength(100)]
        public string FundTypeName { get; set; }
    }
}
