namespace bn_selling_bonsai.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BillDetail")]
    public partial class BillDetail
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public int BillId { get; set; }

        [Required]
        [StringLength(255)]
        public string ProductName { get; set; }

        public int Price { get; set; }

        public short Quantity { get; set; }

        [Required]
        [StringLength(255)]
        public string Image { get; set; }

        public int? Discount { get; set; }

        public virtual Bill Bill { get; set; }

        [JsonIgnore]
        public virtual Product Product { get; set; }
    }
}
