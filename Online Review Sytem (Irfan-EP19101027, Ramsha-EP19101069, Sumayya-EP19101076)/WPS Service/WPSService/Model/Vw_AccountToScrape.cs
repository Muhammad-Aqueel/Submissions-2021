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
    
    public partial class Vw_AccountToScrape
    {
        public Nullable<int> SiteID { get; set; }
        public int SiteAccountID { get; set; }
        public Nullable<int> TypeID { get; set; }
        public string Name { get; set; }
        public Nullable<int> AccountID { get; set; }
        public string URL { get; set; }
        public Nullable<System.DateTime> LastPullDate { get; set; }
        public Nullable<int> ReviewTableCount { get; set; }
        public int SubTypeID { get; set; }
        public string SubTypeName { get; set; }
        public string AccountName { get; set; }
        public string Client { get; set; }
        public int LoadDelayMillSeconds { get; set; }
        public int AccountTypeID { get; set; }
        public int CompanyID { get; set; }
        public int OrgID { get; set; }
    }
}
