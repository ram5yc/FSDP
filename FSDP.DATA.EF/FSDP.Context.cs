//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FSDP.DATA.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class FSDPEntities : DbContext
    {
        public FSDPEntities()
            : base("name=FSDPEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Application> Applications { get; set; }
        public virtual DbSet<ApplicationStatu> ApplicationStatus { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<OpenPosition> OpenPositions { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<UserDetail> UserDetails { get; set; }
    }
}
