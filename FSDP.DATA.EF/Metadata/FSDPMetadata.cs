using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace FSDP.DATA.EF/*.Metadata*/
{

    #region Application
    public class ApplicationMetadata
    {
        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Open Position")]
        public int OpenPositionId { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "User Identification")]
        [StringLength(128, ErrorMessage = "* Value must be 128 characters or less")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Application Date")]
        [DisplayFormat(DataFormatString = "{0:D}")] //change it to d if the day throws it off
        public System.DateTime ApplicationDate { get; set; }

        [Display(Name = "Manager Notes")]
        [StringLength(200, ErrorMessage = "* Value must be 200 characters or less")]
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string ManagerNote { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Application Status")]
        public int ApplicationStatus { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Resume Filename")]
        [StringLength(75, ErrorMessage = "* Value must be 75 characters or less")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string ResumeFilename { get; set; }
    }
    [MetadataType(typeof(ApplicationMetadata))]
    public partial class Application
    {

    }


    #endregion

    #region ApplicationStatus

    public class ApplicationStatuMetadata
    {
        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Status")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less")]
        public string StatusName { get; set; }

        [Display(Name = "Description")]
        [StringLength(250, ErrorMessage = "* Value must be 250 characters or less")]
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string StatusDescription { get; set; }
    }
    [MetadataType(typeof(ApplicationStatuMetadata))]
    public partial class ApplicationStatu
    {

    }

    #endregion

    #region Location

    public class LocationMetadata
    {
        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Store Number")]
        [StringLength(10, ErrorMessage = "* Value must be 10 characters or less")]
        public string StoreNumber { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "City")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less")]
        public string City { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "State")]
        [StringLength(2, MinimumLength = 2, ErrorMessage = "* Value must be 2 characters or less")] //to make sure they put in two characters
        public string State { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Manager Identification")]
        [StringLength(128, ErrorMessage = "* Value must be 128 characters or less")]
        public string ManagerId { get; set; }
    }
    [MetadataType(typeof(LocationMetadata))]
    public partial class Location
    {

    }


    #endregion

    #region OpenPosition

    public class OpenPositionMetadata
    {
        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Position Identification")]
        public int PositionId { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Location Identification")]
        public int LocationId { get; set; }
    }
    [MetadataType(typeof(OpenPositionMetadata))]
    public partial class OpenPosition
    {

    }

    #endregion

    #region Position

    public class PositionMetadata
    {
        [Required(ErrorMessage = "* Required")]
        [Display(Name = "Title")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less")]
        public string Title { get; set; }

        [Display(Name = "Description")]
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string JobDescription { get; set; }
    }
    [MetadataType(typeof(PositionMetadata))]
    public partial class Position
    {

    }

    #endregion

    public class UserDetailMetadata
    {
        [Required(ErrorMessage = "* Required *")]
        [StringLength(20, ErrorMessage = "* First Name must be 20 characters or less *")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Required *")]
        [StringLength(20, ErrorMessage = "* Last Name must be 20 characters or less *")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string Email { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string PhotoFileName { get; set; }

        [Required(ErrorMessage = "* Required")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string ResumeFilename { get; set; }
    }

    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {
        [Display(Name = "Full Name")]
        public string FullName
        {
            get
            {
                return (FirstName + " " + LastName).Trim();
            }
        }

    }
}

