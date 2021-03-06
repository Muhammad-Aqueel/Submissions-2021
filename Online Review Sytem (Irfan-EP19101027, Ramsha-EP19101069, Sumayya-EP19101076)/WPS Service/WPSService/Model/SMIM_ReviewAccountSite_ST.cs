//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WPSService.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class SMIM_ReviewAccountSite_ST
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SMIM_ReviewAccountSite_ST()
        {
            this.SRCC_GooglePlus_TR = new HashSet<SRCC_GooglePlus_TR>();
        }
    
        public int AccountSiteID { get; set; }
        public Nullable<int> AccountID { get; set; }
        public Nullable<int> ReviewSiteID { get; set; }
        public Nullable<int> ReviewSiteTypeID { get; set; }
        public string ReviewURL { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> LastScrapeOn { get; set; }
        public Nullable<System.DateTime> SetInActive { get; set; }
        public Nullable<bool> EnableProfile { get; set; }
    
        public virtual SMAM_ReviewSiteTypes_ST SMAM_ReviewSiteTypes_ST { get; set; }
        public virtual SMIM_ReviewAccounts_ST SMIM_ReviewAccounts_ST { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SRCC_GooglePlus_TR> SRCC_GooglePlus_TR { get; set; }
        public virtual SMAM_ReviewSites_ST SMAM_ReviewSites_ST { get; set; }
    }
}
