//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class SMSA_Roles_ST
    {
        public System.Guid RoleId { get; set; }
        public string RoleName { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string Header { get; set; }
        public string FormName { get; set; }
    
        public virtual aspnet_Roles aspnet_Roles { get; set; }
    }
}
