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
    using System.Collections.Generic;
    
    public partial class Application
    {
        public int ApplicationId { get; set; }
        public int OpenPositionId { get; set; }
        public string UserId { get; set; }
        public System.DateTime ApplicationDate { get; set; }
        public string ManagerNote { get; set; }
        public int ApplicationStatus { get; set; }
        public string ResumeFilename { get; set; }
    
        public virtual ApplicationStatu ApplicationStatu { get; set; }
        public virtual OpenPosition OpenPosition { get; set; }
        public virtual UserDetail UserDetail { get; set; }
    }
}
