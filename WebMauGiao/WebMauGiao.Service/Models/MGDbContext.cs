namespace WebMauGiao.Service.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MGDbContext : DbContext
    {
        public MGDbContext()
            : base("name=MGDbContext")
        {
        }

        public virtual DbSet<ABSENCE> ABSENCEs { get; set; }
        public virtual DbSet<BILL> BILLs { get; set; }
        public virtual DbSet<BILL_DETAIL> BILL_DETAIL { get; set; }
        public virtual DbSet<CLASS> CLASSes { get; set; }
        public virtual DbSet<COURSE> COURSEs { get; set; }
        public virtual DbSet<DEPARTMENT> DEPARTMENTs { get; set; }
        public virtual DbSet<EMPLOYEE> EMPLOYEEs { get; set; }
        public virtual DbSet<FEE> FEEs { get; set; }
        public virtual DbSet<FOOD> FOODs { get; set; }
        public virtual DbSet<FOOD_TYPE> FOOD_TYPE { get; set; }
        public virtual DbSet<FUND> FUNDs { get; set; }
        public virtual DbSet<FUND_TYPE> FUND_TYPE { get; set; }
        public virtual DbSet<LOG> LOGs { get; set; }
        public virtual DbSet<MATERIAL> MATERIALs { get; set; }
        public virtual DbSet<MATERIAL_PROVIDER> MATERIAL_PROVIDER { get; set; }
        public virtual DbSet<PAYMENT> PAYMENTs { get; set; }
        public virtual DbSet<PAYMENT_BILL> PAYMENT_BILL { get; set; }
        public virtual DbSet<PAYMENT_DETAILL> PAYMENT_DETAILL { get; set; }
        public virtual DbSet<PERMISSON> PERMISSONs { get; set; }
        public virtual DbSet<PROVIDER> PROVIDERs { get; set; }
        public virtual DbSet<ROLE> ROLEs { get; set; }
        public virtual DbSet<ROLE_PERMISSION> ROLE_PERMISSION { get; set; }
        public virtual DbSet<SALARY> SALARies { get; set; }
        public virtual DbSet<SALARY_PAYMENT> SALARY_PAYMENT { get; set; }
        public virtual DbSet<SALARY_TYPE> SALARY_TYPE { get; set; }
        public virtual DbSet<STUDENT> STUDENTs { get; set; }
        public virtual DbSet<TIMEKEEPING> TIMEKEEPINGs { get; set; }
        public virtual DbSet<USER> USERs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BILL>()
                .Property(e => e.Amount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<COURSE>()
                .Property(e => e.Schedule)
                .IsUnicode(false);

            modelBuilder.Entity<DEPARTMENT>()
                .Property(e => e.Fax)
                .IsUnicode(false);

            modelBuilder.Entity<DEPARTMENT>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<EMPLOYEE>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<EMPLOYEE>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<EMPLOYEE>()
                .Property(e => e.IdentityID)
                .IsUnicode(false);

            modelBuilder.Entity<EMPLOYEE>()
                .Property(e => e.DealSalary)
                .HasPrecision(18, 0);

            modelBuilder.Entity<FEE>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<FEE>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<FUND>()
                .Property(e => e.FundName)
                .IsFixedLength();

            modelBuilder.Entity<FUND>()
                .Property(e => e.Amount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<LOG>()
                .Property(e => e.Thread)
                .IsUnicode(false);

            modelBuilder.Entity<LOG>()
                .Property(e => e.Level)
                .IsUnicode(false);

            modelBuilder.Entity<LOG>()
                .Property(e => e.Logger)
                .IsUnicode(false);

            modelBuilder.Entity<LOG>()
                .Property(e => e.Message)
                .IsUnicode(false);

            modelBuilder.Entity<LOG>()
                .Property(e => e.Exception)
                .IsUnicode(false);

            modelBuilder.Entity<MATERIAL>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<PAYMENT>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<PAYMENT_BILL>()
                .Property(e => e.Amount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<PAYMENT_BILL>()
                .Property(e => e.PaidAmount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SALARY>()
                .Property(e => e.MonthlyAmount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<STUDENT>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<STUDENT>()
                .Property(e => e.ParentPhone)
                .IsUnicode(false);

            modelBuilder.Entity<STUDENT>()
                .Property(e => e.Height)
                .HasPrecision(18, 0);

            modelBuilder.Entity<STUDENT>()
                .Property(e => e.Weight)
                .HasPrecision(18, 0);

            modelBuilder.Entity<STUDENT>()
                .Property(e => e.BMI)
                .HasPrecision(18, 0);

            modelBuilder.Entity<TIMEKEEPING>()
                .Property(e => e.Value)
                .IsUnicode(false);

            modelBuilder.Entity<USER>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<USER>()
                .Property(e => e.PassWord)
                .IsUnicode(false);
        }
    }
}
