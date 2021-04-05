using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA.EF;
using Microsoft.AspNet.Identity;

namespace FSDP.UI.MVC.Controllers
{
    [Authorize]
    public class UserDetailsController : Controller
    {
        private FSDPEntities db = new FSDPEntities();

        // GET: UserDetails
        public ActionResult Index()
        {

                string employee = User.Identity.GetUserId();
                var app = db.UserDetails.Where(x => x.UserId == employee);
                return View(app.ToList());
             //shows just the user logged in userdetails

  
            //return View(db.UserDetails.ToList());
        }

        // GET: UserDetails/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // GET: UserDetails/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,FirstName,LastName,Email,PhotoFileName,ResumeFilename")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                db.UserDetails.Add(userDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(userDetail);
        }

        // GET: UserDetails/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,FirstName,LastName,Email,PhotoFileName,ResumeFilename")] UserDetail userDetail, HttpPostedFileBase resumeFile)
        {
            if (ModelState.IsValid)
            {
               

                #region File Upload
                string fileName = "";
                if (resumeFile != null)
                {
                    fileName = resumeFile.FileName;

                    string ext = fileName.Substring(fileName.LastIndexOf('.'));

                    string[] goodExts = { ".pdf", ".docx", ".txt", ".doc" };

                    if (goodExts.Contains(ext.ToLower()) /*&& (resumeFile.ContentLength <= 4194304)*/)
                    {
                        fileName = Guid.NewGuid() + ext;

                        string savePath = Server.MapPath("~/Content/img/resume/");
                        resumeFile.SaveAs(savePath + fileName);
                    }
                    else
                    {
                        fileName = "";
                    }
                    userDetail.ResumeFilename = fileName;
                }
               
                #endregion
                db.Entry(userDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(userDetail);
        }

        // GET: UserDetails/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserDetail userDetail = db.UserDetails.Find(id);
            if (userDetail == null)
            {
                return HttpNotFound();
            }
            return View(userDetail);
        }

        // POST: UserDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            UserDetail userDetail = db.UserDetails.Find(id);
            db.UserDetails.Remove(userDetail);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
