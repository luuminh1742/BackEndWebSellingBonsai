namespace bn_selling_bonsai.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Review")]
    public partial class Review
    {
        public int Id { get; set; }

        public int AccountId { get; set; }

        public int ProductId { get; set; }

        public short? Star { get; set; }

        [StringLength(255)]
        public string Content { get; set; }

        public DateTime? CreatedDate { get; set; }

        public bool Status { get; set; }

        public virtual Account Account { get; set; }

        public virtual Product Product { get; set; }
    }
}
