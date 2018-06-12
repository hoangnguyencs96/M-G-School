namespace WebMauGiao.Service.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PROVIDER")]
    public partial class PROVIDER
    {
        public long ProviderID { get; set; }

        [StringLength(100)]
        public string ProviderName { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartTime { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndTime { get; set; }

        [Column(TypeName = "ntext")]
        public string Comment { get; set; }
    }
}
