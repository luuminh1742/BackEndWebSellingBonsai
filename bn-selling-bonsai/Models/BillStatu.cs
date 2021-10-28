namespace bn_selling_bonsai.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BillStatu
    {
        public int Id { get; set; }

        public int BillId { get; set; }

        [Required]
        [StringLength(255)]
        public string StatusName { get; set; }

        public byte? Code { get; set; }

        public DateTime ModifiedDate { get; set; }

        public bool Status { get; set; }

        public virtual Bill Bill { get; set; }
    }
}
