﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ApplicationService.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class UserModelEntities : DbContext
    {
        public UserModelEntities()
            : base("name=UserModelEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<aspnet_Applications> aspnet_Applications { get; set; }
        public virtual DbSet<aspnet_Membership> aspnet_Membership { get; set; }
        public virtual DbSet<aspnet_Paths> aspnet_Paths { get; set; }
        public virtual DbSet<aspnet_PersonalizationAllUsers> aspnet_PersonalizationAllUsers { get; set; }
        public virtual DbSet<aspnet_PersonalizationPerUser> aspnet_PersonalizationPerUser { get; set; }
        public virtual DbSet<aspnet_Profile> aspnet_Profile { get; set; }
        public virtual DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public virtual DbSet<aspnet_SchemaVersions> aspnet_SchemaVersions { get; set; }
        public virtual DbSet<aspnet_Users> aspnet_Users { get; set; }
        public virtual DbSet<aspnet_WebEvent_Events> aspnet_WebEvent_Events { get; set; }
        public virtual DbSet<SMAM_Menu_ST> SMAM_Menu_ST { get; set; }
        public virtual DbSet<SMIM_UserAccess_ST> SMIM_UserAccess_ST { get; set; }
        public virtual DbSet<SMIM_UserMst_ST> SMIM_UserMst_ST { get; set; }
        public virtual DbSet<SMIM_UserType_ST> SMIM_UserType_ST { get; set; }
        public virtual DbSet<SMIM_UserTypeAccess_ST> SMIM_UserTypeAccess_ST { get; set; }
        public virtual DbSet<SMSA_Roles_ST> SMSA_Roles_ST { get; set; }
        public virtual DbSet<SMAM_SystemService_ST> SMAM_SystemService_ST { get; set; }
    }
}