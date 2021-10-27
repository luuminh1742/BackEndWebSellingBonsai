namespace bn_selling_bonsai.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bill")]
    public partial class Bill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bill()
        {
            BillDetails = new HashSet<BillDetail>();
            BillStatus = new HashSet<BillStatu>();
        }

        public int Id { get; set; }

        public int AccountId { get; set; }

        [Required]
        [StringLength(255)]
        public string RecipientName { get; set; }

        [Required]
        [StringLength(15)]
        public string RecipientPhone { get; set; }

        [Required]
        [StringLength(255)]
        public string RecipientAddress { get; set; }

        [StringLength(255)]
        public string Note { get; set; }

        public int? Shipping { get; set; }

        public int? Subtotal { get; set; }

        public int? Total { get; set; }

        [JsonIgnore]
        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillDetail> BillDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BillStatu> BillStatus { get; set; }
    }
}
