using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace bn_selling_bonsai.Models
{
    public partial class DBSellingBonsai : DbContext
    {
        public DBSellingBonsai()
            : base("name=DBSellingBonsai")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Bill> Bills { get; set; }
        public virtual DbSet<BillDetail> BillDetails { get; set; }
        public virtual DbSet<BillStatu> BillStatus { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .Property(e => e.RoleCode)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Bills)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Reviews)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Bill>()
                .Property(e => e.RecipientPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Bill>()
                .HasMany(e => e.BillDetails)
                .WithRequired(e => e.Bill)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Bill>()
                .HasMany(e => e.BillStatus)
                .WithRequired(e => e.Bill)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BillStatu>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.ProductDetail)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.BillDetails)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.Reviews)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.ProductCategory)
                .HasForeignKey(e => e.CategoryId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Accounts)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);
        }
    }
}
