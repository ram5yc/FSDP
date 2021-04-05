using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace FSDP.UI.MVC.Models
{
    public class ContactViewModel
    {

        [Required(ErrorMessage="* Your name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage ="* Your email is required")]
        [EmailAddress]
        public string Email { get; set; }

        public string HardCodedStubject
        {
            get { return "Email sent from FDSP"; }
        }

        [UIHint("MultilineText")]
        [Required(ErrorMessage ="* A message is required.")]
        public string Message { get; set; }
    }
}