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
    
    public partial class SMAM_ReviewSites_ST
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SMAM_ReviewSites_ST()
        {
            this.SMIM_ReviewAccountSite_ST = new HashSet<SMIM_ReviewAccountSite_ST>();
        }
    
        public int SiteID { get; set; }
        public string SiteName { get; set; }
        public string ShortName { get; set; }
        public Nullable<int> TimerValue { get; set; }
        public Nullable<System.DateTime> LastScrapeOn { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public string Color { get; set; }
        public string ImageURL { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SMIM_ReviewAccountSite_ST> SMIM_ReviewAccountSite_ST { get; set; }
    }
}
