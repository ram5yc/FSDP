using System.Web.Mvc;
using FSDP.UI.MVC.Models;
using System.Net;
using System.Net.Mail;
using System;
using FSDP.DATA.EF;
using Microsoft.AspNet.Identity;
using System.Linq;

namespace FSDP.UI.MVC.Controllers
{
   
    public class HomeController : Controller
    {
        private FSDPEntities db = new FSDPEntities();

        public ActionResult UploadResume(int id)
        {
            UserDetail ud = new UserDetail();
            ud.ResumeFilename = ud.ResumeFilename;
            string userId = User.Identity.GetUserId();

            UserDetail details = db.UserDetails.Where(x => x.UserId == userId).SingleOrDefault();

            ud.ResumeFilename = details.ResumeFilename;
            db.UserDetails.Add(ud);
            db.SaveChanges();

            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        //Post Contact Action 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            //when a class has validation attributes, that validation should be checked BEFORE attempting to process any data.
            if (!ModelState.IsValid)
            {
                //send them back to the form, passing their inputs back to the form with the HTML form
                return View(cvm); //cvm object populates in this return populates the form with what the user input 
            }//end if
            //build the message - what we see when we receive the email
            string body = $"{cvm.Name} has sent you the following message: <br />" + $" <strong>{cvm.Message} </strong><br />from the email address: {cvm.Email}";

            MailMessage mm = new MailMessage(
                //FROM 
                "webadmin@rachelmantei.com",
                //TO - this assumes forwarding from the host
                "webdevrach@gmail.com", //hardcoded forward to this email address
                                        //SUBJECT
                null,
                //BODY
               body
                );

            mm.IsBodyHtml = true;
            //if you want to mark these emails with high priority
            mm.Priority = MailPriority.High;
            //respond to the senders email instead of our own SmarterAsp email address
            mm.ReplyToList.Add(cvm.Email);

            SmtpClient client = new SmtpClient("mail.rachelmantei.com");

            //client creds
            client.Credentials = new NetworkCredential("webadmin@rachelmantei.com", "P@ssw0rd");

            client.Port = 587;


            try
            {
                //attmpt to send email
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We're sorry your request could not be sent at this time. Please try again later. <br/> Error Message:<br/> {ex.StackTrace}";
                return View(cvm);//returns the view WITH the entire message so that users can copy and paste it for later
            }
            //if all goes well, we will return the user to a view that confirms that their message has been sent.
            return View("EmailConfirmation", cvm);
            
        }
    }
}
